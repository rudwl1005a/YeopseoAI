package com.ssafy.api.service;

import com.ssafy.db.entity.Postcard;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 *	엽서 관련 비즈니스 로직 처리를 위한 서비스 인터페이스 정의.
 */
public interface PostcardService {
    String savePostcard(MultipartFile multipartFile, List<String> tag, String userId) throws IOException;
    void deletePostcard(int postcardSeq) throws IOException;

    boolean savePostcardLike(int postcardSeq, int userSeq) throws IOException;
    boolean deletePostcardLike(int postcardSeq, int userSeq) throws IOException;

    Postcard selectPostcard(int postcardSeq) throws IOException;
    List<Postcard> selectPostcardList(int userSeq) throws IOException;
    List<Postcard> selectPostcardTopList() throws IOException;
}
