import { apiInstance } from "./index.js";
const api = apiInstance();

// 계정관련

async function login(user, success, fail) {
  // 로그인
  await api.post(`api/login`, JSON.stringify(user)).then(success).catch(fail);
}

async function signup(user, success, fail) {
  // 회원가입
  await api.post(`api/users`, JSON.stringify(user)).then(success).catch(fail);
}

async function userDetail(userPk, success, fail) {
  // 유저정보
  await api.get(`api/users/${userPk}`).then(success).catch(fail);
}

async function checkID(userId, success, fail) {
  // ID 중복체크
  await api.get(`api/users/check/${userId}`).then(success).catch(fail);
}

async function logout(success, fail) {
  // 로그아웃(url 등 변경 필요)
  await api.get(`api/users/`).then(success).catch(fail);
}

export { login, signup, userDetail, checkID, logout };
