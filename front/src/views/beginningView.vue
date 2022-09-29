<template>
  
  <div style="margin:0 auto;" :class="{ beginningLoading : showLogoLoding , beginningLoadingClose : !showLogoLoding}">
    <div id="startLogo" class="startLogo">
      <svg width=400 height=200> 
        <text class="logo" x="40" y="60%">엽</text> 
        <text class="logo" x="120" y="60%">서</text>
        <text class="logo" x="200" y="60%">사</text>
        <text class="logo" x="280" y="60%">전</text>
      </svg>
    </div>
  </div>
  <div v-if="!showLogoLoding">
  </div>
  
  <div id="test" v-if="!showLogoLoding">
    <div class="mainLogoClass">
      <!-- <b style="font-size: 2vw;">엽AI사전</b> -->
    </div>
    <!-- <div class="beginningTitle">
      엽서사전
    </div> -->
    <div v-if="!showLogin" @click="goLogin" class="goLogin">
      로그인 바로가기
    </div>
    <!-- 번갈아가면서 바뀌는 글자 -->
    <!-- <div id="container">
        <span id="text1" class="logo"></span>
        <span id="text2" class="logo"></span>
    </div> -->
  
    <div class="beginningBackground">
      <!-- <div class="testBackground"> -->
      <div class="catchphrase" data-aos="fade-up">당신이 만든 엽서로</div>
      
      <!-- 샘플이미지 프레임 -->
      <div class="example_frame"></div>
  
      <!-- 엽서가 담기는 편지봉투 -->
      <div id="letter" data-aos="fade-up" class="beginningLetter"></div>
  
      <!-- 샘플이미지가 담기는 엽서 -->
      <div data-aos="fade-up" class="beginningPostCard"></div>
  
      <!-- 샘플 이미지 -->
      <div data-aos="fade-up" data-aos-duration="1000" class="example_before"></div>
      <div data-aos="fade-up" data-aos-duration="1000" id="example" class="example_after"></div>
      <div v-if="showCheerupMessage" data-aos="fade-up" data-aos-duration="500" class="cheerupMessage">사랑을 전하세요</div>
  
  
      <div v-if="showLogin && LoginSignup" data-aos="fade-up" data-aos-duration="500" class="loginForm"> 
        <!-- login form -->
        <form @submit.prevent="login">
            <label class="username" for="username">Username:</label>
            <input class="usernameInput" v-model.trim="loginCredentials.userId" type="text" id="username" placeholder="ID를 입력해 주세요." required>
  
            <label class="password" for="password">Password:</label>
            <input class="passwordInput" v-model.trim="loginCredentials.userPassword" type="password" id="password" placeholder="비밀번호를 입력해 주세요." required>
  
            <button class="login" style="vertical-align: middle;" type="submit"><p style="position:absolute; top: -1vh; left: 2vw;">로그인</p></button>
        </form>
        <div @click="changeLoginSignup" class="changeButton">Signup</div>
      </div>
  
  
  
      <!-- signup form -->
      <div v-if="showLogin && !LoginSignup" data-aos="fade-up" data-aos-duration="500" class="loginForm">
        <form
          @submit.prevent
        >
          <label for="userId" class="id">아이디:</label>
          <input
            v-model.trim="signupCredentials.userId"
            type="text"
            class="idInput"
            id="userId"
            maxlength="10"
            placeholder="ID (최대10자)"
            @input="idChange"
            required
          />
          <button v-show="!IdCheck" @click.prevent="userCheckID" type="submit" class="idcheck"><p style="font-size: 4vh; ">중복확인</p></button>
  
            <label for="userPassword" class="signpuPassword">비밀번호:</label>
            <input
              v-model.trim="signupCredentials.userPassword"
              type="password"
              class="signpuPasswordInput"
              id="userPassword"
              placeholder="6자리 이상 문자, 숫자, 특수문자 포함"
              required
            />
            <!-- <label for="passwordCheck" class="passwordCheck"
              >Password Confirm</label
            > -->
            <input
              v-model.trim="userPassword2"
              type="password"
              class="passwordCheckInput"
              id="userPassword2"
              placeholder="비밀번호를 한번 더입력해주세요."
              required
            />
            <label for="userName" class="userName">이름:</label>
            <input
              v-model.trim="signupCredentials.userName"
              maxlength=8,
              type="text"
              class="userNameInput"
              id="userName"
              placeholder="닉네임을 입력해주세요(최대 8글자)"
              required
            />
            <label for="userPhone" class="userPhone">전화번호:</label>
            <input
              v-model.trim="signupCredentials.userPhone"
              type="text"
              class="userPhoneInput"
              id="userPhone"
              maxlength=11
              placeholder="-없이 숫자만 입력해주세요"
              @input="checkTel"
              required
            />
            <label for="userEmail" class="userEmail">이메일:</label>
            <input
              v-model.trim="signupCredentials.userEmail"
              type="email"
              class="userEmailInput"
              id="userEmail"
              placeholder="이메일을 입력해주세요"
              required
            />
            <p v-if="errorMSG" class="errorMSG">{{this.errorMSG}}</p>
            <button type="submit" @click="signup" class="signup"><p style="position:absolute; top: -1vh; left: 2vw;">회원가입</p></button>
        </form>
        <div @click="changeLoginSignup" class="changeButton">Login</div>
      </div>
  
    </div>
  
  
  
  <!-- </div> -->
  <!-- </div> -->
  </div>
  
  
  
  </template>
  
  <script>
  import { mapActions, mapGetters } from 'vuex'
  import "aos/dist/aos.css";
  import AOS from 'aos';
  import {checkID} from "@/api/account";
  const accountStore = "accountStore";
  const mainpageStore = "mainpageStore";
  
  
  export default {
  name:"TestView",
  
  components: {
    },
  
  computed: {
    ...mapGetters(accountStore, ['isLogged'])
  },
  
  data() {
    return {
      showLogoLoding: true,
      showCheerupMessage: false,
      showLogin: false,
  
      // login Signup 부분
      LoginSignup: true,
  
      loginCredentials: { 
        userId: null, 
        userPassword: null
      },
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
    }
  },
  
  methods: {
    ...mapActions(accountStore, [
      'userSignup', 
      'userCheckID',
      'userLogin',
    ]),

    ...mapActions(mainpageStore, ["setBeginningMainEffect"]),
  
    // 로그인 바로가기
    goLogin() {
      window.scrollTo(0, document.body.scrollHeight)
    },
  
    // 로그인, 회원가입 바뀌는거
    changeLoginSignup() {
      this.LoginSignup = !this.LoginSignup
    },
  
    // signup
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
    },
  
  
    // login
    async login() {
      await this.userLogin(this.loginCredentials)
      // 로그인이 된 경우
      if (this.isLogged) {
        // 입력값 초기화
        this.loginCredentials = { userId: null, userPassword: null}
        // 메인페이지로 이동
        this.$router.push({ name: "MainView" });
      }
    },
  
  
  
    scroll() {
        // 그림 바뀌는거 관리하는 부분
        const example = document.getElementById('example')
        example.style.clip = `rect(${500 - scrollY}px, 10000px, 10000px, 0px)`
  
        // 편지봉투 움직이는거 관리하는 부분
        const letter = document.getElementById('letter')
        letter.style.left = `${-200 + 0.4 * (scrollY - 1700)}%`
        if (scrollY > 2200) {
          letter.style.left = '0%'
        }
  
        // 응원메세지 보이게하기
        if (scrollY < 1200) {
          this.showCheerupMessage = false
        }
        else {
          this.showCheerupMessage = true
        }
        
        // 로그인 버튼 보이게하기
        if (scrollY < 2500) {
          this.showLogin = false
        }
        else {
          this.showLogin = true
        }
      },
    },
  
  
    created() {
      AOS.init();
  
      setTimeout(() => {
  
        // 로딩 이미지를 띄워줄 data값을 변경해주자
        this.showLogoLoding = false; // 3초 지나면 안보이게 하자
  
      }, 3000);
    },
  
  
    mounted() {
      this.setBeginningMainEffect();
      // 클립 문법:::
      // rect(엘리먼트 제일 위로부터 보여줄 부분의 윗변 까지의 거리, 엘리먼트 제일 왼쪽으로 부터 보여줄 끝 부분 까지의 거리, 
      //      엘리먼트 제일 위로부터 보여줄 끝 부분 까지의 거리, 엘리먼트 제일 왼쪽으로 부터 보여줄 시작 부분 까지의 거리)
      // example.style.clip = `rect(${200 - (scrollY - 500 )}px, 10000px, 200px, 0px)`
      // 양옆 범위는 엘리먼트의 길이만큼이면 됨(그냥 충분히 길게 설정해놓음)
      // 아래 범위: 엘리먼트의 높이만큼이면 됨
      // 위 범위: 보이기 시작했으면 하는 스크롤 높이 - scrollY
  
      setTimeout(() => {
        // 로딩 이미지를 띄워줄 data값을 변경해주자
  
        this.showLogoLoding = false; // 3초 지나면 안보이게 하자
        
        // 로고글자 투명하게 바꾸는거
        const startLogo = document.getElementById('startLogo')
        startLogo.style.opacity = 0
  
        // 샘플 이미지 안보이게하는 코드
        const example = document.getElementById('example')
        // console.log(example)
        example.style.clip = `rect(${1000 - scrollY}px, 10000px, 10000px, 0px)`
        
        
        // 스크롤 감지 함수
        document.addEventListener("scroll", this.scroll);
  
  
        // const elts = {
        //   text1: document.getElementById("text1"),
        //   text2: document.getElementById("text2")
        // };
  
        // const texts = [
        //   "엽서사전",
        //   "엽AI사전",
        //   // "글씨체 어떰??",
        //   // "가나다라마바사아자차카타파하",
        //   // "가나다라마바사아자차카타파하",
        //   // "가나다라마바사아자차카타파하",
        //   // "가나다라마바사아자차카타파하",
        //   // "가나다라마바사아자차카타파하",
  
        // ];
  
        // const morphTime = 3;
        // const cooldownTime = 0.25;
  
        // let textIndex = texts.length - 1;
        // let time = new Date();
        // let morph = 0;
        // let cooldown = cooldownTime;
  
        // elts.text1.textContent = texts[textIndex % texts.length];
        // elts.text2.textContent = texts[(textIndex + 1) % texts.length];
  
        // function doMorph() {
        //   morph -= cooldown;
        //   cooldown = 0;
  
        //   let fraction = morph / morphTime;
  
        //   if (fraction > 1) {
        //       cooldown = cooldownTime;
        //       fraction = 1;
        //   }
  
        //   setMorph(fraction);
        // }
  
        // function setMorph(fraction) {
        //   elts.text2.style.filter = `blur(${Math.min(8 / fraction - 8, 100)}px)`;
        //   elts.text2.style.opacity = `${Math.pow(fraction, 0.4) * 100}%`;
  
        //   fraction = 1 - fraction;
        //   elts.text1.style.filter = `blur(${Math.min(8 / fraction - 8, 100)}px)`;
        //   elts.text1.style.opacity = `${Math.pow(fraction, 0.4) * 100}%`;
  
        //   elts.text1.textContent = texts[textIndex % texts.length];
        //   elts.text2.textContent = texts[(textIndex + 1) % texts.length];
        // }
  
        // function doCooldown() {
        //   morph = 0;
  
        //   elts.text2.style.filter = "";
        //   elts.text2.style.opacity = "100%";
  
        //   elts.text1.style.filter = "";
        //   elts.text1.style.opacity = "0%";
        // }
  
        // function animate() {
        //   requestAnimationFrame(animate);
  
        //   let newTime = new Date();
        //   let shouldIncrementIndex = cooldown > 0;
        //   let dt = (newTime - time) / 1000;
        //   time = newTime;
  
        //   cooldown -= dt;
  
        //   if (cooldown <= 0) {
        //       if (shouldIncrementIndex) {
        //           textIndex++;
        //       }
  
        //       doMorph();
        //   } else {
        //       doCooldown();
        //   }
        // }
  
        // animate();
        const v = document.getElementById('test')
        v.scrollTop = 3000
      }, 3000);
    },
    unmounted() {
      document.removeEventListener("scroll", this.scroll);
    },
  }
  </script>
  
  <style>
  /* 메인페이지 진입 효과 관리 */
  .beginningLoading {
    position: absolute;
    width: 100vw;
    height: 100vh;
    transition:all 1s ease;
    /* background-color: #ffeeee; */
    overflow: hidden;
    z-index: 5000;
  }
  .beginningLoadingClose {
    position: absolute;
    width: 10vw;
    height: 0vh;
    transition:all 1s ease;
    border-radius: 0% 0% 30% 30%;
    /* background-color: #ffeeee; */
    overflow: hidden;
    z-index: 5000;
  }
  .beginningTitle {
    position: fixed;
    text-align: center;
    padding: auto;
    height: 7vh;
    width: 100vw ;
    font-family: 'Nanum Pen Script', cursive;
    font-size: 5vh;
    margin-bottom: 2vw;
    z-index: 5000;
    background-color: white;
  }
  .goLogin {
    position: fixed;
    text-align: center;
    padding: auto;
    top: 10vh;
    left: 80vw;
    height: 7vh;
    width: 20vw ;
    cursor: pointer;
    font-family: 'Nanum Pen Script', cursive;
    font-size: 5vh;
    margin-bottom: 2vw;
    z-index: 6000;
  }
  .beginningBackground {
    /* background-image: url(../../public/images/example_before.PNG);
    background-repeat: no-repeat;
    background-size: 100% 100%; */
    margin-left: 3vw;
    margin-right: 3vw;
    position: relative;
    /* background-color: #ffeeee; */
    height: 4000px;
    /* 엽서 나오는 높이 */
    padding-top: 600px;
    /* background-image: url(../../public/images/testBackground.jpg); */
    background-repeat: no-repeat;
    background-size: 100% 100%;
    background-attachment: fixed;
  }
  #test {
    position: relative;
  }
  .testBackground {
    /* position: fixed;
    top: 0; */
    width: 100vw;
    height: 100vh;
    background-image: url(../../public/images/testBackground.jpg);
    background-repeat: no-repeat;
    background-size: 100% 100%;
    background-attachment: fixed;
    z-index: 10;
  }
  .example_frame {
    position: fixed;
    margin: 0 auto;
    top: 33%;
    bottom: 0;
    left: -31%;
    right: 0;
    height: 47vh;
    width: 40vh;
    background-image: url(../../public/images/example_frame.png);
    background-repeat: no-repeat;
    background-size: 100% 100%;
    background-color: rgba( 0, 0, 0, 0.05 );
    box-shadow: 0 3vw 5vw rgba(0, 0, 0, 0.3);
  }
  .example_before {
    position: fixed;
    margin: 0 auto;
    top: 35.5%;
    bottom: 0;
    left: -31%;
    right: 0;
    height: 35vh;
    width: 35vh;
    background-image: url(../../public/images/example_before.PNG);
    background-repeat: no-repeat;
    background-size: 100% 100%;
    border-radius: 5px;
    border-width: 2px;
    border: #484233;
    box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
  }
  .example_after {
    position: fixed;
    margin: 0 auto;
    top: 35.5%;
    bottom: 0;
    left: -31%;
    right: 0;
    height: 35vh;
    width: 35vh;
    background-image: url(../../public/images/example_after.PNG);
    background-repeat: no-repeat;
    background-size: 100% 100%;
    border-radius: 5px;
    border-width: 2px;
    border: #484233;
    box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
  }
  .beginningPostCard {
    position: sticky;
    margin: 0 auto;
    margin-top: 600px;
    /* margin-top: 2000px; */
    top: 20%;
    bottom: 0;
    left: 0;
    right: 0;
    height: 60vh;
    width: 120vh;
    background-image: url(../../public/images/beginningPostCard.jpg);
    background-repeat: no-repeat;
    background-size: 100% 100%;
    box-shadow: 0 3vw 5vw rgba(0, 0, 0, 0.15);
  }
  .cheerupMessage {
    position: fixed;
    margin: 0 auto;
    top: 53%;
    bottom: 0;
    left: 33%;
    right: 0;
    font-size: 5vh;
    font-family: 'Nanum Pen Script', cursive;
    transition:all 1s ease;
    z-index: 1999;
  }
  .catchphrase {
    position: absolute;
    width: 80vh;
    margin: 0 auto;
    margin-top: 10vh;
    left: 50%;
    backdrop-filter: blur(5px); 
    font-size: 10vh; 
    font-family: 'Nanum Pen Script', cursive; 
    border-radius: 10px;
    z-index: 1200;
  }
  .beginningLetter {
    position: fixed;
    margin: 0 auto;
    top: 15%;
    bottom: 0;
    left: -200%;
    right: 0;
    height: 70vh;
    width: 130vh;
    background-image: url(../../public/images/beginningLetter.png);
    background-repeat: no-repeat;
    background-size: 100% 100%;
    transition:all 0.1s ease;
    box-shadow: 0 3vw 5vw rgba(0, 0, 0, 0.3);
    border-radius: 1vw;
    z-index: 2000;
  }
  .loginForm {
    position: fixed;
    margin: 0 auto;
    width: 188vh;
    height: 100vh;
    top: 35%;
    bottom: 0;
    left: 0;
    right: 0;
    font-size: 5vh;
    font-family: 'Nanum Pen Script', cursive;
    transition:all 1s ease;
    z-index: 2001;
  }
  
  /* login */
  .username {
    position: absolute;
    top: 1vh;
    left: 32vw;
  }
  .usernameInput {
    top: 1vh;
    position: absolute;
    left: 43vw;
    width: 25vw;
    height: 6vh;
    border-radius: 10px;
  }
  .password {
    position: absolute;
    top: 10vh;
    left: 32vw;
  }
  .passwordInput {
    position: absolute;
    left: 43vw;
    top: 10vh;
    width: 25vw;
    height: 6vh;
    border-radius: 10px;
  }
  .login {
    position: absolute;
    /* padding-bottom: 1vh; */
    top: 30vh;
    left: 45vw;
    width:8vw;
    height: 6vh;
    border-radius: 10px;
  }
  
  
  /* signup */
  .id {
    position: absolute;
    top: 1vh;
    left: 32vh;
  }
  .idInput {
    top: 1vh;
    position: absolute;
    left: 47vh;
    width: 28vh;
    height: 6vh;
    border-radius: 10px;
  }
  .idcheck {
    position: absolute;
    top: 1vh;
    left: 76vh;
    width: 15vh;
    height: 6vh;
    border-radius: 10px;
  }
  .errorMSG {
    position: absolute;
    top: -8vh;
    left: 58vh;
  }
  
  .userName {
    position: absolute;
    top: 1vh;
    left: 96vh;
  }
  .userNameInput {
    position: absolute;
    left: 110vh;
    top: 1vh;
    width: 45vh;
    height: 6vh;
    border-radius: 10px;
  }
  
  .signpuPassword {
    position: absolute;
    top: 9.5vh;
    left: 32vh;
  }
  .signpuPasswordInput {
    position: absolute;
    left: 47vh;
    top: 9.5vh;
    width: 45vh;
    height: 6vh;
    border-radius: 10px;
  }
  
  .passwordCheck {
    position: absolute;
    top: 9.5vh;
    left: 32vw;
  }
  .passwordCheckInput {
    position: absolute;
    left: 47vh;
    top: 18vh;
    width: 45vh;
    height: 6vh;
    border-radius: 10px;
  }
  
  .userPhone {
    position: absolute;
    top: 9.5vh;
    left: 96vh;
  }
  .userPhoneInput {
    position: absolute;
    left: 110vh;
    top: 9.5vh;
    width: 45vh;
    height: 6vh;
    border-radius: 10px;
  }
  
  .userEmail {
    position: absolute;
    top: 18vh;
    left: 96vh;
  }
  .userEmailInput {
    position: absolute;
    left: 110vh;
    top: 18vh;
    width: 45vh;
    height: 6vh;
    border-radius: 10px;
  }
  
  
  .signup {
    position: absolute;
    top: 30vh;
    left: 83vh;
    width:20vh;
    height: 6vh;
    border-radius: 10px;
  }
  
  .changeButton {
    position: fixed;
    margin: 0 auto;
    width: 10vw;
    height: 10vh;
    top: 35%;
    bottom: 0;
    left: 47vw;
    right: 0;
    font-size: 10vh;
    font-family: 'Nanum Pen Script', cursive;
    cursor: pointer;
    /* transition:all 1s ease; */
    z-index: 2001;
  }
  input::placeholder {
      font-size: 4vh;
      padding-left: 1vw;
  }
  
  
  
  /* test */
  @import url("https://fonts.googleapis.com/css?family=Raleway:900&display=swap");
  #container {
      position: absolute;
      margin: auto;
      width: 100vw;
      height: 80pt;
      top: 0;
      bottom: 0;
      filter: url(#threshold) blur(0.6px);
  }
  
  #text1,
  #text2 {
      position: absolute;
      width: 100%;
      display: inline-block;
  
      font-family: 'Nanum Pen Script', cursive;
      font-size: 80pt;
  
      text-align: center;
  
      user-select: none;
  }
  
  
  
  
  
  /* 글자 써지는 효과 */
  @import url("https://fonts.googleapis.com/css2?family=Anton&display=swap");
  @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
  .startLogo {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 400px;
    height: 400px;
    transform: translate(-50%, -50%);
    display: flex;
    align-items: center;
    justify-content: center;
    transition:all 0.7s ease;
    /* border-radius: 2px;
    box-shadow: 4px 8px 16px 0 rgba(0, 0, 0, 0.1); */
    /* background: #FEAC5E; */
    /* fallback for old browsers */
    /* background: -webkit-linear-gradient(to right, #4BC0C8, #C779D0, #FEAC5E); */
    /* Chrome 10-25, Safari 5.1-6 */
    /* background: linear-gradient(to right, #4BC0C8, #C779D0, #FEAC5E); */
    /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  }
  
  svg text {
    font-family: "Anton", sans-serif;
    font-size: 6rem;
    stroke-width: 3px;
    stroke: rgb(255, 197, 142);
    fill: transparent;
    stroke-dashoffset: 750;
    stroke-dasharray: 750;
    animation: stroke 3s linear;
    animation-fill-mode: forwards;
  }
  
  .logo {
    font-family: 'Nanum Pen Script', cursive;
  }
  
  text:nth-child(1) {
    animation-delay: 0.3s;
  }
  
  text:nth-child(2) {
    animation-delay: 0.6s;
  }
  
  text:nth-child(3) {
    animation-delay: 0.9s;
  }
  
  text:nth-child(4) {
    animation-delay: 1.2s;
  }
  
  text:nth-child(5) {
    animation-delay: 2.5s;
  }
  
  text:nth-child(6) {
    animation-delay: 3s;
  }
  
  text:nth-child(7) {
    animation-delay: 3.5s;
  }
  
  @keyframes stroke {
    0% {
      stroke-dashoffset: 750;
    }
    70% {
      fill: rgba(255, 209, 157, 0.926);
    }
    100% {
      stroke-dashoffset: 0;
      fill: rgb(255, 209, 157, 0.926);
    }
  }
  </style>