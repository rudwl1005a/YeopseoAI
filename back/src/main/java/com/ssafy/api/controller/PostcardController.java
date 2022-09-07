package com.ssafy.api.controller;

import com.ssafy.api.request.PostcardPostReq;
import com.ssafy.api.service.PostcardService;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
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

    @PostMapping(consumes = {"multipart/form-data"})
    @ApiOperation(value = "엽서 업로드", notes = "엽서 파일과 태그로 엽서를 등록한다")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 401, message = "업로드 실패"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    public ResponseEntity<?> insert(@ModelAttribute @ApiParam("엽서 업로드 객체") PostcardPostReq postcardPostReq) throws IOException {
        MultipartFile postcard = postcardPostReq.getPostcard();
        List<String> tag = postcardPostReq.getTag();
        String userId = postcardPostReq.getUserId();

        String result = postcardService.savePostcard(postcard, tag, userId);
        if(result.equals("S3에 저장을 실패했습니다.") || result.equals("DB에 저장을 실패했습니다.")){
            return ResponseEntity.status(401).body(result);
        } else {
            return ResponseEntity.status(200).body("엽서 업로드를 성공했습니다.");
        }

    }

    @ApiOperation(value = "엽서 삭제", notes = "엽서 seq로 엽서 삭제")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 401, message = "삭제 실패"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    @DeleteMapping("/{postcardSeq}")
    public ResponseEntity<?> delete(@PathVariable @ApiParam("삭제할 엽서 seq") int postcardSeq) throws IOException {

        try {
            postcardService.deletePostcard(postcardSeq);
        } catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.status(401).body("삭제에 실패했습니다.");
        }

        return ResponseEntity.status(200).body(postcardSeq + "번째 엽서를 삭제했습니다.");
    }

    @ApiOperation(value = "엽서 좋아요 추가", notes = "엽서seq와 유저seq로 좋아요 추가")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 401, message = "좋아요 실패"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    @PostMapping("/{postcardSeq}/{userSeq}")
    public ResponseEntity<?> insertLike(@PathVariable(value = "postcardSeq") @ApiParam("엽서seq") int postcardSeq,
                                        @PathVariable(value = "userSeq") @ApiParam("유저Seq") int userSeq) throws IOException {
        boolean result = postcardService.savePostcardLike(postcardSeq, userSeq);
        if(!result) {
            return ResponseEntity.status(401).body("좋아요를 할 수 없습니다.");
        } else {
            return ResponseEntity.status(200).body(userSeq + "번째 유저가 " + postcardSeq + "번째 엽서를 좋아요 눌렀습니다.");
        }
    }

    @ApiOperation(value = "엽서 좋아요 삭제", notes = "엽서seq와 유저seq로 좋아요 삭제")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 401, message = "좋아요 삭제 실패"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    @DeleteMapping("/{postcardSeq}/{userSeq}")
    public ResponseEntity<?> deleteLike(@PathVariable(value = "postcardSeq") @ApiParam("엽서seq") int postcardSeq,
                                        @PathVariable(value = "userSeq") @ApiParam("유저Seq") int userSeq) throws IOException {
        boolean result = postcardService.deletePostcardLike(postcardSeq, userSeq);
        if(!result) {
            return ResponseEntity.status(401).body("좋아요 삭제를 할 수 없습니다.");
        } else {
            return ResponseEntity.status(200).body(userSeq + "번째 유저가 " + postcardSeq + "번째 엽서 좋아요를 삭제했습니다.");
        }
    }
}
