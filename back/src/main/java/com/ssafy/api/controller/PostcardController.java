package com.ssafy.api.controller;

import com.ssafy.api.service.PostcardService;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 엽서 관련 API 요청 처리를 위한 컨트롤러 정의.
 */
@Api(value = "엽서 API", tags = {"Postcard"})
@RestController
@RequestMapping("/api/postcards")
public class PostcardController {

    @Autowired
    PostcardService postcardService;

    @PostMapping()
    @ApiOperation(value = "엽서 업로드", notes = "엽서 파일과 태그로 엽서를 등록한다")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 401, message = "업로드 실패"),
            @ApiResponse(code = 404, message = "사용자 없음"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    public ResponseEntity<?> insert(@RequestPart @ApiParam(value = "엽서 사진 파일", required = true) MultipartFile postcard,
                                    @RequestPart List<String> tag, @RequestPart String userId){

        String result = postcardService.savePostcard(postcard, tag, userId);
        if(result.equals("S3에 저장을 실패했습니다.") || result.equals("DB에 저장을 실패했습니다.")){
            return ResponseEntity.status(401).body(result);
        } else {
            return ResponseEntity.status(200).body("엽서 업로드를 성공했습니다.");
        }

    }

}
