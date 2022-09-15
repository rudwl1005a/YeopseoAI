import {
  getFamousLetter,
  getFamousFoundation,
  likeLetter,
  dislikeLetter,
  letterDetail,
} from "@/api/mainpage.js";

const mainpageStore = {
  namespaced: true,
  state: {
    letterTop: [],
    foundationTop: [],
    watchingLetter: [],
  },
  getters: {},
  mutations: {
    SET_FAMOUSLETTER: (state, letters) => {
      state.letterTop = letters;
    },
    SET_FAMOUSFOUNDATION: (state, foundations) => {
      state.foundationTop = foundations;
    },
    SET_LETTERDETAIL: (state, letter) => {
      state.watchingLetter = letter;
    },
  },
  actions: {
    async getFamousLetterStore({ commit }) {
      // 인기 편지 목록 받아오기
      await getFamousLetter(
        (response) => {
          console.log("인기 편지 데이터 어떻게 들어오는지 확인");
          console.log(response.data.postcardList);
          commit("SET_FAMOUSLETTER", response.data.postcardList);
        },
        (error) => {
          console.log(error);
        }
      );
    },

    async getFamousFoundationStore({ commit }) {
      // 인기 재단 목록 받아오기
      await getFamousFoundation(
        (response) => {
          console.log("인기 재단 데이터 어떻게 들어오는지 확인");
          console.log(response);
          commit("SET_FAMOUSFOUNDATION", response.data);
        },
        (error) => {
          console.log(error);
        }
      );
    },

    async getLetterDetail({ commit }, postcardSeq) {
      await letterDetail(
        postcardSeq,
        (response) => {
          console.log("엽서 세부사항 어떻게 들어오는지 확인");
          console.log(response);
          commit("SET_LETTERDETAIL", response.data);
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 엽서 좋아요 부분 -> commit 없앤채로 사용할지, store를 사용하지 말지 정해야 함. 요청
    // 보내보고 결정하자
    async likeLetterStore(postcardSeq, userSeq) {
      await likeLetter(
        postcardSeq,
        userSeq,
        (response) => {
          console.log(response);
        },
        (error) => {
          console.log(error);
        }
      );
    },

    async dislikeLetterStore(postcardSeq, userSeq) {
      await dislikeLetter(
        postcardSeq,
        userSeq,
        (response) => {
          console.log(response);
        },
        (error) => {
          console.log(error);
        }
      );
    },
  },
};

export default mainpageStore;
