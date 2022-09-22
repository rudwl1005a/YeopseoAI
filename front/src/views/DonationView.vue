<template>
<!-- 전체 폼 -->
    <div class="donaForm">
      <h1>Donation</h1>
      <!-- 현황 폼 -->
      <div class="container d-flex">
        <b class="col">기부 단체: {{this.selOrganizationInfo.name}} </b>
        <b class="col">우편 <b v-if="this.donationInfo.donationImgUrl">선택 완료</b></b>
        <b class="col">문구: <b v-if="!this.donationInfo.donationText">입력 문구 없음</b> </b>
        <b class="col">기부금액: {{this.selOrganizationInfo.donationPay}} </b>
      </div>
      <!-- 현재 위치 상황 판 -->
      <div class="container d-flex">
        <button @click.prevent class="col nowForm" :class="{now: this.stage.one}" style="{{this.stage.one}}? now:">기부단체 선택</button>
        <button @click.prevent class="col nowForm" :class="{now: this.stage.two}">우편 선택</button>
        <button @click.prevent class="col nowForm" :class="{now: this.stage.three}">문구 입력</button>
        <button @click.prevent class="col nowForm" :class="{now: this.stage.four}">기부금 선정</button>
      </div>
      <!-- 재단 선택 리스트 -->
      <div v-show="this.organizationList && this.stage.one">
        <h1>재단 선택</h1>
        <!-- 현재 선택된 재단 -->
        <div class="card" style="width: 18rem;">
            <img v-bind:src=this.selOrganizationInfo.logURL alt="재단로고" class="card-img-top">
            <div class="card-body">
              <h5 class="card-title">{{this.selOrganizationInfo.name}}</h5>
            </div>
          </div>
        <!-- 재단 목록 -->
        <div v-for="(organization, index) in this.organizationList" :key="`organizationList-${index}`" class="organizationList">
          <div class="card" style="width: 18rem;">
            <img v-bind:src=organization.foundationUrlLogo alt="재단로고" class="card-img-top">
            <div class="card-body">
              <h5 class="card-title">{{organization.foundationName}}</h5>
              <p class="card-text">{{organization.foundationContent}}</p>
              <button @click="selOrg(organization.foundationName, organization.foundationLogoUrl, organization.foundationSeq)">재단 선택</button>
            </div>
          </div>
        </div>
      </div>
      <!-- 우편 선택 리스트 -->
      <div v-show="this.postcardList && this.stage.two">
        <h1>우편 선택</h1>
        <!-- 우편 링크도 보내지면 다시 작성 -->
        <!-- 현재 선택된 우편 -->
          <!-- <img v-bind:src=this.donationInfo.donationImgUrl alt="우편사진"> -->
        <!-- 우편 목록 -->
        <!-- <div v-for="(postcard, index) in this.postcardList" :key="`postcardList-${index}`" class="postcardList"> -->
          <!-- <img v-bind:src=postcard.postcardImgUrl alt="우편사진" @click="selPostcard(postcard.postcardImgUrl)"> -->
        <!-- </div> -->
      </div>
      <!-- 문구 입력 -->
      <div v-show="this.stage.three" class="textBack">
        <!-- 입력내용 줄 넘기기 가능하게 설정 -->
        <input v-model="this.donationInfo.donationText" type="text">
      </div>
      <!-- 기부금 선택 입력 -->
      <form v-show="this.stage.four">
        <label for="pay">기부 금액 : </label>
        <input type="number" id="pay">
      </form>
      <div>
        <b>{{errorMSG}}</b>
        <button @click.prevent="preStage" v-show="!this.stage.one">이전</button>
        <button @click.prevent="nextStage" v-show="!this.stage.four">다음</button>
        <button @click="donate" v-show="this.stage.four">기부</button>
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
  const organizationStore = "organizationStore";
  const postcardStore = "postcardStore";
  const accountStore = "accountStore";

  export default {
    name:"OrganizationListView",
    data() {
    return {
        // 요청을 보낸 정보들
        donationInfo : {
          donationImgUrl: null,
          donationPay: 0,
          donationText: "",
          foundationSeq: null,
          // 유저 시퀀스는 보낼때만 사용
        },
        // 선택된 재단
        selOrganizationInfo: {
          name: null,
          logoURL: null,
        },
        // 더미로 기본 재단입력
        dummy: 1,
        // 현재 진행 상태
        stage: {
          one: true,
          two: false,
          three: false,
          four: false,
        },
        // 에러 메시지
        errorMSG: null,
      };
    },


    computed: {
      ...mapGetters(organizationStore, ["organizationList"]),
      ...mapGetters(postcardStore, ["postcardList"]),
      ...mapGetters(accountStore, ['userInfo']),
    },


    methods: {
      ...mapActions(donationStore, ["doDonate"]),
      // 재단 리스트 용
      ...mapActions(organizationStore, ["getFoundationList"]),
      // 우편 리스트 용
      ...mapActions(postcardStore, ["userPostcardList"]),
      // 단계 이동 메서드
      nextStage() {
        // 1단계 > 2단계 
        if (this.stage.one) {
          // 선택된 재단이 없는 경우
          if (!this.selOrganizationInfo.name) {
            this.errorMSG = "재단을 선택해주세요"
          } else {
            // 단계 이동 및 에러 메시지 초기화
            this.stage.one = false
            this.stage.two = true
            this.errorMSG = ""
          }
        // 2단계 > 3단계
        } else if (this.stage.two) {
          //현재는 더미라도 하기
          this.donationInfo.donationImgUrl = this.dummy
          // 선택된 우편이 없는 경우
          if (!this.donationInfo.donationImgUrl) {
            this.errorMSG = "우편을 선택해주세요"
          } else {
            // 단계 이동 및 에러 메시지 초기화
            this.stage.two = false
            this.stage.three = true
            this.errorMSG = ""
          }
        // 3단계 > 4단계
        } else if (this.stage.three) {
          this.stage.three = false
          this.stage.four = true
        }
      },
      preStage() {
        if (this.stage.two) {
          this.stage.two = false
          this.stage.one = true
        } else if (this.stage.three) {
          this.stage.three = false
          this.stage.two = true
        } else {
          this.stage.four = false
          this.stage.three = true
        }
      },
      donate() {
        console.log({...this.donationInfo, userSeq: this.userInfo.userSeq})
        this.doDonate({...this.donationInfo, userSeq: this.userInfo.userSeq})
      }, 
      // 재단 선택 후 메시지는 초기화
      selOrg(name, URL, Seq){
        this.selOrganizationInfo.name = name
        this.selOrganizationInfo.logoURL = URL
        this.donationInfo.foundationSeq = Seq
        this.errorMSG = ""
      },
      // 우편 선택 후 메시지는 초기화
      selPostcard(URL) {
        this.donationInfo.donationImgUrl = URL
        this.errorMSG = ""
      },

      changeImage(image) {
        // 업로드한 파일 보여주기
        // const reader = new FileReader();
        // reader.onload = (e) => {
        //   this.donationInfo.donationImgUrl = e.target.result;
        // }   

        this.donationInfo.donationImgUrl = URL.createObjectURL(image.target.files[0])
      },
      reset () {
        this.donationInfo = { donationImgUrl: null, donationPay: 0,
          donationText: "",foundationSeq: null,};
        this.selOrganizationInfo =  {name: null, logoURL: null };
        this.stage = {one: true, two: false, three: false, four: false};
        this.errorMSG = null;
      },

    },


    created() {
      if (!this.userInfo) {
        this.$router.push({name: "beginningView"})
      }
      // 재단 목록이 없다면 재단 목록 가져오기
      if (!this.organizationList.length){
        this.getFoundationList()
      }
      if (!this.postcardList.length) {
        // this.userPostcardList(this.userInfo.userSeq)
        // 확인용 더미 나중에 만들어지면 위에 것으로
        this.userPostcardList(this.dummy)
      }
    },


    mounted() {
      this.reset
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
  .organizationclass {
    background-color: skyblue;
  }
  .organizationItem {
    background-color: antiquewhite;
  }
  .textBack {
    background: url("@/assets/Back.png");
    background-position: center bottom;
    background-repeat: no-repeat;
    background-size: cover;
    width: 50vw;
    height: 25vh;
    align-self: center;
  }
  </style>