<template>
<div class="mainLogoClass" @click="goHome"></div>
<div :class="{ mainopendToggle : opendToggle , mainclosedToggle : !opendToggle}">
  <!-- 나중에 라우터 링크로 바꾸자 -->
  <div v-if="toggleContent" data-aos="fade-up" data-aos-duration="500">
    <div class="sideBtn" @click="goHome">home</div>
    <div class="sideBtn" @click="goLetter">postcard</div>
    <div class="sideBtn" @click="goFoundation">donation</div>
    <div class="sideBtn" @click="goMypage">mypage</div>
    <div v-if="isLogged" @click="userLogoutandGo" class="sideBtn">logout</div>
    <div v-if="!isLogged" @click="goLogin" class="sideBtn">login</div>
  </div>
</div>
<div style="background-color: #faf8f5;" class="mainSideBarClass">
  <!-- 토글 아이콘 넣자 -->
  <div :class="{ mainsidebarToggle : !opendToggle , mainsidebarToggle2 : opendToggle }" @click="openSidebar"></div>
  <a href="https://instagram.com/yeopseo_ai?r=nametag"><div class="instaLogo"></div></a>
  <div class="phoneLogo"></div>
  <div class="phoneNum">010-1010-1010</div>
</div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
const accountStore = "accountStore";
const boardStore = "boardStore";
const donationStore = "donationStore";
const mainpageStore = "mainpageStore";
const mypageStore = "mypageStore";
const organizationStore = "organizationStore";
const postcardStore = "postcardStore";
const searchStore = "searchStore";

export default {
  name: "SideBar",
  data() {
    return {
      // 사이드바 토글 관련
      opendToggle: false,
      toggleContent: false,
    }
  },
  computed: {
    ...mapGetters(accountStore, ["isLogged", "userInfo"]),
  },
  methods: {
    ...mapActions(accountStore, ["accountStoreReset"]),
    ...mapActions(boardStore, ["boardStoreReset"]),
    ...mapActions(donationStore, ["donationStoreReset"]),
    ...mapActions(mainpageStore, ["mainpageStoreReset"]),
    ...mapActions(mypageStore, ["mypageStoreReset"]),
    ...mapActions(organizationStore, ["organizationStoreReset"]),
    ...mapActions(postcardStore, ["postcardStoreReset"]),
    ...mapActions(searchStore, ["searchStoreReset"]),

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
    goLogin() {
      this.$router.push({name: "beginningView"});
    },
    userLogoutandGo() {
      // 각 module 초기화
      this.accountStoreReset();
      this.donationStoreReset()
      this.mainpageStoreReset()
      this.mypageStoreReset()
      this.organizationStoreReset()
      this.postcardStoreReset()
      this.searchStoreReset()
      // // 세션 초기화
      // window.sessionStorage.clear()
      this.$router.push({name: "beginningView"});
    },
    goHome() {
      this.$router.push('/main');
    },
    goLetter() {
      this.$router.push('/makecard');
    },
    goFoundation() {
      this.$router.push('/donation');
    },
    goMypage() {
      this.$router.push({path: `/mypage/${this.userInfo.userSeq}`, query: {ownerSeq: this.userInfo.userSeq}});
      console.log("홈 새로고침");
    },
  }
}
</script>

<style>
.sideBtn {
  margin-left: 5vw;
  margin-top: 3vh;
  cursor: pointer;
  width: 5vw;
  height: 5vh;
  font-size: 2.5vw;
  text-align: left;
  transition: 0.4s;
}
.sideBtn:hover {
  margin-left: 5vw;
  margin-top: 2vh;
  cursor: pointer;
  width: 5vw;
  height: 5vh;
  font-size: 2.5vw;
  text-align: left;
  transition: 0.4s;
  font-size: 2.6vw;
}

.phoneLogo {
  position: absolute;
  height: 2vw;
  width: 2vw;
  top: 80%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-size: 2vw 2vw;
  background-repeat: no-repeat;
  background-image: url("../../../public/images/phoneLogo.png");
}

.instaLogo {
  cursor: pointer;
  position: absolute;
  height: 2vw;
  width: 2vw;
  top: 70%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-size: 2vw 2vw;
  background-repeat: no-repeat;
  background-image: url("../../../public/images/instaLogo.png");
}

.phoneNum {
  position: absolute;
  line-height: 6vw;
  vertical-align: middle;
  top: 90%;
  left: 50%;
  transform: translate(-50%, -50%);
  height: 20vh;
  width: 6vw;
  writing-mode: vertical-rl;
  font-size: 2.5vh;
  margin: auto;
  overflow: auto;
}

.phoneNum::-webkit-scrollbar {
  display: none;
}

.mainsidebarToggle {
  cursor: pointer;
  margin: auto;
  margin-top: 1vh;
  height: 3vw;
  width: 3vw;
  background-image: url("../../../public/images/sidebar_toggle.png");
  background-size: 3vw 3vw;
  background-repeat: no-repeat;
  transition: 0.8s;
}
.mainsidebarToggle2 {
  cursor: pointer;
  margin: auto;
  margin-top: 1vh;
  height: 4vw;
  width: 4vw;
  background-image: url("../../../public/images/sidebar_toggle.png");
  background-size: 4vw 4vw;
  background-repeat: no-repeat;
  transform: rotate(90deg);
  transition: 0.8s;
}
</style>