import { userDetail } from "@/api/account";
import router from "@/router";
import {
  usersecession,
  userUpdate,
  changeProfile,
  donationList,
  followList,
  callChangeTemplate,
  callChangeRemind,
  addFollow,
  deleteFollow,
} from "@/api/mypage.js";

const mypageStore = {
  namespaced: true,
  state: {
    donationList: [],
    followList: [],
    myFollowList: [],
    profileImage: "",
    mypageUserInfo: {},
    ownerInfo: {},
    userRemind: -1,
  },

  getters: {
    donationList(state) {
      return state.donationList;
    },
    followList(state) {
      return state.followList;
    },
    myFollowList(state) {
      return state.myFollowList;
    },
    profileImage(state) {
      return state.profileImage;
    },
    mypageUserInfo(state) {
      return state.mypageUserInfo;
    },
    ownerInfo(state) {
      return state.ownerInfo;
    },
    userRemind(state) {
      return state.userRemind;
    },
  },

  mutations: {
    SET_DONATIONLIST: (state, donationList) => {
      state.donationList = donationList;
    },
    SET_FOLLOWLIST: (state, followList) => {
      state.followList = followList;
    },
    SET_MYFOLLOWLIST: (state, myFollowList) => {
      state.myFollowList = myFollowList;
    },
    SET_PROFILEIMAGE: (state, profileImage) => {
      state.profileImage = profileImage;
    },
    SET_MYPAGEUSERINFO: (state, mypageUserInfo) => {
      state.mypageUserInfo = mypageUserInfo;
    },
    SET_OWNERINFO: (state, ownerInfo) => {
      state.ownerInfo = ownerInfo;
    },
    SET_USERREMIND: (state, userRemind) => {
      state.userRemind = userRemind;
    },
  },

  actions: {
        
    // 회원 탈퇴
    // 탈퇴되면 탈퇴됐다 말해주고 로그인페이지로 푸쉬   
    async userSecession({ user_seq }) {
      await usersecession(
          user_seq,
        () => {
          // console.log("탈퇴됐슴");
          // console.log(response);
          alert('다시 만나요~!')
          router.push('/')
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
        () => {
          // console.log("유저정보 업데이트 결과");
          // console.log(response);
        },
        (error) => {
          console.log(error);
        }
      )
    },

    
    // 프로필사진 변경
    // profileInfo = { user_seq: , profile: 프로필 이미지 }  
    async changeUserProfile({ commit }, profileInfo) {
      await changeProfile(
          profileInfo,
        (response) => {
          // console.log("이미지");
          // console.log(response);
          commit('SET_PROFILEIMAGE', response.data);
        },
        (error) => {
          console.log(error);
        }
      )
    },


    // 회원의 기부목록 가져오기
    // profileInfo = { user_seq: , profile: 프로필 이미지 }  
    async getDonationList({ commit }, user_seq) {
      await donationList(
          user_seq,
        (response) => {
          // console.log("회원님의 기부목록이에요");
          // console.log(response);
          commit('SET_DONATIONLIST', response.data);
        },
        (error) => {
          console.log(error);
        }
      )
    },


    // 회원의 팔로워 목록 가져오기
    async getFollowerList({ commit }, user_seq) {
      await followList(
          user_seq,
        (response) => {
          // console.log("회원님의 팔로워 목록이에요");
          // console.log(response);
          commit('SET_FOLLOWLIST', response.data);
        },
        (error) => {
          console.log(error);
        }
      )
    },

    // 회원의 팔로워 목록 가져오기
    async getMyFollowerList({ commit }, user_seq) {
      await followList(
          user_seq,
        (response) => {
          // console.log("회원님의 팔로워 목록이에요");
          // console.log(response);
          commit('SET_MYFOLLOWLIST', response.data);
        },
        (error) => {
          console.log(error);
        }
      )
    },


    // 마이페이지 주인 유저정보 할당
    async setOwnerInfo({ commit }, userSeq) {
      await userDetail(
        userSeq,
        (response) => {
          // if (response.data.message === "Success") {
            // 받은 유저 정보 데이터 입력
          // console.log('마이페이지 주인 정보');
          // console.log(response);
          commit('SET_OWNERINFO', response.data);
          // }
        },
        // 사용안해도 콜백함수 필요
        (fail) => {
          console.log("유저 정보 받기 실패");
          console.log(fail);
        }
      );

    },

    // 마이페이지 유저정보 할당
    async setMypageUserInfo({ commit }, userInfo) {
      commit('SET_MYPAGEUSERINFO', userInfo);
    },

  // 리마인드 번호 인식용
  async changeUserRemind({ commit }, userRemind) {
    commit("SET_USERREMIND", userRemind);
  },

  // 탬플릿 변경요청
  async changeTemplate({ commit }, templateInfo) {
    await callChangeTemplate(
      templateInfo,
      () => {
        commit();
      },
      () => {}
    );
  },

  // 리마인드 변경요청
  async changeRemind({ commit }, templateInfo) {
    // console.log(templateInfo);
    await callChangeRemind(
      templateInfo,
      () => {
        // console.log("잘 저장됐어요");
        // router.push({path: `/mypage/${templateInfo.userSeq}`, query: {ownerSeq: templateInfo.userSeq}});
        commit();
      },
      () => {
        // router.push({path: `/mypage/${templateInfo.userSeq}`, query: {ownerSeq: templateInfo.userSeq}});
      }
    );
  },


  // 팔로우요청
  async follow({ commit }, followInfo) {
    await addFollow(
      followInfo,
      () => {
        // console.log("팔로우됨");
        commit();
      },
      () => {
      }
    );
  },


    // 언팔요청
    async unFollow({ commit }, followInfo) {
      await deleteFollow(
        followInfo,
        () => {
          // console.log("언팔됨");
          commit();
        },
        () => {
        }
      );
    },

},


};

export default mypageStore;