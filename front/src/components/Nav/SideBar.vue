<template>
<div class="mainLogoClass" @click="goHome"></div>
<div :class="{ mainopendToggle : opendToggle , mainclosedToggle : !opendToggle}">
  <!-- 나중에 라우터 링크로 바꾸자 -->
  <div v-if="toggleContent" data-aos="fade-up" data-aos-duration="500">
    <div class="mainpageBtn" @click="goHome">home</div>
    <div class="mainpageBtn" @click="goLetter">letter</div>
    <div class="mainpageBtn" @click="goFoundation">foundation</div>
    <div class="mainpageBtn" @click="goMypage">mypage</div>
    <div v-if="isLogged" @click="userLogoutandGo" class="mainpageBtn">logout</div>
    <div v-if="!isLogged" @click="goLogin" class="mainpageBtn">login</div>
  </div>
</div>
<div style="background-color: #faf8f5;" class="mainSideBarClass">
  <!-- 토글 아이콘 넣자 -->
  <div :class="{ mainsidebarToggle : !opendToggle , mainsidebarToggle2 : opendToggle }" @click="openSidebar"></div>
  <div class="instaLogo"></div>
  <div class="phoneLogo"></div>
  <div class="phoneNum"></div>
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
    ...mapGetters(accountStore, ["isLogged"]),
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
      this.$router.push('/organizationlist');
    },
    goMypage() {
      this.$router.push({path: `/mypage/${this.userInfo.userSeq}`, query: {ownerSeq: this.userInfo.userSeq}});
      console.log("홈 새로고침");
    },
  }
}
</script>

<style>
.phoneLogo {
  position: absolute;
  height: 2vw;
  width: 2vw;
  top: 85%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-size: 2vw 2vw;
  background-repeat: no-repeat;
  background-image: url("../../../public/images/phoneLogo.png");
}

.instaLogo {
  position: absolute;
  height: 2vw;
  width: 2vw;
  top: 75%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-size: 2vw 2vw;
  background-repeat: no-repeat;
  background-image: url("../../../public/images/instaLogo.png");
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
  transform: rotate(270deg);
  transition: 0.8s;
}
</style>