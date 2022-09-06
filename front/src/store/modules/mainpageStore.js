import {
  getFamousLetter,
  getFamousFoundation,
} from "@/api/mainpage.js"

const mainpageStore = {
  namespaced: true,
  state: {
    letterTop: [],
    foundationTop: [],
  },
  getters: {

  },
  mutations: {
    SET_FAMOUSLETTER: (state, letters) => {
      state.letterTop = letters;
    },
    SET_FAMOUSFOUNDATION: (state, foundations) => {
      state.foundationTop = foundations;
    }
  },
  actions: {
    async getFamousLetterStore({ commit }) { // 인기 편지 목록 받아오기
      await getFamousLetter(
        (response) => {
          console.log("인기 편지 데이터 어떻게 들어오는지 확인");
          console.log(response);
          commit('SET_FAMOUSLETTER', response.data);
        },
        (error) => {
          console.log(error);
        }
      )
    },

    async getFamousFoundationStore({ commit }) { // 인기 재단 목록 받아오기
      await getFamousFoundation(
        (response) => {
          console.log("인기 재단 데이터 어떻게 들어오는지 확인");
          console.log(response);
          commit('SET_FAMOUSFOUNDATION', response.data);
        },
        (error) => {
          console.log(error);
        }
      )
    },
  },
};

export default mainpageStore;