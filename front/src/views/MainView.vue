<template>
<div class="mainClass">
  <div class="maingoUpBtn" @click="goUp"></div>
  <div class="mainpageClass">
    <div class="mainLogoClass">
      <h1>엽AI사전</h1>
    </div>
    <div class="mainpageList">
      <!-- 나중에 라우터 링크 혹은 푸쉬로 바꾸자 -->
      <div class="mainpageBtn" @click="goHome">home</div>
      <div class="mainpageBtn">letter</div>
      <div class="mainpageBtn">foundation</div>
      <div class="mainpageBtn">mypage</div>
    </div>
    <div v-if="sidebarToggle" class="mainopendToggle">
      <!-- 나중에 라우터 링크로 바꾸자 -->
      <div class="mainpageBtn">home</div>
      <div class="mainpageBtn">letter</div>
      <div class="mainpageBtn">foundation</div>
      <div class="mainpageBtn">mypage</div>
      <div class="mainpageBtn">logout</div>
    </div>
    <div class="mainSideBarClass">
      <!-- 토글 아이콘 넣자 -->
      <div class="mainsidebarToggle" @click="openSidebar">
        대충 여기 토글 아이콘 ㄱ
      </div>
    </div>
    <div class="maininformationClass">
      <!-- 웹 페이지의 각 기능들을 대표할 수 있는 사진들을 넣어두자 -->
    </div>
  </div>
  <div class="mainpageAboutClass">
    <div class="mainpageAboutContentClass">
      <b style="font-size: 1.5vw; bold">about</b>
      <br>
      <br>
      <b style="font-size: 2vw">엽서사전</b>
      <br>
      <br>
      <p style="font-size: 1.2vw">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
        Distinctio rem animi doloribus nemo neque quod rerum eveniet 
        veniam qui libero reiciendis, numquam facilis aspernatur dicta 
        sapiente necessitatibus provident fugit mollitia.
      </p>
      <br>
      <p style="font-size: 1.2vw">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
        Distinctio rem animi doloribus nemo neque quod rerum eveniet 
        veniam qui libero reiciendis, numquam facilis aspernatur dicta 
        sapiente necessitatibus provident fugit mollitia.
      </p>
      <br>
      <p style="font-size: 1.2vw">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
        Distinctio rem animi doloribus nemo neque quod rerum eveniet 
        veniam qui libero reiciendis, numquam facilis aspernatur dicta 
        sapiente necessitatibus provident fugit mollitia.
      </p>
      <br>
      <p style="font-size: 1.2vw">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
        Distinctio rem animi doloribus nemo neque quod rerum eveniet 
        veniam qui libero reiciendis, numquam facilis aspernatur dicta 
        sapiente necessitatibus provident fugit mollitia.
      </p>
    </div>
  </div>
  <div class="mainpageServiceIntro">
    <div class="mainpageServiceIntroContent">
      <br>
      <br>
      <br>
      <b style="font-size: 1.5vw;">service</b>
      <br>
      <br>
      <br>
      <b style="font-size: 2vw;">엽서사전에서 가능합니다</b>
      <div class="mainpageServiceIntroWrap">
        <!-- 이 부분은 아이콘이나 그림 잘 만들어서 보여줘야 할듯 -->
        <div class="mainpageServiceIntroContentItem">letter</div>
        <div class="mainpageServiceIntroContentItem">Foundation</div>
        <div class="mainpageServiceIntroContentItem">Donation</div>
        <div class="mainpageServiceIntroContentItem">sns</div>
      </div>
      <div class="mainToMoreInfo">
        <!-- 라우터 링크로 바꿔주자. 어디로 이동시켜줄까? 아님 그냥 넣어만 둘까? -->
        추가 정보
      </div>
    </div>
  </div>
  <div class="mainfamousLetterClass">
    <div class="mainfamousLetterContentClass">
      <div class="mainfamousLetterTitle"><b>인기엽서 목록</b></div>
      <div class="mainfamousLetterBoxClass">
        <div class="mainfamousBigLetterClass">인기빅 엽서</div>
        <div class="mainfamousLittleLetterClass">
          <div class="mainfamousLittleLetterWrap">
            <div class="mainfamousLittleLetterItemClass">인기스몰1</div>
            <div class="mainfamousLittleLetterItemClass">인기스몰2</div>
          </div>
          <div style="height: 2vh"></div>
          <div class="mainfamousLittleLetterWrap">
            <div class="mainfamousLittleLetterItemClass">인기스몰1</div>
            <div class="mainfamousLittleLetterItemClass">인기스몰2</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="mainfamousFoundationClass">
    <div class="mainfamousFoundationTitle">
      <b>재단 목록</b>
    </div>

  </div>
  <div class="mainsearchClass">
    검색
  </div>
  <div>
    기타 정보
  </div>
</div>
</template>

