// 엽서 업로드
// 엽서 상세정보 조회
// 엽서 삭제
// 엽서 좋아요 추가
// 엽서 좋아요 삭제
// 엽서 리스트 조회
// 인기 엽서 리스트 조회

// await api.post(`/api/follow`, {data: follow}).then(success).catch(fail); // body에 담을 때 이렇게 요청보내면 됨

import { apiInstance } from "./index.js";
const api = apiInstance();


// 엽서 업로드
// postcardInfo = {postcard: 이미지파일, tag: [태그리스트], userId: 'string',}
async function uploadPostcardjs(postcardObj, success, fail) {
    console.log(postcardObj);
    let userId = postcardObj.userId;
    let postcardInfo = postcardObj.posdcard;
    await api.post(`/api/postcards/${userId}`, postcardInfo).then(success).catch(fail);
}

// 엽서 태그 넣기
async function uploadTagjs(tagObj, success, fail) {
    let postcardSeq = tagObj.postcardSeq;
    let tagList = tagObj.tagList;
    await api.post(`/api/postcards/tag${postcardSeq}`, JSON.stringify(tagList)).then(success).catch(fail);
}


// 엽서 상세정보 조회
async function postcardInfojs(postcardSeq, success, fail) {
    await api.get(`/api/postcards/${postcardSeq}`,).then(success).catch(fail);
}


// 엽서 삭제
async function deletePostcardjs(postcardSeq, success, fail) {
    await api.delete(`/api/postcards/${postcardSeq}`,).then(success).catch(fail);
}


// 엽서 좋아요 추가
// likePostcardInfo = {postcardSeq: , userSeq: }
async function userLikePostcardjs(likePostcardInfo, success, fail) {
    await api.post(`/api/postcards/${likePostcardInfo.postcardSeq}/${likePostcardInfo.userSeq}`,).then(success).catch(fail);
}


// 엽서 좋아요 삭제
// likePostcardInfo = {postcardSeq: , userSeq: }
async function userUnlikePostcardjs(likePostcardInfo, success, fail) {
    await api.delete(`/api/postcards/${likePostcardInfo.postcardSeq}/${likePostcardInfo.userSeq}`,).then(success).catch(fail);
}


// 엽서 리스트 조회
async function postcardListjs(userSeq, success, fail) {
    await api.get(`/api/postcards/list/${userSeq}`,).then(success).catch(fail);
}


// 인기 엽서 리스트 조회
async function popularPostcardListjs(success, fail) {
    await api.get(`/api/postcards/top-list`,).then(success).catch(fail);
}


export {
    uploadPostcardjs,
    uploadTagjs,
    postcardInfojs,
    deletePostcardjs,
    userLikePostcardjs,
    userUnlikePostcardjs,
    postcardListjs,
    popularPostcardListjs,
}