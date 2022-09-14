import { login, signup, userInfo, checkID, logout } from "@/api/account";
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
          if (response.data.message === "정상") {
            console.log("유저 정보 받기 성공");
            // 받은 유저 정보 데이터 입력
            commit(SET_USER_INFO, response.data);
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
    async userLogin(user, { dispatch }) {
      await login(user, (response) => {
        if (response.data.message === "정상") {
          console.log("로그인 성공");
          //토큰이 존재할 경우 토큰 세션에 저장
          const token = response.data["access-token"];
          sessionStorage.setItem("access-token", token);
          // 유저정보 불러오기 pk를 인자로 입력
          dispatch("userInfo", user.pk);
        }
      });
    },
    // ID 중복 확인
    async userCheckID(userId, { commit }) {
      await checkID(
        userId,
        (response) => {
          // 사용 가능한 경우 메시지 출력 + Page 컴포넌트에서 중복확인 여부 체크
          if (response.data.message === "정상") {
            console.log("ID 중복 확인");
          }
          // 중복인 경우 실패 메시지 보여주기
        },
        (fail) => {
          commit("SET_ACCOUNT_ERROR", fail.data.message);
        }
      );
    },
    // 회원가입
    async userSignup({ dispatch }, user) {
      await signup(user, (response) => {
        console.log(response);
        // 요청 성공 여부 확인
        if (response.data.message === "정상") {
          console.log(response);
          // 회원가입에 사용한 인자 중 로그인에 필요한 인자만 입력
          creadential = { userId: user.userId, password: user.password };
          // 로그인하기(user에 넣을 데이터 변경 필요)
          dispatch("userLogin", creadential);
        }
      });
    },

    // 로그아웃
    async userLogout({ commit }) {
      await logout((response) => {
        if (response.data.message === "정상") {
          // 현재 유저 정보 삭제
          commit(SET_USER_INFO, null);
          // 세션 내 토큰 삭제
          sessionStorage.removeItem("access-token");
        }
      });
    },
  },
};

export default accountStore;