<script>
export default {
  name:"MainView",
  data() {
    return {
      famousLetter: [], // 10개. 아직 요청 확인을 할 수 없기 때문에
      famousFoundation: [], // 10개
      sidebarToggle: false,
    }
  },
  methods: {
    openSidebar() {
      console.log("토글 열어보자");
      if (this.sidebarToggle) {
        this.sidebarToggle = false;
      } else {
        this.sidebarToggle = true;
      }
      console.log(this.sidebarToggle);
    },
    goHome() {
      
    },
    goUp() {
      if (window.scrollY === 0) {
        window.scrollTo({ left: 0, top: 4000, behavior: "smooth" });
      } else {
        window.scrollTo({ left: 0, top: 0, behavior: "smooth" });
      }
    }
  }
}
</script>

<style>
/* 페이지 스크롤 위치 바꾸는 버튼 */
.maingoUpBtn {
  z-index: 50;
  cursor: pointer;
  position: fixed;
  top: 90%;
  left: 5%;
  width: 5vh;
  height: 5vh;
  border-radius: 1000px;
  background-color: #484233;
}


/* 메인페이지 전체 관리 */
.mainClass {
  height: 600vh;
  background-color: whitesmoke;
}


/* 엽서사전 서비스 소개 화면(제일 위에 나오는) 관리 */
.mainpageClass {
  height: 100vh;
  background-color: #fcf4e0;
}

.mainpageList {
  position: absolute;
  top: 50%;
  left: 5%;
  transform: translate(-50%, -50%);
}

.mainpageBtn {
  cursor: pointer;
  width: 5vw;
  height: 5vh;
  font-size: 1.3vw;
  text-align: left;
}

.maininformationClass {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  height: 95vh;
  width: 78vw;
  border-radius: 20px;
  background-color: white;
}


/* 메인페이지 로고 관리 */
.mainLogoClass {
  z-index: 1;
  position: fixed;
  margin-left: 5vh;
  font-size: 1vw;
}


/* 메인페이지 사이드바 관리 */
.mainSideBarClass {
  z-index: 1;
  position: fixed;
  right: 0%;
  height: 100vh;
  width: 6vw;
  background-color: white;
}

.mainopendToggle {
  z-index: 10;
  padding: 20px;
  position: fixed;
  top: 0%;
  right: 6%;
  width: 40vw;
  height: 50vh;
  background-color: #fff1cc;
  border-radius: 0px 0px 0px 100px;
}


/* 엽서사전 about 관리(프로젝트 설명 간단히 보여주는 부분) */
.mainpageAboutClass {
  position: relative;
  height: 100vh;
  background-color: #faf8f5;
}

.mainpageAboutContentClass {
  position: absolute;
  width: 50vw;
  height: 60vh;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
  color: #484233;
}


/* 엽서사전에서 제공하는 서비스 목록 관리(엽서사전에서 가능합니다) */
.mainpageServiceIntro {
  position: relative;
  height: 100vh;
  background-color: #faf8f5;
}

.mainpageServiceIntroContent {
  position: absolute;
  height: 70vh;
  width: 75vw;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
  background-color: white;
  border-radius: 30px;
}

.mainpageServiceIntroWrap {
  display: flex;
  justify-content: space-evenly;
}

.mainpageServiceIntroContentItem {
  margin-top: 10vh;
  width: 15vw;
  height: 20vh;
  border-radius: 10px;
  background-color: #faf8f5;
}

.mainToMoreInfo {
  margin-top: 5vh;
}


/* 인기 엽서 목록 관리 */
.mainfamousLetterClass {
  position: relative;
  height: 100vh;
  background-color: #fcf4e0;
}

.mainfamousLetterContentClass {
  position: absolute;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
  height: 80vh;
  width: 70vw;
}

.mainfamousLetterTitle {
  font-size: 3vh;
  margin-bottom: 20px;
}

.mainfamousLetterBoxClass {
  display: flex;
  justify-content: space-between;
  height: 70vh;
  width: 70vw;
}

.mainfamousBigLetterClass {
  height: 70vh;
  width: 34vw;
  border-radius: 30px;
  background-color: #faf8f5;
}

.mainfamousLittleLetterClass {
  height: 70vh;
  width: 35vw;
  border-radius: 30px;
}

.mainfamousLittleLetterWrap {
  display: flex;
  justify-content: space-between;
}

.mainfamousLittleLetterItemClass {
  height: 34vh;
  width: 17vw;
  border-radius: 20px;
  background-color: #faf8f5;
}


/* 인기 재단 목록 관리 */
.mainfamousFoundationClass {
  height: 100vh;
  background-color: #faf8f5;
}

.mainfamousFoundationTitle {
  height: 50vh;
}


/* 검색 관리 */
.mainsearchClass {
  height: 60vh;
  background-color: #ffc322;
}


/* 사이드바 토글 관리 */
.mainsidebarToggle {
  cursor: pointer;
}
</style>