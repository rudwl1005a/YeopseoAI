// 엽서 업로드
// 엽서 상세정보 조회
// 엽서 삭제
// 엽서 좋아요 추가
// 엽서 좋아요 삭제
// 엽서 리스트 조회
// 인기 엽서 리스트 조회
// 좋아요 누른 엽서 리스트 조회
// 팔로우중인 엽서 리스트 조회

import {
  uploadPostcardjs,
  uploadTagjs,
  postcardInfojs,
  deletePostcardjs,
  userLikePostcardjs,
  userUnlikePostcardjs,
  postcardListjs,
  popularPostcardListjs,
  userLikedPostcardjs,
  userLikedPostcard,
} from "@/api/postcard.js";

import {
  sendTransform,
} from "@/api/ai.js";

const postcardStore = {
  namespaced: true,
  state: {
    uploadedPostcard: [],
    postcardInfo: [],
    postcardList: [],
    popularPostcardList: [],
    justUploadedPostcard: [],
    userLikedPostcard: [],
    likedPostcards: [],
    aiTransformResult: '',
    filterCode: 1,
    beforeTransformImg: '',
  },

  getters: {
    uploadedPostcard(state) {
      return state.uploadedPostcard;
    },
    postcardInfo(state) {
      return state.postcardInfo;
    },
    postcardList(state) {
      return state.postcardList;
    },
    popularPostcardList(state) {
      return state.postcardList;
    },
    userLikedPostcard(state) {
      return state.userLikedPostcard;
    },
    likedPostcards(state) {
      return state.likedPostcards;
    },    
    aiTransformResult(state) {
      return state.aiTransformResult;
    },
    transformInfo(state) {
      return state.transformInfo;
    },
    filterCode(state) {
      return state.filterCode;
    },
    beforeTransformImg(state) {
      return state.beforeTransformImg;
    },
  },

  mutations: {
    SET_UPLOADEDPOSTCARD: (state, uploadedPostcard) => {
      state.uploadedPostcard = uploadedPostcard;
    },
    SET_POSTCARDINFO: (state, postcardInfo) => {
      state.postcardInfo = postcardInfo;
    },
    SET_POSTCARDLIST: (state, postcardList) => {
      state.postcardList = postcardList;
    },
    SET_POPULARPOSTCARDLIST: (state, popularPostcardList) => {
      state.popularPostcardList = popularPostcardList;
    },
    SET_DUMMYCOMMIT: () => {
      // console.log("zz");
    },
    SET_JUSTUPLOADED: (state, postcard) => {
      state.justUploadedPostcard = postcard;
    },
    SET_USERLIKEDPOSTCARD: (state, userLikedPostcard) => {
      state.userLikedPostcard = userLikedPostcard;
    },
    SET_LIKEDPOSTCARD: (state, likedPostcards) => {
      state.likedPostcards = likedPostcards;
    },
    SET_STATE: (state) => {
      const initialState = {
        uploadedPostcard: [],
        postcardInfo: [],
        postcardList: [],
        popularPostcardList: [],
        justUploadedPostcard: [],
        userLikedPostcard: [],
        likedPostcards: [],
      };
      Object.assign(state, initialState);
    },
    SET_AITRANSFORMRESULT: (state, aiTransformResult) => {
      state.aiTransformResult = aiTransformResult;
    },
    SET_FILTERCODE: (state, filterCode) => {
      state.filterCode = filterCode;
    },
    SET_BEFORETRANSFORMIMG: (state, beforeTransformImg) => {
      state.beforeTransformImg = beforeTransformImg;
    },
  },

  actions: {
    // 엽서 업로드
    // postcardInfo = {postcard: 이미지파일, tag: [태그리스트], userId: 'string',}
    async uploadPostcard({ commit }, postcardObj) {
      // console.log(postcardObj);
      await uploadPostcardjs(
        postcardObj,
        (response) => {
          // console.log("엽서 업로드됐어요");
          commit("SET_JUSTUPLOADED", response.data);
          // console.log(response);
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 엽서 태그 수정
    async uploadTag({ commit }, tagObj) {
      // console.log(tagObj);
      await uploadTagjs(
        tagObj,
        () => {
          // console.log(response);
          commit("SET_DUMMYCOMMIT");
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 엽서 상세정보 조회
    async getPostcardInfo({ commit }, postcardSeq) {
      await postcardInfojs(
        postcardSeq,
        (response) => {
          // console.log("엽서 상세정보 들고왔어요");
          // console.log(response.data);
          commit("SET_POSTCARDINFO", response.data);
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 엽서 삭제
    async deletePostcard(postcardInfo) {
      await deletePostcardjs(
        postcardInfo,
        () => {
          // console.log("엽서 삭제했어요");
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 엽서 좋아요 추가
    // likePostcardInfo = {postcardSeq: , userSeq: }
    async userLikePostcard(likePostcardInfo) {
      await userLikePostcardjs(
        likePostcardInfo,
        () => {
          // console.log("엽서 좋아요 했어요");
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 엽서 좋아요 삭제
    // likePostcardInfo = {postcardSeq: , userSeq: }
    async userUnlikePostcard(likePostcardInfo) {
      await userUnlikePostcardjs(
        likePostcardInfo,
        () => {
          // console.log("엽서 좋아요 취소했어요");
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 엽서 리스트 조회
    async userPostcardList({ commit }, userSeq) {
      await postcardListjs(
        userSeq,
        (response) => {
          // console.log("당신의 엽서 리스트 들고왔어요");
          // console.log(response.data);
          commit("SET_POSTCARDLIST", response.data.postcardList);
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 인기 엽서 리스트 조회
    async popularPostcardList({ commit }) {
      await popularPostcardListjs(
        (response) => {
          // console.log("인기 엽서 리스트 들고왔어요");
          // console.log(response.data);
          commit("SET_POPULARPOSTCARDLIST", response.data);
        },
        (error) => {
          console.log(error);
        }
      );
    },

    // 페이지 주인이 좋아요누른 엽서들 가져오기
    async getUserLikedPostcard({ commit }, ownerSeq) {
      await userLikedPostcardjs(ownerSeq, (response) => {
        // console.log("유저가 좋아요누른 엽서 목록 들고왔어요");
        // console.log(response.data);
        commit("SET_USERLIKEDPOSTCARD", response.data);
      });
    },

    // 사용자가 좋아요 한 엽서 목록 조회
    async userLikedPostcardStore({ commit }, userSeq) {
      await userLikedPostcard(
        userSeq,
        (response) => {
          commit("SET_LIKEDPOSTCARD", response.data.postcardList);
        },
        (error) => {
          console.log(error);
        }
      );
    },
    // state 리셋
    postcardStoreReset({ commit }) {
      commit("SET_STATE");
    },
    // AI 변환요청
    async sendTransformStore({ commit }, transformInfo) {
      // console.log(transformInfo)
      await sendTransform(
        transformInfo,
        (response) => {
          // console.log('============변환결과물=============')
          // console.log(response.data)
          // console.log(typeof(response.data))
          commit
          commit("SET_AITRANSFORMRESULT", response.data);
        },
        (error) => {
          console.log(error);
        }
      );
    },
    async setFilterCode({ commit }, filterCode) {
      commit("SET_FILTERCODE", filterCode);
    },
    async setBeforeTransformImg({ commit }, image) {
      commit("SET_BEFORETRANSFORMIMG", image);
    },
  },



};
export default postcardStore;
