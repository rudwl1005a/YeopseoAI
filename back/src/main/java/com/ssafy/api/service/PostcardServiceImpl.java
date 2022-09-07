package com.ssafy.api.service;

import com.ssafy.common.util.S3Uploader;
import com.ssafy.db.entity.Postcard;
import com.ssafy.db.repository.PostcardRepository;
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

    @Override
    @Transactional
    public String savePostcard(MultipartFile multipartFile, List<String> tag, String userId){
        String result;
        try{
            // S3에 저장
            result = s3Uploader.upload(multipartFile, userId + "/" + multipartFile.getOriginalFilename());
        } catch(Exception e){
            return "S3에 저장을 실패했습니다.";
        }

        try{
            Postcard postcard = new Postcard();
            /** TODO
             * userId -> userSeq로 바꾸고 제작자 seq넣어주기
             */
            postcard.setUserSeq(1);
            postcard.setPostcard_image_url(result);
        } catch (Exception e){
            return "DB에 저장을 실패했습니다.";
        }

        return result;
    }
}
