<template>
  <!-- 전체 폼 -->
  <side-bar></side-bar>
  <div class="donaForm">
    <h1 style="marginTop:0">Donation</h1>
    <!-- 현재 위치 -->
    <div class="container d-flex margin my-5" >
      <h3 v-show="!this.donationInfo.foundationSeq" @click.prevent class="col nowForm" :class="{ now: this.stage.one }">
        1. 기부 재단 선택
      </h3>
      <h3 v-show="this.donationInfo.foundationSeq" @click="move(1)" class="col nowDoneForm" :class="{ now: this.stage.one }">
        1. {{this.selOrganizationInfo.name}}
      </h3>
      <h3 v-show="!this.donationInfo.donationImgUrl" @click.prevent class="col nowForm" :class="{ now: this.stage.two }">
        2. 엽서 선택
      </h3>
      <h3 v-show="this.donationInfo.donationImgUrl" @click="move(2)" class="col nowDoneForm" :class="{ now: this.stage.two }">
        2. 엽서 선택 완료
      </h3>
      <h3 v-show="!this.donationInfo.donationText" @click.prevent class="col nowForm" :class="{ now: this.stage.three }">
        3. 문구 입력
      </h3>
      <h3 v-show="this.donationInfo.donationText" @click="move(3)" class="col nowDoneForm" :class="{ now: this.stage.three }">
        3. 문구 입력 완료
      </h3>
      <h3 v-show="!this.donationInfo.donationPay" @click.prevent class="col nowForm" :class="{ now: this.stage.four }">
        4. 기부금 선정
      </h3>
      <h3 v-show="this.donationInfo.donationPay" @click="move(4)" class="col nowDoneForm" :class="{ now: this.stage.four }">
        4. 기부금 선정 완료
      </h3>
    </div>
    <!-- 현황판 -->
    <div v-show="!this.stage.two" class="donaPostcard">
      <!-- 재단 로고 -->
      <img v-show="this.selOrganizationInfo.logURL" class="organLogo" v-bind:src="this.selOrganizationInfo.logURL" alt="선택재단">
      <div v-show="!this.selOrganizationInfo.logURL" class="organLogo"> 
        <img src="../../public/images/logo.png" style="width: 100%; height:100%" alt="엽AI로고">
      </div>
      <!-- 글자 입력 -->
      <div class="donaText"></div>
    </div>
    <!-- 현황판 뒷면 우편 선택 -->
    <div v-show="this.stage.two" class="donaPostcard">
      <img v-if="this.donationInfo.donationImgUrl" v-bind:src="this.donationInfo.donationImgUrl" alt="엽서사진" />
    </div>
    <!-- 재단 선택 리스트 -->
    <div v-show="this.organizationList && this.stage.one">
      <!-- 재단 목록 -->
      <h1>재단 선택</h1>
      <div class="donaCardList">
        <div
          v-for="(organization, index) in this.organizationList"
          :key="`organizationList-${index}`"
        >
          <div class="donaCard" @click="selOrg(organization.foundationName,
                    organization.foundationLogoUrl, organization.foundationSeq)">
            <img v-if="organization.foundationUrlLogo" v-bind:src="organization.foundationUrlLogo"
              class="donaImg"
            />
            <img v-if="!organization.foundationUrlLogo" src="../../public/images/logo.png" class="donaImg">
            <h4 class="donaTitle">{{ organization.foundationName }}</h4>
          </div>
        </div>
      </div>
    </div>
    <!-- 엽서 선택 리스트 -->
    <div v-show="this.postcardList && this.stage.two">
      <div class="d-flex title">
        <h3 class="titleText">내가 그린 엽서 목록</h3>
        <div class="d-flex titleText">
          <i class="bi bi-chevron-left" @click="postcardMove('left')"></i>
          <b>{{this.postcardStage +1}} / {{Math.ceil(this.postcardList.length / 5)}}</b>
          <i class="bi bi-chevron-right" @click="postcardMove('right')"></i>
        </div>
      </div>
      <div v-for="(page, index) in Math.ceil(this.postcardList.length / 5)"
        :key="`page-${index}`" >
        <div v-show="index === this.postcardStage" class="postcardList">
          <div v-for="(postcard, idx) in this.postcardList.slice(index * 5, (index + 1) *5)" :key="`postcard-${page}-${idx}`">
            <img class="postcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
          </div>
        </div>
      </div>
      <div class="d-flex title">
        <h3 class="titleText">좋아요한 엽서 목록</h3>
        <div class="d-flex titleText">
          <i class="bi bi-chevron-left" @click="postcardMove('L-left')"></i>
          <b>{{this.likedPostcardStage +1}} / {{Math.ceil(this.likedPostcards.length / 5)}}</b>
          <i class="bi bi-chevron-right" @click="postcardMove('L-right')"></i>
        </div>
      </div>
      <div v-for="(page, idx) in Math.ceil(this.likedPostcards.length / 5)"
        :key="`liked-page-${idx}`" >
        <div v-show="idx === this.likedPostcardStage" class="postcardList">
          <div v-for="(postcard, idx) in this.likedPostcards.slice(idx * 5, (idx + 1) *5)" :key="`likedPostcard-${page}-${idx}`">
            <img class="postcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
          </div>
        </div>
      </div>
      <div class="title">
        <h3 class="titleText" v-if="!this.postcardList && !this.likedPostcards">
          자신만의 엽서를 생성하거나 다른 사람의 엽서를 좋아요를 누른 후 나만의
          엽서리스트를 생성해 주세요
        </h3>
      </div>
    </div>
    <!-- 문구 입력 -->
    <div v-show="this.stage.three" class="textBack">
      <!-- 입력내용 줄 넘기기 가능하게 설정 -->
      <input v-model="this.donationInfo.donationText" type="text" />
    </div>
    <!-- 기부금 선택 입력 -->
    <form v-show="this.stage.four">
      <label for="pay">기부 금액 : </label>
      <input v-model="this.donationInfo.donationPay" type="number" id="pay" />
    </form>
    <div class="donaButtons">
      <b>{{ errorMSG }}</b>
      <i @click.prevent="preStage" v-show="!this.stage.one" class="bi bi-arrow-left-square " style="font-size: 3rem; color: black;" />
      <i @click.prevent="nextStage" v-show="!this.stage.four" class="bi bi-arrow-right-square " style="font-size: 3rem; color: black;" />
      <button @click="pay" v-show="this.stage.four">기부</button>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue";
