<template>
<div :class="{ mainLoading : showLogoLoding , loadingClose : !showLogoLoding}">
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
  <div id="container">
      <span id="text1" class="logo"></span>
      <span id="text2" class="logo"></span>
  </div>


  <div class="beginningBackground">
    
    <!-- 샘플이미지가 담기는 엽서 -->
    <div data-aos="fade-up" class="beginningPostCard"></div>


    <!-- 샘플 이미지 -->
    <div data-aos="fade-up" data-aos-duration="3000" class="example_before"></div>
    <div data-aos="fade-up" data-aos-duration="3000" id="example" class="example_after"></div>

    <div data-aos="fade-up" style="font-size: 30px; z-index: 1200">엽서로 사랑을 전하세요</div>
 
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
  }
},

methods: {
  scroll() {
      const example = document.getElementById('example')
      example.style.clip = `rect(${1000 - scrollY}px, 10000px, 10000px, 0px)`
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


      const elts = {
        text1: document.getElementById("text1"),
        text2: document.getElementById("text2")
      };

      const texts = [
        "엽서사전",
        "엽AI사전",
        // "글씨체 어떰??",
        // "가나다라마바사아자차카타파하",
        // "가나다라마바사아자차카타파하",
        // "가나다라마바사아자차카타파하",
        // "가나다라마바사아자차카타파하",
        // "가나다라마바사아자차카타파하",

      ];

      const morphTime = 3;
      const cooldownTime = 0.25;

      let textIndex = texts.length - 1;
      let time = new Date();
      let morph = 0;
      let cooldown = cooldownTime;

      elts.text1.textContent = texts[textIndex % texts.length];
      elts.text2.textContent = texts[(textIndex + 1) % texts.length];

      function doMorph() {
        morph -= cooldown;
        cooldown = 0;

        let fraction = morph / morphTime;

        if (fraction > 1) {
            cooldown = cooldownTime;
            fraction = 1;
        }

        setMorph(fraction);
      }

      function setMorph(fraction) {
        elts.text2.style.filter = `blur(${Math.min(8 / fraction - 8, 100)}px)`;
        elts.text2.style.opacity = `${Math.pow(fraction, 0.4) * 100}%`;

        fraction = 1 - fraction;
        elts.text1.style.filter = `blur(${Math.min(8 / fraction - 8, 100)}px)`;
        elts.text1.style.opacity = `${Math.pow(fraction, 0.4) * 100}%`;

        elts.text1.textContent = texts[textIndex % texts.length];
        elts.text2.textContent = texts[(textIndex + 1) % texts.length];
      }

      function doCooldown() {
        morph = 0;

        elts.text2.style.filter = "";
        elts.text2.style.opacity = "100%";

        elts.text1.style.filter = "";
        elts.text1.style.opacity = "0%";
      }

      function animate() {
        requestAnimationFrame(animate);

        let newTime = new Date();
        let shouldIncrementIndex = cooldown > 0;
        let dt = (newTime - time) / 1000;
        time = newTime;

        cooldown -= dt;

        if (cooldown <= 0) {
            if (shouldIncrementIndex) {
                textIndex++;
            }

            doMorph();
        } else {
            doCooldown();
        }
      }

      animate();

    }, 3000);
  },
}
</script>

<style>
/* 메인페이지 진입 효과 관리 */
.mainLoading {
  position: absolute;
  width: 100vw;
  height: 100vh;
  transition:all 1s ease;
  background-color: #fcf4e0;
}
.loadingClose {
  position: absolute;
  width: 100vw;
  height: 0vh;
  transition:all 1s ease;
  border-radius: 0% 0% 30% 30%;
  background-color: #fcf4e0;
  overflow: hidden;
}

.beginningBackground {
  /* background-image: url(../../public/images/example_before.PNG);
  background-repeat: no-repeat;
  background-size: 100% 100%; */
  background-color: #fcf4e0;
  height: 5000px;
  padding-top: 2000px;
}
.example_before {
  position: fixed;
  margin: 0 auto;
  top: 40%;
  bottom: 0;
  left: -30%;
  right: 0;
  height: 30vh;
  width: 30vw;
  background-image: url(../../public/images/example_before.PNG);
  background-repeat: no-repeat;
  background-size: cover;
  border-radius: 5px;
  border-width: 2px;
  border: #484233;
}
.example_after {
  position: fixed;
  margin: 0 auto;
  top: 40%;
  bottom: 0;
  left: -30%;
  right: 0;
  height: 30vh;
  width: 30vw;
  background-image: url(../../public/images/example_after.PNG);
  background-repeat: no-repeat;
  background-size: cover;
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
  width: 80vw;
  background-image: url(../../public/images/beginningPostCard.PNG);
  background-repeat: no-repeat;
  background-size: 100% 100%;
}



.beginningClass {
  height: 600vh;
  background-color: whitesmoke;
}
.beginningpageClass {
  height: 100vh;
  background-color: #fcf4e0;
}

.informationClass {
  /* position: absolute; */
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  height: 95vh;
  width: 78vw;
  border-radius: 20px;
  background-color: white;
}

.beginningLogoClass {
  z-index: 1;
  position: fixed;
  margin-left: 5vh;
  font-size: 1vw;
}

.beginningSideBarClass {
  z-index: 1;
  position: fixed;
  right: 0%;
  height: 100vh;
  width: 6vw;
  background-color: white;
}

.beginningpageAboutClass {
  position: relative;
  height: 100vh;
  background-color: #faf8f5;
}

.beginningpageAboutContentClass {
  position: absolute;
  width: 50vw;
  height: 60vh;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
  color: #484233;
}

.beginningpageServiceIntro {
  position: relative;
  height: 100vh;
  background-color: #faf8f5;
}

.beginningpageServiceIntroContent {
  position: absolute;
  height: 70vh;
  width: 75vw;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
  background-color: white;
  border-radius: 30px;
}

.famousLetterClass {
  height: 100vh;
  background-color: #fcf4e0;
}

.famousFoundationClass {
  height: 100vh;
  background-color: #faf8f5;
}

.searchClass {
  height: 60vh;
  background-color: #ffc322;
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
  animation: stroke 4.5s linear;
  animation-fill-mode: forwards;
}

.logo {
  font-family: 'Nanum Pen Script', cursive;
}

text:nth-child(1) {
  animation-delay: 0.5s;
}

text:nth-child(2) {
  animation-delay: 1s;
}

text:nth-child(3) {
  animation-delay: 1.5s;
}

text:nth-child(4) {
  animation-delay: 2s;
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