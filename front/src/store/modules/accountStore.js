import { login, signup, userInfo, logout } from "@/api/account";
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
    // 계정 관련 오류
    accountError: function (state) {
      return state.accountError;
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
    // 유저 정보 받아오기
    async fetchUserInfo({ commit }, userPk) {
      await userInfo(
        userPk,
        (response) => {
          if (response.status === 200) {
            console.log("유저 정보 받기 성공");
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
    async userLogin({ dispatch, commit }, user) {
      await login(
        user,
        (response) => {
          if (response.status === 200) {
            console.log("로그인 요청 성공");
            console.log(response);
            //토큰이 존재할 경우 토큰 세션에 저장
            const token = response.data["accessToken"];
            sessionStorage.setItem("access-token", token);
            // 유저정보 불러오기 pk를 인자로 입력
            dispatch("userInfo", user.pk);
          }
        },
        (fail) => {
          if (fail.statusCode === 404) {
            commit("SET_ACCOUNT_ERROR", "해당 정보의 유저가 없습니다.");
          }
        }
      );
    },
    // 회원가입
    async userSignup({ dispatch }, user) {
      await signup(user, (response) => {
        console.log(response);
        // 요청 성공 여부 확인
        if (response.status === 200) {
          console.log(response);
          // 회원가입에 사용한 인자 중 로그인에 필요한 인자만 입력
          const creadential = { userId: user.userId, password: user.userPassword };
          console.log(creadential);
          // 로그인하기(user에 넣을 데이터 변경 필요)
          dispatch("userLogin", creadential);
        }
      });
    },

    // 로그아웃
    async userLogout({ commit }) {
      await logout((response) => {
        if (response.status === 200) {
          // 현재 유저 정보 삭제
          commit("SET_USER_INFO", null);
          // 세션 내 토큰 삭제
          sessionStorage.removeItem("access-token");
        }
      });
    },
  },
};

export default accountStore;
