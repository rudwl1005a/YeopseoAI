<template>
  <div class="signpageClass">
    <div class="mainLogoClass">
      <h1>엽AI사전</h1>
    </div>
    <div class="signInformationClass container">
      <div class="signLogoClass">
        <h1>회원가입</h1>
      </div>
      <form
        @submit.prevent="userSignup(credentials)"
        class="align-self-center"
        style="max-width: 600px"
      >
        <div class="mb-3 container column">
          <label for="username" class="text-start form-label col-3">ID : </label>
          <input
            v-model="credentials.username"
            type="text"
            class="form-control col-7"
            id="username"
            placeholder="ID를 입력해주세요."
            required
          />
          <button type="submit" class="btn btn-primary col-3">중복 확인</button>
        </div>
        <div class="row mb-3">
          <label for="password" class="text-start form-label">Password</label>
          <input
            v-model="credentials.userPassword"
            type="password"
            class="form-control"
            id="password"
            placeholder="비밀번호를 입력해주세요."
            required
          />
          <small id="passwordHelp" class="form-text text-muted">비밀번호는 
            <span :class="has_minimum_lenth ? 'has_required' : ''">6글자 이상되어야 합니다.</span>, 
            <span :class="has_special ? 'has_required' : ''">하나 이상의 특수문자가 포함되어야 합니다.</span></small>
        </div>
        <div class="row mb-3">
          <label for="password2" class="text-start form-label"
            >Password Confirm</label
          >
          <input
            v-model="credentials.userPassword2"
            type="password"
            class="form-control"
            id="password2"
            placeholder="비밀번호를 한번 더입력해주세요."
            required
          />
        </div>
        <div class="row mb-3">
          <label for="userName" class="text-start form-label">이름</label>
          <input
            v-model="credentials.userName"
            maxlength=8,
            type="text"
            class="form-control"
            id="userName"
            placeholder="닉네임을 입력해주세요"
            required
          />
        </div>
        <div class="row mb-3">
          <label for="userPhone" class="text-start form-label">전화번호</label>
          <input
            v-model="credentials.userPhone"
            type="number"
            class="form-control"
            id="userPhone"
            placeholder="휴대전화 번호를 입력해주세요"
            required
          />
        </div>
        <div class="row mb-3">
          <label for="userEmail" class="text-start form-label">이메일</label>
          <input
            v-model="credentials.userEmail"
            type="email"
            class="form-control"
            id="userEmail"
            placeholder="이메을을 입력해주세요"
            required
          />
        </div>
        <div class="row mb-3">
          <button type="submit" class="btn btn-primary">회원가입</button>
        </div>
        <hr />
      </form>
    </div>
  </div>
</template>
<script>
import { mapActions } from 'vuex'
export default {
  
  name: "SingupView",
  data() {
    return {
      credentials: {
        userCode: 101,
        userId: "",
        userName: "",
        userPassword: "",
        userPhone: "",
        userEmail: "",
      },
      userPassword2: "",
    };
  },
  methods: {...mapActions(['userSignup', 'userCheckID'])}
};
</script>

<style>
.signpageClass {
  height: 100vh;
  background-color: #fcf4e0;
}
.mainLogoClass {
  z-index: 1;
  position: fixed;
  margin-left: 5vh;
  font-size: 1vw;
}
.signInformationClass {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  border-radius: 10px;
  background-image: url("@/assets/SignupBack.png");
}
.signLogoClass {
  margin-top: 20%;
  border-radius: 10px;
  border-width: 1px;
  border: 3px double #000;
}
</style>
