// 재단 정보 조회
// 재단 리스트 조회
// 기부 전체조회(재단이 받은 기부 목록)

import {
    foundationInfo,
    foundationList,
    foundationDonationList,
  } from "@/api/organizationList.js"
  
  const organizationStore = {
    namespaced: true,
    state: {
      organizationList: [],
      organizationInfo: [],
      organizationDonationList: [],
    },

    

    getters: {
      organizationList(state) {
        return state.organizationList;
      },
      organizationInfo(state) {
        return state.organizationInfo;
      },
      organizationDonationList(state) {
        return state.organizationDonationList
      }
    },



    mutations: {
      SET_ORGANIZATIONINFO: (state, organizationInfo) => {
        state.organizationInfo = organizationInfo;
      },
      SET_ORGANIZATIONLIST: (state, organizationList) => {
        state.organizationList = organizationList;
      },
      SET_ORGANIZATIONDONATIONLIST: (state, organizationDonationList) => {
        state.organizationDonationList = organizationDonationList;
      }     
    },



    actions: {
        
      // 재단 정보 조회
      //  
      async getFoundationInfo({ commit }, foundationSeq) {
        await foundationInfo(
          foundationSeq,
          (response) => {
            console.log("재단정보 들고왔어요");
            console.log(response.data);
            commit('SET_ORGANIZATIONINFO', response.data);
          },
          (error) => {
            console.log(foundationSeq)

            console.log(error);
          }
        )
      },
      
      
      // 재단 리스트 조회
      async getFoundationList({ commit }) {
        await foundationList(
          (response) => {
            console.log("재단리스트 들고왔어요");
            console.log(response.data);
            commit('SET_ORGANIZATIONLIST', response.data);
          },
          (error) => {
            console.log(error);
          }
        )
      },

      
      // 기부 전체조회(재단이 받은 기부 목록)
      async getFoundationDonationList({ commit }, foundationSeq) {
        await foundationDonationList(
          foundationSeq,
          (response) => {
            console.log("이 재단 전체 기부목록 들고왔어요");
            console.log(response);
            commit('SET_ORGANIZATIONDONATIONLIST', response.data);
          },
          (error) => {
            console.log(error);
          }
        )
      },

    },
  };
  
  export default organizationStore;