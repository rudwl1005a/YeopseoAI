<template>

<div class="mainLoading" v-if="showLogoLoding">
  <div class="mainLoadingContent"></div>
</div>
<div class="mainClass" v-if="!showLogoLoding">
  <!-- <div :class="{'maingoUpBtn' : isTop === false, 'maingosearchBtn' : isTop === true,}" @click="goUp"> -->
    <div v-if="isTop" class="maingosearchBtn" @click="goUp"></div>
    <div v-else class="maingoUpBtn" @click="goUp"></div>
  <!-- </div> -->
  <div class="mainpageClass">
    <div v-if="showLogo" class="mainLogoClass">
      <!-- <b style="font-size: 2vw;">엽AI사전</b> -->
    </div>
    <div class="mainpageList">
      <!-- 나중에 라우터 링크 혹은 푸쉬로 바꾸자 -->
      <div class="mainpageBtn" @mouseover="change1" @click="goHome">home</div>
      <div class="mainpageBtn" @mouseover="change2" @click="goLetter">letter</div>
      <div class="mainpageBtn" @mouseover="change3" @click="goFoundation">donation</div>
      <div class="mainpageBtn" @mouseover="change4" @click="goMypage">mypage</div>
      <div class="mainpageBtn" @mouseover="change5" @click="goBoard">board</div>
    </div>


    <!-- <div :class="{ mainopendToggle : opendToggle , mainclosedToggle : !opendToggle}"> -->
      <!-- 나중에 라우터 링크로 바꾸자 -->
      <!-- <div v-if="toggleContent" data-aos="fade-up" data-aos-duration="500">
        <div class="mainpageBtn">home</div>
        <div class="mainpageBtn">letter</div>
        <div class="mainpageBtn">foundation</div>
        <div class="mainpageBtn">mypage</div>
        <div v-if="isLogged" @click="userLogout" class="mainpageBtn">logout</div>
        <div v-if="!isLogged" @click="goLogin" class="mainpageBtn">login</div>
      </div>
    </div>
    <div class="mainSideBarClass"> -->
      <!-- 토글 아이콘 넣자 -->
      <!-- <div class="mainsidebarToggle" @click="openSidebar">
      </div>
    </div> -->

    <!-- 토글 부분 -->
    <side-bar></side-bar>
    <div
    :class="{
      'maininformationClass': watchingIntro === 1,
      'maininformationClass2': watchingIntro === 2,
      'maininformationClass3': watchingIntro === 3,
      'maininformationClass4': watchingIntro === 4,
      'maininformationClass5': watchingIntro === 5,
    }">
    </div>
    <div class="maininformationClassShadow"></div>
  </div>
  <div data-aos="zoom-in" class="mainpageAboutClass">
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
    <!-- 버튼 클릭하면 다음 페이지로 옮겨보자 -->
    <div class="mainfamousLetterBtn" @click="changeFamousLetter"></div>
    <div class="mainfamousLetterContentClass">
      <div class="mainfamousLetterTitle"><b>인기엽서</b></div>
      <div v-if="famousLetterBtn" class="mainfamousLetterBoxClass">


        <div id="faf0" class="mainfamousBigLetterClass">
          <!-- {{ famousLetter[0] }} -->
          <img :src="famousLetter[0].postcard.postcardImgUrl" style="height: 30vw; width: 30vw; border-radius: 2px;" alt="">
          <div id='hoverText'>
            <!-- <div class="bigMaker">{{famousLetter[0].postcard}}</div> -->
            <div class="bigMaker">넣을 컨텐츠가 없나?</div>
          </div>
        </div>


        <div class="mainfamousLittleLetterClass">
          <div class="mainfamousLittleLetterWrap">


            <div id="faf1" class="mainfamousLittleLetterItemClass">
              <!-- {{ famousLetter[1] }} -->
              <img :src="famousLetter[1].postcard.postcardImgUrl" style="height: 14vw; width: 14vw; border-radius: 2px; margin-bottom: 2vw;" alt="">
              <div id='hoverText'>
                <div class="smallMaker">넣을 컨텐츠가 없나?</div>
              </div> 
            </div>


            <div id="faf2" class="mainfamousLittleLetterItemClass">
              <!-- {{ famousLetter[2] }} -->
              <img :src="famousLetter[2].postcard.postcardImgUrl" style="height: 14vw; width: 14vw; border-radius: 2px; margin-bottom: 2vw;" alt="">
              <div id='hoverText'>
                <div class="smallMaker">넣을 컨텐츠가 없나?</div>
              </div> 
            </div>


          </div>
          <div style="height: 2vw"></div>
          <div class="mainfamousLittleLetterWrap">


            <div id="faf3" class="mainfamousLittleLetterItemClass">
              <!-- {{ famousLetter[3] }} -->
              <img :src="famousLetter[3].postcard.postcardImgUrl" style="height: 14vw; width: 14vw; border-radius: 2px; margin-bottom: 2vw;" alt="">
              <div id='hoverText'>
                <div class="smallMaker">넣을 컨텐츠가 없나?</div>
              </div> 
            </div>


            <div id="faf4" class="mainfamousLittleLetterItemClass">
              <!-- {{ famousLetter[4] }} -->
              <img :src="famousLetter[4].postcard.postcardImgUrl" style="height: 14vw; width: 14vw; border-radius: 2px; margin-bottom: 2vw;" alt="">
              <div id='hoverText'>
                <div class="smallMaker">넣을 컨텐츠가 없나?</div>
              </div> 
            </div>


          </div>
        </div>
      </div>
      <!-- 다음페이지 ㅇㅇ -->
      <div v-if="!famousLetterBtn" class="mainfamousLetterBoxClass">


        <div id="faf5" class="mainfamousBigLetterClass">
          <!-- {{ famousLetter[5] }} -->
          <img :src="famousLetter[5].postcard.postcardImgUrl" style="height: 30vw; width: 30vw; border-radius: 2px;" alt="">
          <div id='hoverText'>
            <div class="bigMaker">넣을 컨텐츠가 없나?</div>
          </div> 
        </div>


        <div class="mainfamousLittleLetterClass">
          <div class="mainfamousLittleLetterWrap">


            <div id="faf6" class="mainfamousLittleLetterItemClass">
              <!-- {{ famousLetter[6] }} -->
              <img :src="famousLetter[6].postcard.postcardImgUrl" style="height: 14vw; width: 14vw; border-radius: 2px; margin-bottom: 2vw;" alt="">
              <div id='hoverText'>
                <div class="smallMaker">넣을 컨텐츠가 없나?</div>
              </div> 
            </div>

            
            <div id="faf7" class="mainfamousLittleLetterItemClass">
              <!-- {{ famousLetter[7] }} -->
              <img :src="famousLetter[7].postcard.postcardImgUrl" style="height: 14vw; width: 14vw; border-radius: 2px; margin-bottom: 2vw;" alt="">
              <div id='hoverText'>
                <div class="smallMaker">넣을 컨텐츠가 없나?</div>
              </div> 
            </div>


          </div>
          <div style="height: 2vw"></div>
          <div class="mainfamousLittleLetterWrap">

            <div id="faf8" class="mainfamousLittleLetterItemClass">
              <!-- {{ famousLetter[8] }} -->
              <img :src="famousLetter[8].postcard.postcardImgUrl" style="height: 14vw; width: 14vw; border-radius: 2px; margin-bottom: 2vw;" alt="">
              <div id='hoverText'>
                <div class="smallMaker">넣을 컨텐츠가 없나?</div>
              </div> 
            </div>


            <div id="faf9" class="mainfamousLittleLetterItemClass">
              <!-- {{ famousLetter[9] }} -->
              <img :src="famousLetter[9].postcard.postcardImgUrl" style="height: 14vw; width: 14vw; border-radius: 2px; margin-bottom: 2vw;" alt="">
              <div id='hoverText'>
                <div class="smallMaker">넣을 컨텐츠가 없나?</div>
              </div> 
            </div>


          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 재단 모달 -->
  <div v-if="showModal" class="mainFoundationModal">
    <div class="modalShadow"></div>
    <foundation-modal :seeingFoundation="seeingFoundation"></foundation-modal>
    <div type="button" @click="setFoundationDonationList(famousFoundation[0])" style="width: 4vw; height: 4vw; font-size: 7vw; top: 5%; left: 90%; position: fixed; z-index: 10000;">X</div>
  </div>
  <!-- 재단 목록 -->
  <div class="mainfamousFoundationClass">
    <!-- <div class="mainfamousFoundationChange"></div> -->
    <div class="mainfamousFoundationWrap">
      <div class="mainfamousFoundationTitle">
        <b>재단 목록</b>
      </div>
      <div class="mainfamousFoundationContent">
        <!-- 3개만 보여줘도 될 것 같다는 생각이 든다 -->
        <div @click="setFoundationDonationList(famousFoundation[0])" class="mainfamousFoundationItem">
          <!-- {{ famousFoundation[0] }} -->
          <!-- <img class="mainfamousFoundationImg" :src="famousFoundation[0].foundationLogoUrl" style="height: 60vh; width: 15vw; border-radius: 20px;" alt=""> -->
          <img class="mainfamousFoundationImg" src="../../public/images/ssafyFoundation.png" style="height: 60vh; width: 15vw; border-radius: 20px;" alt="">
          <div class="mainfamousFoundationItemContent">
            재단명: {{ famousFoundation[0].foundationName }}
            <br>
            상세정보: {{ famousFoundation[0].foundationContent }}
          </div>
        </div>
        <div @click="setFoundationDonationList(famousFoundation[1])" class="mainfamousFoundationItem">
          <!-- {{ famousFoundation[1] }} -->
          <!-- <img class="mainfamousFoundationImg" :src="famousFoundation[1].foundationLogoUrl" style="height: 60vh; width: 10vw; border-radius: 20px;" alt=""> -->
          <!-- <img class="mainfamousFoundationImg" :src="famousFoundation[1].foundationLogoUrl" style="height: 60vh; width: 15vw; border-radius: 20px;" alt=""> -->
          <img class="mainfamousFoundationImg" src="../../public/images/ssafyChildFoundation.png" style="height: 60vh; width: 15vw; border-radius: 20px;" alt="">
          <div class="mainfamousFoundationItemContent">
            재단명: {{ famousFoundation[1].foundationName }}
            <br>
            상세정보: {{ famousFoundation[1].foundationContent }}
          </div>
        </div>
        <div @click="setFoundationDonationList(famousFoundation[2])" class="mainfamousFoundationItem">
          <!-- {{ famousFoundation[2] }} -->
          <!-- <img class="mainfamousFoundationImg" :src="famousFoundation[2].foundationLogoUrl" style="height: 60vh; width: 10vw; border-radius: 20px;" alt=""> -->
          <!-- <img class="mainfamousFoundationImg" :src="famousFoundation[2].foundationLogoUrl" style="height: 60vh; width: 15vw; border-radius: 20px;" alt=""> -->
          <img class="mainfamousFoundationImg" src="../../public/images/ssafyWorldFoundation.png" style="height: 60vh; width: 15vw; border-radius: 20px;" alt="">
          <div class="mainfamousFoundationItemContent">
            재단명: {{ famousFoundation[2].foundationName }}
            <br>
            상세정보: {{ famousFoundation[2].foundationContent }}
          </div>
        </div>

        <!-- 재단 3개만 보여주는 쪽으로 바꿈 -->
        <!-- <div @click="foundationDetail(famousFoundation[3])" class="mainfamousFoundationItem"> -->
          <!-- {{ famousFoundation[3] }} -->
          <!-- <img class="mainfamousFoundationImg" :src="famousFoundation[3].foundationLogoUrl" style="height: 60vh; width: 10vw; border-radius: 20px;" alt=""> -->
          <!-- <img class="mainfamousFoundationImg" :src="famousFoundation[3]" style="height: 60vh; width: 10vw; border-radius: 20px;" alt="">
          <div class="mainfamousFoundationItemContent">
            여기 설명이 들어갈 예정입니다
          </div>
        </div> -->
        <!-- <div @click="foundationDetail(famousFoundation[4])" class="mainfamousFoundationItem"> -->
          <!-- {{ famousFoundation[4] }} -->
          <!-- <img class="mainfamousFoundationImg" :src="famousFoundation[4].foundationLogoUrl" style="height: 60vh; width: 10vw; border-radius: 20px;" alt=""> -->
          <!-- <img class="mainfamousFoundationImg" :src="famousFoundation[4]" style="height: 60vh; width: 10vw; border-radius: 20px;" alt="">
          <div class="mainfamousFoundationItemContent">
            여기 설명이 들어갈 예정입니다
          </div>
        </div> -->
      </div>
    </div>
  </div>

  <!-- 검색바 관련. input 될 때마다 자동완성 결과를 불러오는 요청 필요, enter시 결과를 store에 저장 후 검색 페이지로 넘어가 store에 저장된
  검색 결과를 불러오도록 하자. -->
  <div class="mainsearchClass">
    <div class="mainsearchTitle"><b style="font-size: 1.2vw;">검색</b></div>
    <div class="mainsearchBar">
      <div class="mainsearchBarBody">
        <input v-model="searchMessage" @input="getAutoComplete" @keyup.enter="submitSearch" class="mainsearchBarInput" placeholder=". . . search" type="text">
      </div>
    </div>
  </div>
  <div class="contactUsPage">
    <div class="contactUsContent">
      contact us
    </div>
  </div>
