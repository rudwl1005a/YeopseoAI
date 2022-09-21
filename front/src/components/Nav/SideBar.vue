<template>
<div :class="{ mainopendToggle : opendToggle , mainclosedToggle : !opendToggle}">
  <!-- 나중에 라우터 링크로 바꾸자 -->
  <div v-if="toggleContent" data-aos="fade-up" data-aos-duration="500">
    <div class="mainpageBtn">home</div>
    <div class="mainpageBtn">letter</div>
    <div class="mainpageBtn">foundation</div>
    <div class="mainpageBtn">mypage</div>
    <div class="mainpageBtn">logout</div>
  </div>
</div>
<div class="mainSideBarClass">
  <!-- 토글 아이콘 넣자 -->
  <div class="mainsidebarToggle" @click="openSidebar">
  대충 여기 토글 아이콘 ㄱ
  </div>
</div>
</template>

<script>
export default {
  name: "SideBar",
  data() {
    return {
      // 사이드바 토글 관련
      opendToggle: false,
      toggleContent: false,
    }
  },
  methods: {
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
  }
}
</script>

<style>

</style>