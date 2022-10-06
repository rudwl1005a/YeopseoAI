// 기부 등록
// 기부 상세조회

// await api.post(`/api/follow`, {data: follow}).then(success).catch(fail); // body에 담을 때 이렇게 요청보내면 됨

// import axios from "axios";
import { apiInstance } from "./index.js";
const api = apiInstance();

// 기부 등록
// donationInfo = {
//   "donationImgUrl": "string",
//   "donationPay": 100000,
//   "donationText": "안녕하세요",
//   "foundationSeq": 1,
//   "userSeq": 1
// }

//기부
async function donate(donationInfo, success, fail) {
  // console.log(donationInfo);
  await api
    .post(`/api/donations`, JSON.stringify(donationInfo))
    .then(success)
    .catch(fail);
}

// // 결제
// async function pay(payInfo, success, fail) {
//   await axios
//     .post("https://kapi.kakao.com/v1/payment/ready")
//     .then(success)
//     .catch(fail);
// }

// 기부 상세조회
async function donationInfo(donationSeq, success, fail) {
  await api.get(`/api/donations/${donationSeq}`).then(success).catch(fail);
}

export { donate, donationInfo };