</div>
</template>

<script>
import { mapActions, mapState, mapGetters } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue";
import FoundationModal from "@/components/Foundation/foundationModal.vue";
import AOS from "aos";
import "aos/dist/aos.css";
const mainpageStore = "mainpageStore";
const searchStore = "searchStore";
const accountStore = "accountStore"
const postcardStore = "postcardStore";
const organizationStore = "organizationStore";

export default {
  name:"MainView",
  components: {
    SideBar,
    FoundationModal,
  },
  computed: {
    ...mapState(mainpageStore, ["mainEffectIsntShowed", "letterTop", "foundationTop", "watchingLetter", "watchingFoundation"]),
    ...mapState(searchStore, ["letterSearchResult", "foundationSearchResult"]),
    ...mapState(accountStore, ["userInfo"]),
    ...mapGetters(accountStore, ["isLogged"]),
    ...mapGetters(organizationStore, ["organizationList", "organizationInfo", "organizationDonationList"]),
  },
  data() {
    return {
      // 메인화면 소개 이미지관련
      watchingIntro: 1,

      // 엽서관련
      famousLetter: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], // 10개. 아직 요청 확인을 할 수 없기 때문에 데이터 넣어두고 해보자
      watchingLetter: [], // 세부사항 조회중인 엽서 정보
      
      // 재단관련
      famousFoundation: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], // 10개
      watchingFoundation: [],

      // 재단 모달 관련
      showModal: false,
      seeingFoundation: {},
      
      // 사이드바 토글 관련
      opendToggle: false,
      toggleContent: false,

      // 메인화면으로 넘어갈 때 보여줄 이미지(생각해보니 매번 이동할 때 마다 뜨면 문제가 있을 것 같네. 일단 레퍼런스 사이트는 메인화면 이동할 때마다 보여주고 있긴 함)
      showLogoLoding: true,

      // 인기 엽서 목록 버튼 관리
      famousLetterBtn: true, // true면 1~5위, false면 6~10위 보여주자

      // 검색 관리
      searchMessage: "",

      // 로고 관리
      showLogo: true,

      // 화면 이동 버튼 관리
      isTop: true,
    }
  },
  methods: {
    ...mapActions(mainpageStore, ["setMainEffect", "getFamousLetterStore", "getFamousFoundationStore", "getLetterDetail", "likeLetterStore", "dislikeLetterStore", "getFoundationDetail"]),
    ...mapActions(searchStore, ["getSearchResult"]),
    ...mapActions(accountStore, ["userLogout"]),
    ...mapActions(postcardStore, ["userLikedPostcardStore"]),
    ...mapActions(organizationStore, ["getFoundationInfo", "getFoundationList", "getFoundationDonationList",]),
    
    // 재단 모달 관련
    async setFoundationDonationList(foundation) {
      await this.getFoundationDonationList(foundation.foundationSeq);
      this.showModal = !this.showModal;
      // console.log(foundation);
      this.seeingFoundation = {
        foundationName: foundation.foundationName,
        foundationContent: foundation.foundationContent,
      }
    },
    
    // 사이드바 관련
    openSidebar() {
      console.log("토글 열어보자");
      // 토글 닫기
      if (this.opendToggle) {
        this.opendToggle = false;
        setTimeout(() => {
          this.toggleContent = false
          
        }, 200)
      // 토글 열기 
      } else {
        this.opendToggle = true;
        setTimeout(() => {
          this.toggleContent = true;
        }, 200)
      }
      console.log(this.opendToggle);
    },
    // hover시 intro의 사진을 바꿔주기 위한 함수
    // 바뀐 숫자를 가지고 배경화면을 바꾸어주면 될 것
    change1() {
      this.watchingIntro = 1;
    },
    change2() {
      this.watchingIntro = 2;
    },
    change3() {
      this.watchingIntro = 3;
    },
    change4() {
      this.watchingIntro = 4;
    },
    change5() {
      this.watchingIntro = 5;
    },

    goHome() {
      this.$router.go();
      console.log("홈 새로고침");
    },
    goFoundation() {
      this.$router.push('/donation');
      console.log("홈 새로고침");
    },
    goLetter() {      
      this.$router.push('/makecard');
      console.log("홈 새로고침");
    },
    goMypage() {
      this.$router.push({path: `/mypage/${this.userInfo.userSeq}`, query: {ownerSeq: this.userInfo.userSeq}});
      console.log("홈 새로고침");
    },
    goBoard() {
      this.$router.push('/board');
    },
    goUp() {
      if (window.scrollY === 0) {
        window.scrollTo({ left: 0, top: 10000, behavior: "smooth" });
      } else {
        window.scrollTo({ left: 0, top: 0, behavior: "smooth" });
      }
    },
    goLogin() {
      this.$router.push({name: "beginningView"})
    },

    changeFamousLetter() { // 인기 엽서 목록 바꿔주는 버튼
      this.famousLetterBtn = !this.famousLetterBtn;
    },

    // 검색 관리
    getAutoComplete() {
      // input 될 때마다 해당 값을 포함하는 결과를 밑에 띄워주기 위한 함수
      console.log(this.searchMessage);
    },
    async submitSearch() {
      await this.userLikedPostcardStore(this.userInfo.userSeq);
      if (this.searchMessage !== "") {
        // enter키를 누르면 searchMessage값을 넣어 검색 실시. store에 검색 결과 넣어둔 후 검색 결과 페이지로 이동하자
        console.log(this.searchMessage);
        let searchWord = this.searchMessage;
        await this.getSearchResult(searchWord);
        this.searchMessage = "";
        this.$router.push({ name: "SearchView" });
      } else {
        console.log("검색어 입력하라고");
      }
    },
    // 로고 스크롤 이벤트
    scrollEvent() {
      if (scrollY === 0) {
        this.showLogo = true;
        this.isTop = true;
      } else {
        this.showLogo = false;
        this.isTop = false;
      }
    },

    //
    async foundationDetail(foundation) {
      // 클릭시 재단의 상세정보를 보여줘야 함
      console.log(foundation);
      this.watchingFoundation = foundation;
      // 보고있는 재단 정보를 data에 담고
      await this.getFoundationDetail(this.watchingFoundation.foundationSeq);
      console.log(this.watchingFoundation);
    }
  },
  async created() {
    // 인기엽서, 인기재단 받아오자. async await 써서 받아야 할 듯
    AOS.init();
    this.showLogoLoding = this.mainEffectIsntShowed;
    await this.getFamousLetterStore();
    await this.getFamousFoundationStore();
    console.log(this.letterTop);
    this.famousLetter = this.letterTop;
    this.famousFoundation = this.foundationTop;
    // 로그인시 최초 1회만 화면 전환 이펙트를 넣을 예정
    // 해당 값을 관리해줄 필요가 있음 -> mainpageStore에 mainEffectIsntShowed를 넣고
    // 해당 값이 true일 경우 화면전환 이펙트를 넣자

    // 여기에 로딩 이미지 넣으면 될 듯?
    setTimeout(() => {
      // 로딩 이미지를 띄워줄 data값을 변경해주자
      this.showLogoLoding = false; // 3초 지나면 안보이게 하자
    }, 1000);
    await this.setMainEffect();

  },
  mounted() {
    document.addEventListener("scroll", this.scrollEvent);
  },
  unmounted() {
    document.removeEventListener("scroll", this.scrollEvent);
  },
}
</script>