const donationStore = "donationStore";
const organizationStore = "organizationStore";
const postcardStore = "postcardStore";
const accountStore = "accountStore";

export default {
  name: "OrganizationListView",
  components: { SideBar},
  data() {
    return {
      // 요청을 보낸 정보들
      donationInfo: {
        donationImgUrl: null,
        donationPay: null,
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
      // 우편 페이지내이션
      postcardStage: 0,
      likedPostcardStage: 0,
      // 에러 메시지
      errorMSG: null,
    };
  },

  computed: {
    ...mapGetters(organizationStore, ["organizationList"]),
    ...mapGetters(postcardStore, ["postcardList", "likedPostcards"]),
    ...mapGetters(accountStore, ["userInfo"]),
  },

  methods: {
    ...mapActions(donationStore, ["doDonate"]),
    // 재단 리스트 용
    ...mapActions(organizationStore, ["getFoundationList"]),
    // 엽서 리스트 용
    ...mapActions(postcardStore, ["userPostcardList", "userLikedPostcardStore"]),
    // 상위 버튼을 통한 이동
    move(num) {
      if (num === 1) {
        this.stage.one = true
        this.stage.two = this.stage.three = this.stage.four = false
      } else if (num === 2) {
        this.stage.two = true
        this.stage.one = this.stage.three = this.stage.four = false
      } else if (num === 3) {
        this.stage.three = true
        this.stage.one = this.stage.two = this.stage.four = false
      } else {
        this.stage.four = true
        this.stage.one = this.stage.two = this.stage.three = false
      }
    },
    // 단계 이동 메서드
    nextStage() {
      // 1단계 > 2단계
      if (this.stage.one) {
        // 선택된 재단이 없는 경우
        if (!this.selOrganizationInfo.name) {
          this.errorMSG = "재단을 선택해주세요";
        } else {
          // 단계 이동 및 에러 메시지 초기화
          this.stage.one = false;
          this.stage.two = true;
          this.errorMSG = null;
        }
        // 2단계 > 3단계
      } else if (this.stage.two) {
        // 선택된 엽서가 없는 경우
        if (!this.donationInfo.donationImgUrl) {
          this.errorMSG = "엽서를 선택해주세요";
        } else {
          // 단계 이동 및 에러 메시지 초기화
          this.stage.two = false;
          this.stage.three = true;
          this.errorMSG = null;
        }
        // 3단계 > 4단계
      } else if (this.stage.three) {
        this.stage.three = false;
        this.stage.four = true;
      }
    },
    // 이전 화면으로
    preStage() {
      if (this.stage.two) {
        this.stage.two = false;
        this.stage.one = true;
      } else if (this.stage.three) {
        this.stage.three = false;
        this.stage.two = true;
      } else {
        this.stage.four = false;
        this.stage.three = true;
      }
    },
    // 재단 선택
    selOrg(name, URL, Seq) {
      this.selOrganizationInfo.name = name;
      this.selOrganizationInfo.logoURL = URL;
      this.donationInfo.foundationSeq = Seq;
      this.errorMSG = null;
    },
    // 엽서 선택
    selPostcard(URL) {
      this.donationInfo.donationImgUrl = URL;
      this.errorMSG = null;
    },
    // 엽서 목록 변경
    postcardMove(direction) {
      if (direction === 'left' && this.postcardStage > 0) {
        this.postcardStage -= 1
        // 좋아요한 엽서 목록 페이지 변경
      } else if (direction === 'L-left' && this.likedPostcardStage > 0) {
        this.likedPostcardStage -= 1
        // 좋아요한 엽서 목록 페이지 변경
      } else if (direction === 'L-right' && this.likedPostcardStage < Math.ceil(this.userLikedPostcard.postcardList.length / 5) - 1) {
        this.likedPostcardStage += 1
      } else if (direction === 'right' && this.postcardStage < Math.ceil(this.userLikedPostcard.postcardList.length / 5) - 1) {
        this.postcardStage += 1
      }
    },
    // 결제하기
    pay() {
      const { IMP } = window;
      // 관리자 콘솔 내 가맹정 식별코드
      IMP.init("imp40811644");
      // 결제 메서드 실행
      IMP.request_pay(
        {
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid:
            `${this.selOrganizationInfo.name}-donation` + new Date().getTime(),
          name: this.selOrganizationInfo.name, //결제창에서 보여질 이름
          amount: this.donationInfo.donationPay,
          buyer_tel: this.userInfo.userPhone,
          buyer_name: this.userInfo.userName,
          // function 형식으로 접근 시 callback 함수는 this.에 접근 불가
          // arrow function으로 접근해야 this. 접근 가능
        },
        (rsp) => {
          // 결제 내역 저장할 지 여부 확인(당장은 x)
          if (rsp.success) {
            if (rsp.paid_amount === this.donationInfo.donationPay) {
              //도내이션 요청 보내기
              this.doDonate({
                ...this.donationInfo,
                userSeq: this.userInfo.userSeq,
              });
              this.reset();
              this.$router.push({ name: "MypageView", params: { user_id: this.userInfo.user_id } })
              //값이 같지 않은 경우 문제o
            } else {
              this.errorMSG = "결제가 정상적으로 이루어지지 않았습니다.";
            }
          } else {
            console.log(rsp.error_msg);
            this.errorMSG = "결제가 정상적으로 이루어지지 않았습니다.";
          }
        }
      );
    },
    // 입력값들 리셋
    reset() {
      this.donationInfo = {
        donationImgUrl: null,
        donationPay: null,
        donationText: "",
        foundationSeq: null,
      };
      this.selOrganizationInfo = { name: null, logoURL: null };
      this.stage = { one: true, two: false, three: false, four: false };
      this.errorMSG = null;
      this.postcardStage = 0;
      this.likedPostcardStage = 0;
    },
  },
  created() {
    if (!this.userInfo) {
      this.$router.push({ name: "beginningView" });
    }
    // 재단 목록이 없다면 재단 목록 가져오기
    if (!this.organizationList.length) {
      this.getFoundationList();
    }
    if (!this.postcardList.length) {
      this.userPostcardList(this.userInfo.userSeq);
    }
    // 좋아요한 엽서 받아오기
    if (!this.likedPostcards.length) {
      this.userLikedPostcardStore(this.userInfo.userSeq)
    }
    console.log(this.likedPostcards)
    // 시작과 동시에 링크로 온 재단을 선택하게 변경
    // this.userInfo.foundationSeq = this.params.foundationSeq
  },
  mounted() {
    this.reset();
  },
};
</script>

<style>
.donaForm {
  position: relative;
  width: 93vw;
  height: 100vh;
  background-color: antiquewhite;
}
.nowForm {
  border: 3px double;
  border-color: black;
  border-radius: 10px;
  background-color: ivory;
  pointer-events: none;
}
.nowDoneForm {
  border: 3px double;
  border-color: black;
  border-radius: 10px;
  background-color: ivory;
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

/* 예시 현황 */
.donaPostcard {
  /* background: url("@/assets/Back.png");
  background-position: center bottom;
  background-repeat: no-repeat;
  background-size: cover; */
  margin: auto;
  position: relative;
  background-color: white;
  width: 70vw;
  height: 50vh;
  align-self: center;
}
.organLogo {
  position: absolute;
  left: 1vw;
  top: 1vh;
  width: 8vw;
  height: 10vw;
  border: 1px solid;
}
.donaText {
  position: absolute;
  left: 35vw;
  top: 2vh;
  width: 30vw;
  height: 45vh;
  border-left: 1px solid black;
}

/* 재단 리스트 */
.donaCardList {
  position: relative;
  display: flex;
  width: 70vw;
  margin: auto
}

.donaCard {
  width: 12vw;
  height: 18vh;
  margin: 1px;
  border: 0.1px solid;
  border-radius: 10px;
  background-color: white;
}
.donaImg {
  width: 100%;
  height: 70%;
}
.donaTitle {
  text-align: center;
  width: auto;
  margin: 0.5vw
}
.donaButton {
  text-align: center;
  width: 4vw;
  margin: 0.5vw;
}

/* 엽서 모음 */
.postcardList {
  position: relative;
  display: flex;
  width: 70vw;
  margin: auto
}
.postcardImg{
  width: 13vw;
  height: 6vh;
  margin: 1px;
}
.title {
  margin: auto;
  justify-content: space-between;
  width: 70vw;
}
.titleText {
  margin-top: 1vh;
  margin-bottom: 1vh;
}

/* 마지막 버튼 모음 */
.donaButtons {
  position: absolute;
  right: 1vw;
  bottom: 1vh;
}

</style>
