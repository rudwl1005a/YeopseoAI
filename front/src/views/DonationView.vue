<template>
  <!-- 전체 폼 -->
  <div class="donaForm">
    <h1>Donation</h1>
    <!-- 현황 폼 -->
    <div class="container d-flex">
      <b class="col">기부 단체: {{ this.selOrganizationInfo.name }} </b>
      <b class="col"
        >엽서 <b v-if="this.donationInfo.donationImgUrl">선택 완료</b></b
      >
      <b class="col"
        >문구: <b v-if="!this.donationInfo.donationText">입력 문구 없음</b>
        <b v-if="this.donationInfo.donationText">{{
          this.donationInfo.donationText.slice(0, 10)
        }}</b>
      </b>
      <b class="col">기부금액: {{ this.donationInfo.donationPay }} </b>
    </div>
    <!-- 현재 위치 상황 판 -->
    <div class="container d-flex">
      <button
        @click.prevent
        class="col nowForm"
        :class="{ now: this.stage.one }"
        style="{{this.stage.one}}? now:"
      >
        기부단체 선택
      </button>
      <button
        @click.prevent
        class="col nowForm"
        :class="{ now: this.stage.two }"
      >
        엽서 선택
      </button>
      <button
        @click.prevent
        class="col nowForm"
        :class="{ now: this.stage.three }"
      >
        문구 입력
      </button>
      <button
        @click.prevent
        class="col nowForm"
        :class="{ now: this.stage.four }"
      >
        기부금 선정
      </button>
    </div>
    <!-- 재단 선택 리스트 -->
    <div v-show="this.organizationList && this.stage.one">
      <h1>재단 선택</h1>
      <!-- 현재 선택된 재단 -->
      <div class="card" style="width: 18rem">
        <img
          v-bind:src="this.selOrganizationInfo.logURL"
          alt="재단로고"
          class="card-img-top"
        />
        <div class="card-body">
          <h5 class="card-title">{{ this.selOrganizationInfo.name }}</h5>
        </div>
      </div>
      <!-- 재단 목록 -->
      <div
        v-for="(organization, index) in this.organizationList"
        :key="`organizationList-${index}`"
        class="organizationList"
      >
        <div class="card" style="width: 18rem">
          <img
            v-bind:src="organization.foundationUrlLogo"
            alt="재단로고"
            class="card-img-top"
          />
          <div class="card-body">
            <h5 class="card-title">{{ organization.foundationName }}</h5>
            <p class="card-text">{{ organization.foundationContent }}</p>
            <button
              @click="
                selOrg(
                  organization.foundationName,
                  organization.foundationLogoUrl,
                  organization.foundationSeq
                )
              "
            >
              재단 선택
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- 엽서 선택 리스트 -->
    <div v-show="this.postcardList && this.stage.two">
      <h1>엽서 선택</h1>
      <!-- 현재 선택된 엽서 -->
      <img v-bind:src="this.donationInfo.donationImgUrl" alt="엽서사진" />
      <!-- 엽서 목록 -->
      <h3>엽서 목록</h3>
      <div
        v-for="(postcard, index) in this.postcardList.postcardList"
        :key="`postcardList-${index}`"
        class="postcardList"
      >
        <img
          v-bind:src="postcard.postcard.postcardImgUrl"
          alt="엽서사진"
          @click="selPostcard(postcard.postcard.postcardImgUrl)"
        />
      </div>
      <h5 v-if="!this.postcardList">
        자신만의 엽서를 생성하거나 다른 사람의 엽서를 좋아요를 누른 후 나만의
        엽서리스트를 생성해 주세요
      </h5>
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
    <div>
      <b>{{ errorMSG }}</b>
      <button @click.prevent="preStage" v-show="!this.stage.one">이전</button>
      <button @click.prevent="nextStage" v-show="!this.stage.four">다음</button>
      <button @click="pay" v-show="this.stage.four">기부</button>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
const donationStore = "donationStore";
const organizationStore = "organizationStore";
const postcardStore = "postcardStore";
const accountStore = "accountStore";

export default {
  name: "OrganizationListView",
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
      // 에러 메시지
      errorMSG: null,
    };
  },

  computed: {
    ...mapGetters(organizationStore, ["organizationList"]),
    ...mapGetters(postcardStore, ["postcardList"]),
    ...mapGetters(accountStore, ["userInfo"]),
  },

  methods: {
    ...mapActions(donationStore, ["doDonate"]),
    // 재단 리스트 용
    ...mapActions(organizationStore, ["getFoundationList"]),
    // 엽서 리스트 용
    ...mapActions(postcardStore, ["userPostcardList"]),
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
        // 선택된 엽서이 없는 경우
        if (!this.donationInfo.donationImgUrl) {
          this.errorMSG = "엽서을 선택해주세요";
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
      // this.userPostcardList(this.userInfo.userSeq)
      // 확인용 더미 나중에 만들어지면 위에 것으로
      this.userPostcardList(this.userInfo.userSeq);
    }
  },

  mounted() {
    this.reset();
  },
};
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
