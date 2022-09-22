// 엽서 업로드
// 엽서 상세정보 조회
// 엽서 삭제
// 엽서 좋아요 추가
// 엽서 좋아요 삭제
// 엽서 리스트 조회
// 인기 엽서 리스트 조회

import {
    uploadPostcard,
    postcardInfo,
    deletePostcard,
    userLikePostcard,
    userUnlikePostcard,
    postcardList,
    popularPostcardList,
  } from "@/api/postcard.js"
  
  const postcardStore = {
    namespaced: true,
    state: {
      uploadedPostcard: [],
      postcardInfo: [],
      postcardList: [],
      popularPostcardList: [],
    },



    getters: {
      uploadedPostcard(state) {
        return state.uploadedPostcard;
      },
      postcardInfo(state) {
        return state.postcardInfo;
      },
      postcardList(state) {
        return state.postcardList
      },
      popularPostcardList(state) {
        return state.postcardList
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
    },



    actions: {
        
      // 엽서 업로드
      // postcardInfo = {postcard: 이미지파일, tag: [태그리스트], userId: 'string',}
      async uploadPostcard(postcardInfo) {
        await uploadPostcard(
            postcardInfo,
          () => {
            console.log("엽서 업로드됐어요");
          },
          (error) => {
            console.log(error);
          }
        )
      },
      
      
      // 엽서 상세정보 조회
      async getPostcardInfo({ commit }, postcardSeq) {
        await postcardInfo(
            postcardSeq,
          (response) => {
            console.log("엽서 상세정보 들고왔어요");
            console.log(response.data);
            commit('SET_POSTCARDINFO', response.data);
          },
          (error) => {
            console.log(error);
          }
        )
      },

      
      // 엽서 삭제
      async deletePostcard(postcardInfo) {
        await deletePostcard(
            postcardInfo,
          () => {
            console.log("엽서 삭제했어요");
          },
          (error) => {
            console.log(error);
          }
        )
      },


      // 엽서 좋아요 추가
      // likePostcardInfo = {postcardSeq: , userSeq: }
      async userLikePostcard(likePostcardInfo) {
        await userLikePostcard(
            likePostcardInfo,
          () => {
            console.log("엽서 좋아요 했어요");
          },
          (error) => {
            console.log(error);
          }
        )
      },


      // 엽서 좋아요 삭제
      // likePostcardInfo = {postcardSeq: , userSeq: }
      async userUnlikePostcard(likePostcardInfo) {
        await userUnlikePostcard(
            likePostcardInfo,
          () => {
            console.log("엽서 좋아요 취소했어요");
          },
          (error) => {
            console.log(error);
          }
        )
      },


      // 엽서 리스트 조회
      async postcardList({ commit }, userSeq) {
        await postcardList(
            userSeq,
          (response) => {
            console.log("당신의 엽서 리스트 들고왔어요");
            console.log(response.data);
            commit('SET_POSTCARDLIST', response.data);
          },
          (error) => {
            console.log(error);
          }
        )
      },


      // 인기 엽서 리스트 조회
      async popularPostcardList({ commit }) {
        await popularPostcardList(
          (response) => {
            console.log("인기 엽서 리스트 들고왔어요");
            console.log(response.data);
            commit('SET_POPULARPOSTCARDLIST', response.data);
          },
          (error) => {
            console.log(error);
          }
        )
      },

      
    },
  };
  
  export default postcardStore;