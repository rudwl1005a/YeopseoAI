<template>
<!-- 전체 폼 -->
    <div class="donaForm">
      <h1>Donation</h1>
      <!-- 현황 폼 -->
      <div class="container d-flex">
        <b class="col">기부 단체: params.name </b>
        <b class="col">우편:  </b>
        <b class="col">문구: </b>
        <b class="col">기부금액: </b>
      </div>
      <!-- 현재 위치 상황 판 -->
      <div class="container d-flex">
        <button @click.prevent class="col nowForm" :class="{now: this.stage.one}" style="{{this.stage.one}}? now:">기부단체 선택</button>
        <button @click.prevent class="col nowForm" :class="{now: this.stage.two}">우편 선택</button>
        <button @click.prevent class="col nowForm" :class="{now: this.stage.three}">문구 입력</button>
        <button @click.prevent class="col nowForm" :class="{now: this.stage.four}">기부금 선정</button>
      </div>
      <!-- 재단 선택 리스트 -->
      <div v-show="this.stage.one">
        <h1>재단 선택</h1>
        <div v-for="{index, organization} in this.organizationList" :key="`organizationList-${index}`" class="organizationList">
          <div class="organizationItem">
            <div class="img">
              <img src="organization.foundationUrlLogo" decoding="async" class=" lazyloaded">
              <noscript>
                <img src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_kasumi.png" alt="" data-eio="l">
              </noscript>
            </div>
            <p class="name">{{organization.foundationName}}</p>
            <p class="text">{{organization.foundationContent}}</p>
            <button @click="selOrg(organization.foundationName, organization.foundationLogoUrl, organization.foundationSeq)">재단 선택</button>
          </div>
      </div>
      </div>
      <!-- 우편 선택 리스트 -->
      <div v-show="this.stage.two">

      </div>
      <!-- 문구 입력 -->
      <div v-show="this.stage.three">

      </div>
      <!-- 기부금 선택 입력 -->
      <div v-show="this.stage.four">

      </div>
    </div>
    <!-- 기부 테스트 -->
    <input type="file" accept="image/*" @change="changeImage" />
    <img :src="donationInfo.donationImgUrl" alt="">
    <input
      type="number"
      placeholder="얼마?"
      v-model="donationInfo.donationPay"
    />
    <input
      type="text"
      placeholder="응원메세지"
      v-model="donationInfo.donationText"
    />
    <input
      type="number"
      placeholder="foundationSeq"
      v-model="donationInfo.foundationSeq"
    />
    <input
      type="number"
      placeholder="userSeq"
      v-model="donationInfo.userSeq"
    />
    <button @click="donate">기부ㄱㄱ</button>


</template>
  
  <script>
  import { mapActions, mapGetters } from "vuex";
  const donationStore = "donationStore";
  const organizationStore = "organizationStore"

  export default {
    name:"OrganizationListView",
    data() {
    return {
        donationInfo : {
          donationImgUrl: null,
          donationPay: null,
          donationText: null,
          foundationSeq: null,
          userSeq: null,
        },
        selOrganizationInfo: {
          name: null,
          logo_URL: null,
        },
        dummy: 1,
        stage: {
          one: true,
          two: false,
          three: false,
          four: false,
        },
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
      ...mapActions(donationStore, ["doDonate"]),
      ...mapActions(organizationStore, ["getFoundationList"]),
      donate() {
        console.log(this.donationInfo)
        this.doDonate(this.donationInfo)
      },
      selOrg(name, URL, Seq){
        this.selOrganizationInfo.name = name
        this.selOrganizationInfo.logo_URL = URL
        this.donationInfo.foundationSeq = Seq
        
      },

      changeImage(image) {
        // 업로드한 파일 보여주기
        // const reader = new FileReader();
        // reader.onload = (e) => {
        //   this.donationInfo.donationImgUrl = e.target.result;
        // }   

        this.donationInfo.donationImgUrl = URL.createObjectURL(image.target.files[0])
      }

    },


    created() {
      // 재단 목록 가져오기
      this.getFoundationList()
    },


    mounted() {
      this.donationInfo = {
          donationImgUrl: '',
          donationPay: '',
          donationText: '',
          foundationSeq: '',
          userSeq: '',
        }
    },  
  }
  </script>
  
  <style>
  .donaForm {
    width: 90vw;
    height: 90vh;
    background-color: antiquewhite;
  }
  .nowForm {
    margin: auto;
  }
  .now {
    background-color: aquamarine;
  }
  
  </style>