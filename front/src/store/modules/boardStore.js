import {
  // postBoard, commit 해줄 필요 없는 애는 일단 vue 페이지에서 바로 요청 보내는걸로
  // patchBoard,
  // deleteBoard,
  detailBoard,
  listBoard,
} from "@/api/board.js";

const boardStore = {
  namespaced: true,
  state: {
    watchingBoard: [],
    noticeList: [],
    questionList: [],
  },
  getters: {},
  mutations: {
    SET_DETAILBOARD: (state, board) => {
      state.watchingBoard = board;
    },
    SET_NOTICEBOARDLIST: (state, boards) => {
      state.noticeList = boards;
    },
    SET_QUESTIONBOARDLIST: (state, boards) => {
      state.questionList = boards;
    },
  },
  actions: {
    // 게시글 상세조회
    async detailBoardStore({ commit }, boardSeq) {
      await detailBoard(
        boardSeq,
        (response) => {
          console.log(response);
          commit('SET_DETAILBOARD', response); // response 형태 보고 확정
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 게시글 목록 받기
    async listBoardStore({ commit }, boardCode) {
      await listBoard(
        boardCode,
        (response) => {
          console.log(response.data);
          if (boardCode === 201) {
            commit('SET_NOTICEBOARDLIST', response.data);
          } else if (boardCode === 202) {
            commit('SET_QUESTIONBOARDLIST', response.data);
          }
        },
        (error) => {
          console.log(error);
        }
      );
    }
  },
}

export default boardStore;