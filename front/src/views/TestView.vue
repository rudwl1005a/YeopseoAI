<template>
  <div class="beginningBackground">
    
    <!-- 샘플이미지가 담기는 엽서 -->
    <div data-aos="fade-up" class="beginningPostCard"></div>


    <!-- 샘플 이미지 -->
    <div data-aos="fade-up" data-aos-duration="3000" class="example_before"></div>
    <div data-aos="fade-up" data-aos-duration="3000" id="example" class="example_after"></div>

    <div data-aos="fade-up" style="font-size: 30px; z-index: 1200">엽서로 사랑을 전하세요</div>
 
  </div>


  <!-- <div class="qc-ani position-relative" style="width: 700px; margin: 0 auto;">
            <div class="quotation-container">
              <div class="qc-box">
                <i class="fas fa-quote-right fa2"></i>
                <div class="qc-text-box">
                  <i class="fas fa-quote-left fa1"></i>
                  <div class="qc-box-div">
                    <span class="qc-title">QUOTE THE DAY</span>
                    <p id="quotation">“ 바쁘다는 것만으로는 충분치 않다. 문제는 ‘무엇 때문에 바쁜가’이다. ”</p>
                    <div style="margin-bottom: 0; margin-left: 20px;">
                      <span> - </span>
                      <span id="source" class="quotation-writter position-relative" style="font-style: italic;"> Henry David Thoreau (헨리 데이비드 소로) </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="qc-random-btn-container flex align-center justify-center" style="margin-top: -8%;;margin-bottom: 50px;">
              <button class="qrb-box bq-randomBtn">
                <svg class="bq-randomBtn-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1.5rem" height="1.5rem">
                  <path d="M370.72 133.28C339.458 104.008 298.888 87.962 255.848 88c-77.458.068-144.328 53.178-162.791 126.85-1.344 5.363-6.122 9.15-11.651 9.15H24.103c-7.498 0-13.194-6.807-11.807-14.176C33.933 94.924 134.813 8 256 8c66.448 0 126.791 26.136 171.315 68.685L463.03 40.97C478.149 25.851 504 36.559 504 57.941V192c0 13.255-10.745 24-24 24H345.941c-21.382 0-32.09-25.851-16.971-40.971l41.75-41.749zM32 296h134.059c21.382 0 32.09 25.851 16.971 40.971l-41.75 41.75c31.262 29.273 71.835 45.319 114.876 45.28 77.418-.07 144.315-53.144 162.787-126.849 1.344-5.363 6.122-9.15 11.651-9.15h57.304c7.498 0 13.194 6.807 11.807 14.176C478.067 417.076 377.187 504 256 504c-66.448 0-126.791-26.136-171.315-68.685L48.97 471.03C33.851 486.149 8 475.441 8 454.059V320c0-13.255 10.745-24 24-24z"></path>
                </svg>
              </button>
            </div>
            <script src="https://tistory4.daumcdn.net/tistory/4462322/skin/images/random-quotes.js"></script>
          </div>  -->
</template>

<script>
import AOS from 'aos';
import "aos/dist/aos.css";

export default {
name:"TestView",

methods: {
  scroll() {
      const example = document.getElementById('example')
      example.style.clip = `rect(${1000 - scrollY}px, 10000px, 10000px, 0px)`
    },
  },


  created() {
    AOS.init();
  },


  mounted() {
    // 클립 문법:::
    // rect(엘리먼트 제일 위로부터 보여줄 부분의 윗변 까지의 거리, 엘리먼트 제일 왼쪽으로 부터 보여줄 끝 부분 까지의 거리, 
    //      엘리먼트 제일 위로부터 보여줄 끝 부분 까지의 거리, 엘리먼트 제일 왼쪽으로 부터 보여줄 시작 부분 까지의 거리)
    // example.style.clip = `rect(${200 - (scrollY - 500 )}px, 10000px, 200px, 0px)`
    // 양옆 범위는 엘리먼트의 길이만큼이면 됨(그냥 충분히 길게 설정해놓음)
    // 아래 범위: 엘리먼트의 높이만큼이면 됨
    // 위 범위: 보이기 시작했으면 하는 스크롤 높이 - scrollY

    // 샘플 이미지 안보이게하는 코드
    const example = document.getElementById('example')
    example.style.clip = `rect(${1000 - scrollY}px, 10000px, 10000px, 0px)`
    
    
    // 스크롤 감지 함수
    document.addEventListener("scroll", this.scroll);
  },
}
</script>

<style>
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
  background-size: 100% 100%;
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
  background-size: 100% 100%;
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
</style>