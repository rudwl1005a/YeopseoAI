// 재단 정보 조회
// 재단 리스트 조회
// 기부 전체조회(재단이 받은 기부 목록)

import { donate, donationInfo } from "@/api/donation.js";

const donationStore = {
  namespaced: true,
  state: {
    donationInfo: [],
  },

  getters: {
    donationInfo(state) {
      return state.donationInfo;
    },
  },

  mutations: {
    SET_DONATIONINFO: (state, donationInfo) => {
      state.donationInfo = donationInfo;
    },
    SET_STATE: (state) => {
      const initialState = { donationInfo: [] };
      Object.assign(state, initialState);
    },
  },

  actions: {
    // 기부정보 조회
    async getDonationInfo({ commit }, foundationSeq) {
      await donationInfo(
        foundationSeq,
        (response) => {
          console.log("기부정보 들고왔어요");
          console.log(response.data);
          commit("SET_DONATIONINFO", response.data);
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 기부 요청(첫 인자는 state가 오기 때문에 사용 안해도 뭐 넣어야
    // 인자를 제대로 받음)
    async doDonate({ commit }, info) {
      commit;
      await donate(
        info,
        () => {
          console.log("기부 완료");
        },
        (error) => {
          console.log(error);
        }
      );
    },
    //state 리셋
    donationStoreReset({ commit }) {
      commit("SET_STATE");
    },
  },
};

export default donationStore;
