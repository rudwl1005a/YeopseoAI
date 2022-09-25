<template>
      <form
        @submit.prevent
      >
      <div class="d-flex flex-row">
        <label for="userId" class="text-start form-label col-2">ID : </label>
        <input
          v-model.trim="signupCredentials.userId"
          type="text"
          class="inputButton form-control col-4"
          id="userId"
          maxlength="10"
          placeholder="ID를 입력해주세요.(최대10자)"
          style="width: auto;"
          @input="idChange"
          required
        />
        <button v-show="!IdCheck" @click.prevent="userCheckID" type="submit" class="btn btn-primary col-2">중복확인</button>
      </div>  
        <hr>
        <div class="d-flex flex-row">
          <label for="userPassword" class="text-start form-label col-2">Password</label>
          <input
            v-model.trim="signupCredentials.userPassword"
            type="password"
            class="inputButton form-control"
            id="userPassword"
            placeholder="비밀번호는 6자리 이상 문자, 숫자, 특수문자를 포함하여야 합니다."
            required
          />
        </div>
        <hr>
        <div class="d-flex flex-row">
          <label for="userPassword2" class="text-start form-label col-2"
            >Password Confirm</label
          >
          <input
            v-model.trim="userPassword2"
            type="password"
            class="inputButton form-control"
            id="userPassword2"
            placeholder="비밀번호를 한번 더입력해주세요."
            required
          />
        </div>
        <hr>
        <div class="d-flex flex-row">
          <label for="userName" class="text-start form-label col-2">이름</label>
          <input
            v-model.trim="signupCredentials.userName"
            maxlength=8,
            type="text"
            class="inputButton form-control"
            id="userName"
            placeholder="닉네임을 입력해주세요(최대 8글자)"
            required
          />
        </div>
        <hr>
        <div class="d-flex flex-row">
          <label for="userPhone" class="text-start form-label col-2">전화번호</label>
          <input
            v-model.trim="signupCredentials.userPhone"
            type="text"
            class="inputButton form-control col-2"
            id="userPhone"
            maxlength=11
            style="width: 30vw;"
            placeholder="-없이 숫자만 입력해주세요"
            @input="checkTel"
            required
          />
          </div>
        <hr>
        <div class="d-flex flex-row">
          <label for="userEmail" class="text-start form-label col-2">이메일</label>
          <input
            v-model.trim="signupCredentials.userEmail"
            type="email"
            class="inputButton form-control"
            id="userEmail"
            placeholder="이메일을 입력해주세요"
            required
          />
        </div>
        <hr>
          <p v-if="errorMSG">{{this.errorMSG}}</p>
          <button type="submit" @click="signup" class="btn btn-primary">회원가입</button>
      </form>
</template>
<script>
import { mapActions, mapGetters } from 'vuex'
import {checkID} from "@/api/account";
const accountStore = "accountStore";
export default {
  
  name: "SingupView",
  data() {
    return {
      signupCredentials: {
        userCode: 101,
        userId: null,
        userName: null,
        userPassword: null,
        userEmail: null,
        userPhone: null,
      },
      userPassword2: null,
      errorMSG: null,
      IdCheck: false,
      phoneCheck: false,
      phoneOption: ['010', '016', '017', '070', '011', '02', '051', '053', '032', '062', '042', '052', '044', '031', '033','043', '041', '063', '061', '054', '055', '064',],
      // 숫자포함여부(1) 문자포함여부(2) 특수문자포함여부(3)
      pattern1 : /[0-9]/,
      pattern2 : /[a-zA-Z]/,
      pattern3 : /[~!@#$%^&*()_+|<>?:{}]/,
    };
  },
  computed: {
    // 로그인 여부 확인
    ...mapGetters(accountStore, ['isLogged'])
  },
  methods: {...mapActions(accountStore, ['userSignup', 'userCheckID',]),
    pwdCheck() {
      // 숫자 포함 여부 && 문자 포함 여부 && 특수문자포함여부 && 길이 6이상 확인 && 일치여부
      if(this.pattern1.test(this.signupCredentials.userPassword) && this.pattern2.test(this.signupCredentials.userPassword)
      && this.pattern3.test(this.signupCredentials.userPassword) && this.signupCredentials.userPassword.length > 5 &&
      this.signupCredentials.userPassword === this.userPassword2) {
        return true;
      } else {
        return false;
      }
    },
    // ID 중복 확인
    async userCheckID() {
      await checkID(this.signupCredentials.userId, 
        (response) => {
          // 사용 가능한 경우 메시지 출력 + Page 컴포넌트에서 중복확인 여부 체크
          if (response.data.message === "Success") {
            this.IdCheck = true
          }
          // 중복인 경우 실패 메시지 보여주기
        }, () => {
          this.errorMSG = "중복된 아이디가 존재합니다."
        }
      );
    },
    // 휴대전화 번호 바꾸기
    checkTel() {
      if (!this.pattern1.test(this.signupCredentials.userPhone[this.signupCredentials.userPhone.length-1])) {
        this.signupCredentials.userPhone = this.signupCredentials.userPhone.slice(0, this.signupCredentials.userPhone.length-1)
      } else if (this.signupCredentials.userPhone.length > 9 && this.phoneOption.some((num)=>{ return num === this.signupCredentials.userPhone.slice(0,3)})) {
        this.phoneCheck = true
      } 
      // 전화번호가 4개가 되면
    },  
    // id값 변경시 중복 체크 false
    idChange() {
      this.IdCheck = false
      this.errorMSG = ""
    },
    // 회원가입 함수(입력 내용 체크 + 회원가입 요청)
    async signup() {
      console.log(this.phoneCheck)
      // ID 중복 체크
      if (!this.IdCheck) {
        this.errorMSG = "ID 중복 체크를 해주세요"
      }
      // 비밀번호 검증 결과 미 통과시
      else if (!this.pwdCheck()) {
        this.errorMSG = "비밀번호는 6자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."
        // 전화번호가 검증을 미통과시
      } else if (!this.signupCredentials.userName) {
        this.errorMSG = "닉네임을 입력해주세요"
      } else if (!this.signupCredentials.userPhone || !this.phoneCheck) {
        this.errorMSG = "전화번호를 확인해주세요"
      } else if (!this.signupCredentials.userEmail) {
        this.errorMSG = "이메일을 확인해주세요"
      } else {
        await this.userSignup(this.signupCredentials)
      }
    }
  }
};
</script>

<style>
.signpageClass {
  height: 100vh;
  background-color: #fcf4e0;
}
/* .mainLogoClass {
  z-index: 1;
  position: fixed;
  margin-left: 5vh;
  font-size: 1vw;
} */
.signInformationClass {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  width: 50vw;
  height: 90vh;
  border-radius: 10px;
  /* background-image: url("@/assets/SignupBack.png");
  background-repeat: no-repeat;
  background-size: 100% 100%; */
}
.signLogoClass {
  margin-top: 20%;
  border-radius: 10px;
  border-width: 1px;
  border: 3px double #000;
}

/* <input type="number"> 의 arrow를 숨기기 위한 코드 */
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none; 
}


/* 인풋창 디자인 */
.inputButton {
  width: 20vw;
  height: 10vh;
}
</style>
