import { login, signup, userDetail } from "@/api/account";
import _ from "lodash";
import router from "@/router";

const accountStore = {
  namespaced: true,
  state: {
    // 유저정보
    userInfo: null,
    // 로그인 or 회원가입 오류
    accountError: null,
    // 토큰
    token: null,
  },
  getters: {
    // 로그인 여부
    isLogged: function (state) {
      return !_.isEmpty(state.token);
    },
    // 유저 정보
    userInfo: function (state) {
      return state.userInfo;
    },
    // 계정관련 오류여부
    isAccountError: function (state) {
      return !_.isEmpty(state.accountError);
    },
    // 계정 관련 오류
    accountError: function (state) {
      return state.accountError;
    },
  },
  mutations: {
    SET_USER_INFO: (state, userInfo) => {
      state.userInfo = userInfo;
    },
    SET_ACCOUNT_ERROR: (state, accountError) => {
      state.accountError = accountError;
    },
    SET_TOKEN: (state, token) => {
      state.token = token;
    },
    SET_STATE: (state) => {
      const initialState = { userInfo: null, accountError: null, token: null };
      Object.assign(state, initialState);
    },
  },
  actions: {
    // 유저 정보 받아오기
    async fetchUserInfo({ commit }, userPk) {
      await userDetail(
        userPk,
        (response) => {
          if (response.data.message === "Success") {
            // 받은 유저 정보 데이터 입력
            commit("SET_USER_INFO", response.data);
          }
        },
        // 사용안해도 콜백함수 필요
        (fail) => {
          console.log("유저 정보 받기 실패");
          console.log(fail);
        }
      );
    },
    // 로그인
    async userLogin(state, user) {
      // console.log(user);
      await login(
        user,
        (response) => {
          if (response.data.message === "Success") {
            //토큰만 추출
            const token = response.data["accessToken"];
            //유저정보 출력
            const userInfo = {
              userName: response.data["userName"],
              userEmail: response.data["userEmail"],
              userId: response.data["userId"],
              userPhone: response.data["userPhone"],
              userProfileUrl: response.data["userProfileUrl"],
              userSeq: response.data["userSeq"],
              userPassword: response.data["userPassword"],
              userCode: response.data["userCode"],
            };
            // 로그인시 받은 data로 바로 입력
            state.commit("SET_USER_INFO", userInfo);
            state.commit("SET_TOKEN", token);
          }
        },
        (fail) => {
          if (fail.statusCode === 404) {
            state.commit("SET_ACCOUNT_ERROR", "해당 정보의 유저가 없습니다.");
          }
        }
      ).then(() => {
        // console.log(state.getters.isLogged);
        if (state.getters.isLogged) {
          router.push({ name: "MainView" });
        }
      });
    },
    // 회원가입
    async userSignup({ dispatch }, user) {
      await signup(user, (response) => {
        // 요청 성공 여부 확인
        if (response.data.message === "Success") {
          // 회원가입에 사용한 인자 중 로그인에 필요한 인자만 입력
          // 로그인하기(user에 넣을 데이터 변경 필요)
          dispatch("userLogin", {
            userId: user.userId,
            userPassword: user.userPassword,
          });
        }
      });
    },

    // 스테이트 리셋
    accountStoreReset({ commit }) {
      commit("SET_STATE");
    },
  },
};

export default accountStore;
