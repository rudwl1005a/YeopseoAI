<template>
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
<div class="mainSideBarClass">
  <!-- 토글 아이콘 넣자 -->
  <div :class="{ mainsidebarToggle : !opendToggle , mainsidebarToggle2 : opendToggle }" @click="openSidebar"></div>
</div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
const accountStore = "accountStore";

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
    ...mapActions(accountStore, ["userLogout"]),
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
      this.userLogout();
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
      this.$router.push('/mypage');
    },
  }
}
</script>

<style>
.mainsidebarToggle {
  cursor: pointer;
  margin: auto;
  height: 4vw;
  width: 4vw;
  background-image: url("../../../public/images/sidebar_toggle.png");
  background-size: 4vw 4vw;
  background-repeat: no-repeat;
  transition: 0.8s;
}
.mainsidebarToggle2 {
  cursor: pointer;
  margin: auto;
  height: 5vw;
  width: 5vw;
  background-image: url("../../../public/images/sidebar_toggle.png");
  background-size: 5vw 5vw;
  background-repeat: no-repeat;
  transform: rotate(270deg);
  transition: 0.8s;
}
</style>