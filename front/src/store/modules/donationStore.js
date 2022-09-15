// 재단 정보 조회
// 재단 리스트 조회
// 기부 전체조회(재단이 받은 기부 목록)

import {
    donate,
    donationInfo,
  } from "@/api/donation.js"
  
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
    },



    actions: {
        
      // 기부정보 조회   
      async getDonationInfo({ commit }, foundationSeq) {
        await donationInfo(
          foundationSeq,
          (response) => {
            console.log("기부정보 들고왔어요");
            console.log(response.data);
            commit('SET_DONATIONINFO', response.data);
          },
          (error) => {
            console.log(error);
          }
        )
      },
      
      
      // 기부ㄱㄱ
      // donationInfo = {
      //   "donationImgUrl": "string",
      //   "donationPay": 100000,
      //   "donationText": "안녕하세요",
      //   "foundationSeq": 1,
      //   "userSeq": 1
      // }
      async doDonate(donationInfo) {
        await donate(
            donationInfo,
          (response) => {
            console.log("기부성공!");
            console.log(response)
          },
          (error) => {
            console.log(error);
          }
        )
      },

    },
  };
  
  export default donationStore;