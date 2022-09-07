package com.ssafy.api.service;

import com.ssafy.common.util.S3Uploader;
import com.ssafy.db.entity.Postcard;
import com.ssafy.db.entity.PostcardLike;
import com.ssafy.db.entity.Tag;
import com.ssafy.db.repository.PostcardLikeRepository;
import com.ssafy.db.repository.PostcardRepository;
import com.ssafy.db.repository.TagRepository;
import com.ssafy.db.repository.UserRepository;
import org.joda.time.DateTime;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * 엽서 관련 비즈니스 로직 처리를 위한 서비스 구현 정의.
 */
@Service("postcardService")
public class PostcardServiceImpl implements PostcardService{

    @Autowired
    S3Uploader s3Uploader;

    @Autowired
    PostcardRepository postcardRepository;

    @Autowired
    PostcardLikeRepository postcardLikeRepository;

    @Autowired
    TagRepository tagRepository;

    @Autowired
    UserRepository userRepository;

    /**
     * 엽서 업로드 메서드
     */
    @Override
    @Transactional
    public String savePostcard(MultipartFile multipartFile, List<String> tag, String userId) throws IOException {
        String result;
        try{
            // S3에 저장
            LocalDateTime today = LocalDateTime.now();
            result = s3Uploader.upload(multipartFile, userId + "/" + today.toString().substring(0,10));
        } catch(Exception e){
            e.printStackTrace();
            return "S3에 저장을 실패했습니다.";
        }

        Postcard savePostcard;
        try{
            Postcard postcard = new Postcard();
            int userSeq = userRepository.findByUserId(userId).getUserSeq();
            postcard.setUserSeq(userSeq);
            postcard.setPostcardImgUrl(result);
            savePostcard = postcardRepository.save(postcard);
        } catch (Exception e){
            e.printStackTrace();
            return "DB에 저장을 실패했습니다.";
        }

        // tag 설정
        try {
            for(String t : tag) {
                Tag oneTag = new Tag();
                oneTag.setPostcardSeq(savePostcard.getPostcardSeq());
                oneTag.setTagContent(t);
                tagRepository.save(oneTag);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "DB에 저장을 실패했습니다.";
        }

        return result;
    }

    /**
     * 엽서 삭제 메서드
     */
    @Transactional
    public void deletePostcard(int postcardSeq) throws IOException {
        // 태그들 삭제
        tagRepository.deleteTagsByPostcardSeq(postcardSeq);
        // 좋아요 삭제
        postcardLikeRepository.deletePostcardLikesByPostcardSeq(postcardSeq);
        // 엽서 삭제
        postcardRepository.deleteById(postcardSeq);
    }

    /**
     * 엽서 좋아요 추가 메서드
     */
    public boolean savePostcardLike(int postcardSeq, int userSeq) throws IOException {
        if(postcardLikeRepository.findPostcardLikeByPostcardSeqAndUserSeq(postcardSeq, userSeq) != null) {
            return false;
        }

        try {
            PostcardLike postcardLike = new PostcardLike();
            postcardLike.setPostcardSeq(postcardSeq);
            postcardLike.setUserSeq(userSeq);
            postcardLikeRepository.save(postcardLike);
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }

        return true;
    }

    /**
     * 엽서 좋아요 삭제 메서드
     */
    @Transactional
    public boolean deletePostcardLike(int postcardSeq, int userSeq) throws IOException {
        PostcardLike postcardLike = postcardLikeRepository.findPostcardLikeByPostcardSeqAndUserSeq(postcardSeq, userSeq);
        if(postcardLike == null){
            return false;
        }

        try {
            postcardLikeRepository.deletePostcardLikeByPostcardSeqAndUserSeq(postcardSeq, userSeq);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    /**
     * 엽서 상세정보 조회
     */
    public Postcard selectPostcard(int postcardSeq) throws IOException {
        return postcardRepository.findById(postcardSeq).get();
    }

    /**
     * 엽서 리스트 조회
     */
    @Override
    public List<Postcard> selectPostcardList(int userSeq) throws IOException {
        return postcardRepository.findAllByUserSeq(userSeq);
    }

    /**
     * 엽서 상위 리스트 조회
     */
    @Override
    public List<Postcard> selectPostcardTopList() throws IOException {
        return null;
    }
}
