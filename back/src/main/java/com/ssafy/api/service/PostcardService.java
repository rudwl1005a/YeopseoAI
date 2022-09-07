package com.ssafy.api.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 *	엽서 관련 비즈니스 로직 처리를 위한 서비스 인터페이스 정의.
 */
public interface PostcardService {
    String savePostcard(MultipartFile multipartFile, List<String> tag, String userId);
}
