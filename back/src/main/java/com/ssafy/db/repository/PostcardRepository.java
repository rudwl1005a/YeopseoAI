package com.ssafy.db.repository;

import com.ssafy.db.entity.Postcard;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * 엽서 모델 관련 디비 쿼리 생성을 위한 JPA Query Method 인터페이스 정의.
 */
public interface PostcardRepository extends JpaRepository<Postcard, Integer> {

    List<Postcard> findAllByUserSeq(int userSeq);

}
