// 회원 탈퇴
// 회원정보 수정
// 프사 변경
// 기부 전체조회
// 기부 상세조회
// 친구목록 불러오기
// 탬플릿 변경
// 탬플릿에 보여줄 기부정보 변경

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


// 프사 변경
async function changeProfile(profileInfo, success, fail) {
    // console.log('프로필 정보=============')
    // console.log(profileInfo)
    let user_seq = profileInfo.user_seq
    let profile = profileInfo.profile
    // console.log()
    // for (var pair of profile.entries()) {
    //     console.log(pair[0]+ ', ' + pair[1]); 
    //   }
    // console.log(profile)
    await api.patch(`/api/users/profile/${user_seq}`, profile).then(success).catch(fail);
}


// 기부 전체조회(회원의 기부목록)
async function donationList(user_seq, success, fail) {
    await api.get(`/api/donations/userList/${user_seq}`).then(success).catch(fail);
}


// 팔로우 리스트 조회
async function followList(myId, success, fail) {
    await api.get(`/api/follows/${myId}`).then(success).catch(fail);
} 


// 탬플릿 변경
async function callChangeTemplate(templateInfo, success, fail) {
    // console.log(templateInfo)
    await api.patch(`/api/users/template/${templateInfo.userSeq}`, JSON.stringify(templateInfo.userTemplate)).then(success).catch(fail);
} 


// 탬플릿에 보여줄 기부정보 변경
async function callChangeRemind(remindInfo, success, fail) {
    await api.patch(`/api/users/template/${remindInfo.userSeq}/${remindInfo.uesrRemind}`, JSON.stringify({ donationSeq: remindInfo.donationSeq })).then(success).catch(fail);
} 


// 팔로우요청
async function addFollow(followInfo, success, fail) {
    await api.post(`/api/follows/${followInfo.myId}/${followInfo.followId}`, ).then(success).catch(fail);
} 


// 언팔요청
async function deleteFollow(followInfo, success, fail) {
    await api.delete(`/api/follows/${followInfo.myId}/${followInfo.followId}`, ).then(success).catch(fail);
} 



export {
    usersecession,
    userUpdate,
    changeProfile,
    donationList,
    followList,
    callChangeTemplate,
    callChangeRemind,
    addFollow,
    deleteFollow,
}