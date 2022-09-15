// 재단 정보 조회
// 재단 리스트 조회
// 기부 전체조회(재단이 받은 기부 목록)

// await api.post(`/api/follow`, {data: follow}).then(success).catch(fail); // body에 담을 때 이렇게 요청보내면 됨

import { apiInstance } from "./index.js";
const api = apiInstance();


// 재단 정보 조회
async function foundationInfo(foundationSeq, success, fail) {
    console.log(foundationSeq)
    await api.get(`/api/foundations/${foundationSeq}`,).then(success).catch(fail);
}


// 재단 리스트 조회
async function foundationList(success, fail) {
    await api.get(`/api/foundations/list`,).then(success).catch(fail);
}


// 기부 전체조회(재단이 받은 기부 목록)
async function foundationDonationList(foundationSeq, success, fail) {
    await api.get(`/api/donations/foundationList/${foundationSeq}`,).then(success).catch(fail);
}


export {
    foundationInfo,
    foundationList,
    foundationDonationList,
}