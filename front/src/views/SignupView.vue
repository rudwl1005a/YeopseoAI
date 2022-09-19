<template>
  <div class="signpageClass">
    <div class="mainLogoClass">
      <h1>엽AI사전</h1>
    </div>
    <div class="signInformationClass">
      <div class="signLogoClass">
        <h1>회원가입</h1>
      </div>
      <form
        @submit.prevent
      >
      <div class="d-flex flex-row">
        <label for="userId" class="text-start form-label col-2">ID : </label>
        <input
          v-model.trim="credentials.userId"
          type="text"
          class="form-control col-4"
          id="userId"
          placeholder="ID를 입력해주세요."
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
            v-model.trim="credentials.userPassword"
            type="password"
            class="form-control"
            id="userPassword"
            placeholder="비밀번호를 입력해주세요."
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
            class="form-control"
            id="userPassword2"
            placeholder="비밀번호를 한번 더입력해주세요."
            required
          />
        </div>
        <hr>
        <div class="d-flex flex-row">
          <label for="userName" class="text-start form-label col-2">이름</label>
          <input
            v-model.trim="credentials.userName"
            maxlength=8,
            type="text"
            class="form-control"
            id="userName"
            placeholder="닉네임을 입력해주세요"
            required
          />
        </div>
        <hr>
        <div class="d-flex flex-row">
          <label for="userPhone1" class="text-start form-label col-2">전화번호</label>
          <select v-model="userPhone1">
            <option v-for="option in phoneOption" :value="option.value" :key="option.value">
              {{ option.text }}
            </option>
          </select>
          <!-- <input
            v-model="userPhone1"
            type="number"
            class="form-control col-2"
            id="userPhone1"
            maxlength="3"
            style="width: 15vw;"
            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
            required
          /> -->
          <p> - </p>
          <input
            v-model.trim="userPhone2"
            type="text"
            class="form-control col-2"
            id="userPhone2"
            maxlength=8
            style="width: 30vw;"
            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
            required
          />
          </div>
        <hr>
        <div class="d-flex flex-row">
          <label for="userEmail" class="text-start form-label col-2">이메일</label>
          <input
            v-model.trim="credentials.userEmail"
            type="email"
            class="form-control"
            id="userEmail"
            placeholder="이메일을 입력해주세요"
            required
          />
        </div>
        <hr>
          <p v-if="errorMSG">{{this.errorMSG}}</p>
          <button type="submit" @click="signup" class="btn btn-primary">회원가입</button>
      </form>
    </div>
    </div>
</template>
<script>
import { mapActions, mapGetters } from 'vuex'
import {checkID} from "@/api/account";
const accountStore = "accountStore";
export default {
  
  name: "SingupView",
  data() {
    return {
      credentials: {
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
      userPhone1: '010',
      userPhone2: null,
      phoneOption: [
        { text: '010', value: '010' }, { text: '02', value: '02' }, { text: '051', value: '051' },
        { text: '053', value: '053' }, { text: '032', value: '032' }, { text: '062', value: '062' },
        { text: '042', value: '042' }, { text: '052', value: '052' }, { text: '044', value: '044' },
        { text: '031', value: '031' }, { text: '033', value: '033' }, { text: '043', value: '043' },
        { text: '041', value: '041' }, { text: '063', value: '063' }, { text: '061', value: '061' },
        { text: '054', value: '054' }, { text: '055', value: '055' }, { text: '064', value: '064' },
      ]
    };
  },
  computed: {
    // 로그인 여부 확인
    ...mapGetters(accountStore, ['isLogged'])
  },
  methods: {...mapActions(accountStore, ['userSignup', 'userCheckID',]),
    pwdCheck() {
    // 숫자포함여부(1) 문자포함여부(2) 특수문자포함여부(3)
      const pattern1 = /[0-9]/;
      const pattern2 = /[a-zA-Z]/;
      const pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;
      // 숫자 포함 여부 && 문자 포함 여부 && 특수문자포함여부 && 길이 6이상 확인 && 일치여부
      if(pattern1.test(this.credentials.userPassword) && pattern2.test(this.credentials.userPassword)
      && pattern3.test(this.credentials.userPassword) && this.credentials.userPassword.length > 5 &&
      this.credentials.userPassword === this.userPassword2) {
        return true;
      } else {
        return false;
      }
    },
    // 전화번호 생성 함수
    phone () {
      this.credentials.userPhone = this.userPhone1 + this.userPhone2
    },
    // ID 중복 확인
    async userCheckID() {
      await checkID(this.credentials.userId, 
        (response) => {
          // 사용 가능한 경우 메시지 출력 + Page 컴포넌트에서 중복확인 여부 체크
          if (response.status === 200) {
            this.IdCheck = true
          }
          // 중복인 경우 실패 메시지 보여주기
        }, () => {
          this.errorMSG = "중복된 아이디가 존재합니다."
        }
      );
    },
    // 휴대전화 번호 바꾸기
    inputTel() {
      // 전화번호가 4개가 되면
    },  
    // id값 변경시 중복 체크 false
    idChange() {
      this.IdCheck = false
    },
    // 회원가입 함수(입력 내용 체크 + 회원가입 요청)
    async signup() {
      // ID 중복 체크
      if (!this.IdCheck) {
        this.errorMSG = "ID 중복 체크를 해주세요"
      }
      // 비밀번호 검증 결과 미 통과시
      else if (!this.pwdCheck()) {
        this.errorMSG = "비밀번호는 6자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."
        // 전화번호가 검증을 미통과시
      } else if (!this.credentials.userName) {
        this.errorMSG = "닉네임을 입력해주세요"
      } else if (!this.userPhone2 || this.userPhone2.length < 7) {
        this.errorMSG = "전화번호를 확인해주세요"
      } else if (!this.credentials.userEmail) {
        this.errorMSG = "이메일을 확인해주세요"
      } else {
        await this.phone()
        await this.userSignup(this.credentials)
        if (this.isLogged) {
          this.$router.push({name: "MainView"})
        }
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
</style>
