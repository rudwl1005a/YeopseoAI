import {
    usersecession,
    userUpdate,
    changeProfile,
    donationList,
    followList,
  } from "@/api/organizationList.js"
  
  const mypageStore = {
    namespaced: true,
    state: {
      donationList: [],
      followList: [],
      profileImage: '',
    },


    
    getters: {
      donationList(state) {
        return state.donationList;
      },
      followList(state) {
        return state.followList;
      },
      profileImage(state) {
        return state.profileImage
      }
    },



    mutations: {
      SET_DONATIONLIST: (state, donationList) => {
        state.donationList = donationList;
      },
      SET_FOLLOWLIST: (state, followList) => {
        state.followList = followList;
      },
      SET_PROFILEIMAGE: (state, profileImage) => {
        state.profileImage = profileImage;
      }     
    },



    actions: {
        
      // 회원 탈퇴
      // 탈퇴되면 탈퇴됐다 말해주고 로그인페이지로 푸쉬   
      async userSecession({ user_seq }) {
        await usersecession(
            user_seq,
          (response) => {
            console.log("탈퇴됐슴");
            console.log(response);
            alert('탈퇴됐어요~')
            this.$router.push('/login')
          },
          (error) => {
            console.log(error);
          }
        )
      },
      
      
      // 유저정보 업데이트
      // updateInfo = { user_seq: , info: { userPassword: , userPhone: , userEmail: } }
      async updateUserInfo({ updateInfo }) {
        await userUpdate(
            updateInfo,
          (response) => {
            console.log("유저정보 업데이트 결과");
            console.log(response);
          },
          (error) => {
            console.log(error);
          }
        )
      },

      
      // 프로필사진 변경
      // profileInfo = { user_seq: , profile: 프로필 이미지 }  
      async changeUserProfile({ commit, profileInfo }) {
        await changeProfile(
            profileInfo,
          (response) => {
            console.log("인기 재단 데이터 어떻게 들어오는지 확인");
            console.log(response);
            commit('SET_PROFILEIMAGE', response.data);
          },
          (error) => {
            console.log(error);
          }
        )
      },


      // 회원의 기부목록 가져오기
      // profileInfo = { user_seq: , profile: 프로필 이미지 }  
      async getDonationList({ commit, user_seq }) {
        await donationList(
            user_seq,
          (response) => {
            console.log("회원님의 기부목록이에요");
            console.log(response);
            commit('SET_DONATIONLIST', response.data);
          },
          (error) => {
            console.log(error);
          }
        )
      },


      // 회원의 팔로워 목록 가져오기
      async getFollowerList({ commit, user_seq }) {
        await followList(
            user_seq,
          (response) => {
            console.log("회원님의 팔로워 목록이에요");
            console.log(response);
            commit('SET_DONATIONLIST', response.data);
          },
          (error) => {
            console.log(error);
          }
        )
      },


    },
  };
  
  export default mypageStore;