import { apiInstance } from "./index.js";
const api = apiInstance();

// 메인페이지에서 필요한 요청 사항은?
// 인기 엽서 목록 대략 10개
// 인기 재단 목록 대략 10개

async function getFamousLetter(success, fail) { // 인기 편지 목록
    await api.get(`/api/postcards/top-list`).then(success).catch(fail);
}

async function getFamousFoundation(success, fail) { // 인기 재단 목록
    await api.get(`/api/foundations/list/top`).then(success).catch(fail);
}

export {
    getFamousLetter,
    getFamousFoundation,
}