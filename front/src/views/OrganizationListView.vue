<template>

  <div>기부단체 목록 화면임</div>
  <div :onclick="donation">기부하실?</div>
  <div @click="setFoundationInfo(organizationList[0].foundationSeq)" >{{ organizationList[0].foundationContent }}</div>
  <div class="organizationClass">
    <div class="mainLogoClass">
      <h1>엽AI사전</h1>
    </div>
    <b style="font-size: 1.5vw; bold">기부재단</b>
    <br>
    <div class="followOrganization">
      <div class="c-title02">
        <h2 class="main">メンバー</h2>
      </div>
      <div class="organizationList">

          <div class="organizationItem">
            <div class="img">
              <img src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_kasumi.png" alt="" data-src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_kasumi.png" decoding="async" class=" lazyloaded">
              <noscript>
                <img src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_kasumi.png" alt="" data-eio="l">
              </noscript>
            </div>
            <p class="name"></p>
            <p class="text"></p>
          </div>

          <div class="organizationItem">
            <div class="img">
              <img src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_naoto.png" alt="" data-src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_naoto.png" decoding="async" class=" lazyloaded">
              <noscript>
                <img src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_naoto.png" alt="" data-eio="l">
              </noscript>
            </div>
            <p class="name"></p>
            <p class="text"></p>
          </div>

      </div>
    </div>        
  </div>
  </template>
  
  <script>
  import { mapActions, mapGetters } from "vuex";
  const organizationStore = "organizationStore";

  export default {
    name:"OrganizationListView",
    data() {
    return {
    };
    },


    computed: {
      ...mapGetters(organizationStore, [
        "organizationList",
        "organizationInfo",
        "organizationDonationList",
      ]),
    },


    methods: {
      ...mapActions(organizationStore, [
        "getFoundationInfo",
        "getFoundationList",
        "getFoundationDonationList",
      ]),

      donation() {
        this.$router.push('/donation')
      },

      // 재단 인포 들고오기
      setFoundationInfo(foundationSeq) {
        console.log(foundationSeq)
        // 스토어에서 foundation_Seq 들고와서 넣어줘야됨
        this.getFoundationInfo(foundationSeq)
      },
      // 재단 인포 들고오기
      setFoundationDonationList() {
        // 스토어에서 foundation_Seq 들고와서 넣어줘야됨
        this.getFoundationDonationList()
      },
    },


    created() {
      // 재단 목록이 없는 경우 재단리스트 가져오기
      if (!this.organizationList) {
        this.getFoundationList()
      }
    },


    mounted() {

    },  
  }
  </script>
  
  <style>
  .organizationClass {
    position: relative;
    height: 100%;
    background-color: #faf8f5;
  }

  .followOrganization {
    margin: 0 auto;
    padding: 0 5vh;
    max-width: 1220px;
  }

  .organizationList {
    display: flex;
    justify-content: space-between;
    justify-content: space-between;
    max-width: 890px;
    margin: 40px auto 0;
  }
  
  .organizationItem {
    background: #fff;
    border-radius: 30px;
    padding: 40px 40px 35px;
    width: 47.2%;
    box-sizing: border-box;
  }

  </style>