<style>
/* 메인페이지 진입 효과 관리 */
.mainLoading {
  width: 100vw;
  height: 100vh;
  background-color: #fcf4e0;
}

.mainLoadingContent {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  height: 30vw;
  width: 30vw;
  background-image: url("../../public/images/logo.png");
  background-size: 30vw 30vw;
  background-repeat: no-repeat;
  animation-name: logoFade;
  animation-duration: 1s;
}

@keyframes logoFade {
  from {
    /* opacity: 0; */
    height: 10vw;
    width: 10vw;
    background-size: 10vw 10vw;
    transform: translate(0%, -20%);
    top: 0%;
    left: 0%;
  } to {
    /* opacity: 1; */
    height: 30vw;
    width: 30vw;
    background-size: 30vw 30vw;
    transform: translate(-50%, -50%);
    top: 50%;
    left: 50%;
  }
}


/* 페이지 스크롤 위치 바꾸는 버튼 */
.maingoUpBtn {
  z-index: 50;
  cursor: pointer;
  position: fixed;
  top: 90%;
  left: 5%;
  width: 5vh;
  height: 5vh;
  /* border-radius: 1000px; */
  /* background-color: #484233; */
  background-image: url("../../public/images/goUpIcon.png");
  background-size: 5vh 5vh;
}

