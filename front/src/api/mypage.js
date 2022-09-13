// 회원 탈퇴
// 회원정보 수정
// 프사 변경
// 기부 전체조회
// 기부 상세조회
// 친구목록 불러오기

// await api.post(`/api/follow`, {data: follow}).then(success).catch(fail); // body에 담을 때 이렇게 요청보내면 됨

import { apiInstance } from "./index.js";
const api = apiInstance();


// 회원 탈퇴
async function usersecession(user_seq, success, fail) {
    await api.delete(`/api/users/${user_seq}`).then(success).catch(fail);
}


// 회원 정보수정
// updateInfo.info = {userPassword: , userPhone: , userEmail: }
async function userUpdate(updateInfo, success, fail) {
    await api.patch(`/api/users/${updateInfo.user_seq}`, JSON.stringify(updateInfo.info)).then(success).catch(fail);
}


// 프로필사진 변경
async function changeProfile(profileInfo, success, fail) {
    await api.delete(`/api/users/profile/${profileInfo.user_seq}`, JSON.stringify(profileInfo.profile)).then(success).catch(fail);
}


// 회원의 기부목록
async function donationList(user_seq, success, fail) {
    await api.get(`/api/donations/userList/${user_seq}`).then(success).catch(fail);
}


// 팔로우 리스트 조회
async function followList(user_seq, success, fail) {
    await api.get(`/api/donations/userList/${user_seq}`).then(success).catch(fail);
} 

export {
    usersecession,
    userUpdate,
    changeProfile,
    donationList,
    followList,
}