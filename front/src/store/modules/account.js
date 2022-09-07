import { login, signup, userInfo } from "@/api/account";
import _ from "lodash";

const accountStore = {
  namespaced: true,
  state: {
    // 유저정보
    userInfo: null,
    // 로그인 or 회원가입 오류
    accountError: null,
  },
  getters: {
    // 로그인 여부
    isLogged: function (state) {
      return !_.isEmpty(state.userInfo);
    },
    // 유저 정보
    userInfo: function (state) {
      return state.userInfo;
    },
    // 계정관련 오류여부
    isAccountError: function (state) {
      return !_.isEmpty(state.accountError);
    },
  },
  mutation: {
    SET_USER_INFO: (state, userInfo) => {
      state.userInfo = userInfo;
    },
    SET_ACCOUNT_ERROR: (state, accountError) => {
      state.accountError = accountError;
    },
  },
  actions: {
    async fetchUserInfo({ commit, getters, dispatch }) {
      await userInfo;
    },
    async userLogin({ commit }, user) {
      await login(user, (response) => {
        if (response.data.message === "success") {
          console.log("로그인 성공");
          let token = response.data["access-token"];
        }
      });
    },
  },
};