.maingosearchBtn {
  z-index: 50;
  cursor: pointer;
  position: fixed;
  top: 90%;
  left: 5%;
  width: 5vh;
  height: 5vh;
  /* border-radius: 1000px; */
  /* background-color: #c0a45d; */
  background-image: url("../../public/images/searchIcon.png");
  background-size: 5vh 5vh;
}
/* 내부 아이콘 */
.maingoUpBtnIcon {
  color: white;
  font-size: 3vh;
  margin-top: 0.2vh;
}

/* 메인페이지 전체 관리 */
.mainClass {
  height: 580vh;
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

/* 엽서사전 서비스 소개 호버 이펙트용 */
.mainpageBtn {
  cursor: pointer;
  width: 5vw;
  height: 5vh;
  font-size: 1.7vw;
  text-align: left;
  transition: 0.4s;
}

.maininformationClassShadow {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  height: 95vh;
  width: 78vw;
  border-radius: 20px;
  box-shadow : inset -0.2vw -0.2vw 0.5vw 0.1vw rgba(0,0,0,0.5);
  background-color: rgba(0, 0, 0, 0);
  transition: 0.6s;
}
.maininformationClass {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  height: 95vh;
  width: 78vw;
  border-radius: 20px;
  background-image: url('../../public/images/main_1.png');
  background-size: 78vw 95vh;
  transition: 0.6s;
}
.maininformationClass2 {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  height: 95vh;
  width: 78vw;
  border-radius: 20px;
  background-image: url('../../public/images/main_2.png');
  background-size: 78vw 95vh;
  transition: 0.6s;
}
.maininformationClass3 {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  height: 95vh;
  width: 78vw;
  border-radius: 20px;
  background-image: url('../../public/images/main_3.png');
  background-size: 78vw 95vh;
  transition: 0.6s;
}
.maininformationClass4 {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  height: 95vh;
  width: 78vw;
  border-radius: 20px;
  background-image: url('../../public/images/main_4.png');
  background-size: 78vw 95vh;
  transition: 0.6s;
}
.maininformationClass5 {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  height: 95vh;
  width: 78vw;
  border-radius: 20px;
  background-image: url('../../public/images/main_5.png');
  background-size: 78vw 95vh;
  transition: 0.6s;
}

/* 메인페이지 로고 관리 */
.mainLogoClass {
  z-index: 1;
  cursor: pointer;
  position: fixed;
  top: 0%;
  left: 0%;
  transform: translate(0%, -20%);
  height: 15vh;
  width: 8vw;
  margin-left: 1vw;
  background-image: url("../../public/images/logo.png");
  background-size: 8vw 15vh;
  background-repeat: no-repeat;
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
  width: 30vw;
  height: 50vh;
  background-color: #fff1cc;
  border-radius: 0px 0px 0px 100px;
  overflow: hidden;
  transition: 0.5s;
}
.mainclosedToggle {
  z-index: 10;
  padding: 20px;
  position: fixed;
  top: 0%;
  right: 6%;
  width: 0vw;
  height: 0vh;
  background-color: #fff1cc;
  border-radius: 0px 0px 0px 100px;
  overflow: hidden;
  transition: 0.5s;
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
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
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
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}

.mainToMoreInfo {
  margin-top: 5vh;
}


/* 인기 엽서 목록 관리 */
.mainfamousLetterBtn {
  position: absolute;
  cursor: pointer;
  top: 90%;
  left: 47%;
  transform: translate(-50%, -50%);
  height: 5vh;
  width:  5vh;
  border-radius: 1000px;
  background-color: #484233;
}

.mainfamousLetterClass {
  position: relative;
  height: 100vh;
  background-color: #ffffff;
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
  font-size: 7vh;
  margin-bottom: 20px;
}

.mainfamousLetterBoxClass {
  display: flex;
  margin: 0 auto;
  justify-content: space-between;
  height: 30vw;
  width: 63vw;
}

.mainfamousBigLetterClass {
  position: relative;
  cursor: pointer;
  height: 30vw;
  width: 30vw;
  border-radius: 2px;
  background-color: #faf8f5;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  transition: 0.3s;
}
.mainfamousBigLetterClass:hover {
  /* box-shadow: inset 0px -5vw 20px 5vw rgba(0, 0, 0, 0.15); */
  transition: 0.3s;
  transform: scale(1.03)
}

.mainfamousLittleLetterClass {
  cursor: pointer;
  height: 30vw;
  width: 30vw;
  border-radius: 2px;
}

.mainfamousLittleLetterWrap {
  display: flex;
  justify-content: space-between;
}

.mainfamousLittleLetterItemClass {
  position: relative;
  height: 14vw;
  width: 14vw;
  border-radius: 2px;
  background-color: #faf8f5;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  transition: 0.3s;
}
.mainfamousLittleLetterItemClass:hover {
  transform: scale(1.05)
}

/* 인기 재단 목록 관리 */
.mainfamousFoundationClass {
  position: relative;
  height: 100vh;
  background-color: #faf8f5;
}

.mainfamousFoundationWrap {
  position: absolute;
  height: 80vh;
  width: 80vw;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
}

.mainfamousFoundationTitle {
  font-size: 3vh
}

.mainfamousFoundationContent {
  display: flex;
  justify-content: space-around;
  margin-top: 20px;
  height: 60vh;
  width: 80vw;
}

.mainfamousFoundationImg {

}

.mainfamousFoundationItem {
  display: flex;
  cursor: pointer;
  height: 60vh;
  width: 15vw;
  background-color: transparent;
  border-radius: 20px;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  transition: 0.4s;
}

.mainfamousFoundationItemContent {
  width: 0vw;
  height: 0vh;
  background-color: white;
  border-radius: 20px;
  overflow: auto;
  transition: 0.4s;
}

.mainfamousFoundationItem:hover {
  width: 40vw;
}

.mainfamousFoundationItem:hover > .mainfamousFoundationItemContent {
  width: 30vw;
  height: 60vh;
}

.mainfamousFoundationChange {
  position: absolute;
  top: 90%;
  left: 47%;
  transform: translate(-50%, -50%);
  cursor: pointer;
  background-color: #484233;
  height: 5vh;
  width: 5vh;
  border-radius: 1000px;
}

.mainFoundationModal {
  z-index: 100;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.modalShadow {
  height: 0;
  width: 0;
  box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
}


/* 검색 관리 */
.mainsearchClass {
  position: relative;
  height: 60vh;
  background-color: #ffc322;
}

.mainsearchTitle {
  position: absolute;
  top: 10%;
  left: 47%;
  transform: translate(-50%, -50%);
}

.mainsearchBar {
  position: absolute;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
  height: 5vh;
  width: 25vw;
  border-radius: 1000px;
  background-color: #484233;
  transition: 0.4s;
}

.mainsearchBarBody {
  width: 24vw;
}

.mainsearchBarInput {
  position: absolute;
  top: 55%;
  left: 47%;
  transform: translate(-50%, -50%);
  width: 20vw;
  /* 자체 높이 */
  line-height: 5vh;
  /* 폰트 사이즈 */
  font-size: 3vh;
  border: none;
  background: none;
  outline: none;
  color: #faf8f5;
}


/* 사이드바 토글 관리 -> sidebar 컴포넌트 부분에 빼둠*/

.contactUsPage {
  position: relative;
  height: 20vh;
  background-color: #faf8f5;
}

.contactUsContent {
  position: absolute;
  width: 100vw;
  height: 20vh;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
}

#hoverText{ 
  position: absolute;
  vertical-align: bottom;
  top: 0vw;
  width: 100%;
  height: 100%;
  opacity: 0; 
  transition: 0.4s;
  background: linear-gradient(rgba(0, 0, 0, 0), 70%, rgba(0, 0, 0, 0.8));
} 
.mainfamousBigLetterClass:hover #hoverText{ 
  opacity: 1; 
}
.mainfamousLittleLetterItemClass:hover #hoverText{
  opacity: 1; 
}
.bigMaker {
  margin-top: 25vw;
  font-size: 3vw;
  color: white;
  transition: 0.4s;
}
.smallMaker {
  margin-top: 12vw;
  font-size: 1.5vw;
  color: white;
  transition: 0.4s;
}
/* .bigMaker:hover {
  display: block;
  opacity: 1; 
} */
</style>