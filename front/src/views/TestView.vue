<template>
<div :class="{ beginningLoading : showLogoLoding , beginningLoadingClose : !showLogoLoding}">
  <div id="startLogo" class="startLogo">
    <svg width=400 height=200 viewBox="0 0 400 200"> 
      <text class="logo" x="40" y="60%">엽</text> 
      <text class="logo" x="120" y="60%">서</text>
      <text class="logo" x="200" y="60%">사</text>
      <text class="logo" x="280" y="60%">전</text>
    </svg>
  </div>
</div>


<div v-if="!showLogoLoding">

  <!-- 번갈아가면서 바뀌는 글자 -->
  <div id="container">
      <span id="text1" class="logo"></span>
      <span id="text2" class="logo"></span>
  </div>


  <div class="beginningBackground">
    
    <!-- 샘플이미지 프레임 -->
    <div class="example_frame"></div>

    <!-- 엽서가 담기는 편지봉투 -->
    <div id="letter" data-aos="fade-up" class="beginningLetter"></div>

    <!-- 샘플이미지가 담기는 엽서 -->
    <div data-aos="fade-up" class="beginningPostCard"></div>

    <!-- 샘플 이미지 -->
    <div data-aos="fade-up" data-aos-duration="1000" class="example_before"></div>
    <div data-aos="fade-up" data-aos-duration="1000" id="example" class="example_after"></div>
    <div v-if="showCheerupMessage" data-aos="fade-up" data-aos-duration="500" class="cheerupMessage">경대형 코로나 완치 기원</div>
    <div v-if="showSendButton" data-aos="fade-up" data-aos-duration="500" class="sendButton"><b>발송</b></div>
    <div class="catchphrase" data-aos="fade-up">엽서로 사랑을 전하세요</div>
 
  </div>



</div>

</template>

<script>
import AOS from 'aos';
import "aos/dist/aos.css";

export default {
name:"TestView",

data() {
  return {
    showLogoLoding: true,
    showCheerupMessage: false,
    showSendButton: false,
  }
},

methods: {
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
      
      // 보내는 버튼 보이게하기
      if (scrollY < 2200) {
        this.showSendButton = false
      }
      else {
        this.showSendButton = true
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

    }, 3000);
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
  background-color: #fff3d4;
  z-index: 5000;
}
.beginningLoadingClose {
  position: absolute;
  width: 100vw;
  height: 0vh;
  transition:all 1s ease;
  border-radius: 0% 0% 30% 30%;
  background-color: #fcf4e0;
  overflow: hidden;
  z-index: 5000;
}

.beginningBackground {
  /* background-image: url(../../public/images/example_before.PNG);
  background-repeat: no-repeat;
  background-size: 100% 100%; */

  position: relative;
  background-color: #fcf4e0;
  height: 3000px;
  /* 엽서 나오는 높이 */
  padding-top: 1300px;
}
.example_frame {
  position: fixed;
  margin: 0 auto;
  top: 35%;
  bottom: 0;
  left: -30%;
  right: 0;
  height: 50vh;
  width: 60vh;
  background-image: url(../../public/images/example_frame.png);
  background-repeat: no-repeat;
  background-size: 100% 100%;
}
.example_before {
  position: fixed;
  margin: 0 auto;
  top: 38.5%;
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
}
.example_after {
  position: fixed;
  margin: 0 auto;
  top: 38.5%;
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
}
.beginningPostCard {
  position: sticky;
  margin: 0 auto;
  /* margin-top: 2000px; */
  top: 20%;
  bottom: 0;
  left: 0;
  right: 0;
  height: 60vh;
  width: 120vh;
  background-image: url(../../public/images/beginningPostCard.PNG);
  background-repeat: no-repeat;
  background-size: 100% 100%;
}
.cheerupMessage {
  position: fixed;
  margin: 0 auto;
  top: 40%;
  bottom: 0;
  left: 33%;
  right: 0;
  font-size: 5vh;
  font-family: 'Nanum Pen Script', cursive;
  transition:all 1s ease;
  z-index: 1999;
}
.catchphrase {
  width: 80vh;
  margin: 0 auto;
  margin-top: 10vh; 
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
  z-index: 2000;
}
.sendButton {
  position: fixed;
  margin: 0 auto;
  top: 65%;
  bottom: 0;
  left: 0;
  right: 0;
  font-size: 10vh;
  font-family: 'Nanum Pen Script', cursive;
  transition:all 1s ease;
  z-index: 2001;
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