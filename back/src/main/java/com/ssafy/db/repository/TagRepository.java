package com.ssafy.db.repository;

import com.ssafy.db.entity.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 엽서 태그 모델 관련 디비 쿼리 생성을 위한 JPA Query Method 인터페이스 정의.
 */
public interface TagRepository extends JpaRepository<Tag, Integer> {
    void deleteTagsByPostcardSeq(int postcardSeq);

}
