<template>
  <!-- 전체 폼 -->
  <side-bar></side-bar>
  <div class="donaForm" :class="{ donaModalBack : this.logoLoding}">
    <h1 class="normalText" style="padding-top: 1vw">Donation</h1>
    <!-- 현재 위치 -->
    <div class="donaStage">
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
        3. 메세지 입력
      </h3>
      <h3 v-show="this.donationInfo.donationText" @click="move(3)" class="col nowDoneForm" :class="{ now: this.stage.three }">
        3. 메세지 입력 완료
      </h3>
      <h3 v-show="!(this.donationInfo.donationPay >= 100)" @click.prevent class="col nowForm" :class="{ now: this.stage.four }">
        4. 기부금 선정
      </h3>
      <h3 v-show="this.donationInfo.donationPay >= 100" @click="move(4)" class="col nowDoneForm" :class="{ now: this.stage.four }">
        4. 기부금 선정 완료
      </h3>
    </div>
    <!-- 현황판 -->
    <div class="donaPostcard">
      <!-- 재단 로고 -->
      <img v-show="this.selOrganizationInfo.logoURL" class="organLogo" v-bind:src="this.selOrganizationInfo.logoURL" alt="선택재단">
      <div v-show="!this.selOrganizationInfo.logoURL" class="organLogo"> 
        <img src="../../public/images/logo.png" style="width: 100%; height:100%" alt="엽AI로고">
      </div>
      <img class="selPostImg" v-if="this.donationInfo.donationImgUrl" v-bind:src="this.donationInfo.donationImgUrl">
      <!-- 입력 글 보여주기 -->
      <div class="donaTextBox">
        <div v-for="(line, idx) in this.donationInfo.donationText.split('\n')" :key="`textline-${idx}`">
          <h3 class="donaText">{{line}}</h3>
        </div>
      </div>
    </div>
    <b v-show="this.errorMSG" class="donaErrorMSG">{{ errorMSG }}</b>
    <!-- 재단 선택 리스트 -->
    <div v-show="this.organizationList && this.stage.one">
      <!-- 재단 목록 -->
      <h1 class="normalText">재단 선택</h1>
      <div class="donaCardList">
        <div
          v-for="(organization, index) in this.organizationList"
          :key="`organizationList-${index}`"
        >
          <div :id="organization.foundationName" class="donaCard" @click="selOrg(organization.foundationName,
                    organization.foundationLogoUrl, organization.foundationSeq)">
            <img v-if="organization.foundationLogoUrl" v-bind:src="organization.foundationLogoUrl"
              class="donaImg"
            />
            <h4 class="donaTitle">{{ organization.foundationName }}</h4>
          </div>
        </div>
      </div>
    </div>
    <!-- 엽서 선택 리스트 -->
    <div v-show="this.postcardList && this.stage.two">
      <div class="d-flex title">
        <div class="d-flex">
          <h3 class="titleText" @click="changeList" :class="{donaModalBack: !this.myPostcardList}">내가 그린 엽서 목록</h3>
          <h3 class="titleText" @click="changeList" :class="{donaModalBack: this.myPostcardList}">좋아요한 엽서 목록</h3>
        </div>
        <div v-if="(Math.ceil(this.postcardList.length / 10) > 1) && this.myPostcardList" class="d-flex titleText">
          <i class="bi bi-chevron-left" @click="postcardMove('left')"></i>
          <b>{{this.postcardStage +1}} / {{Math.ceil(this.postcardList.length / 10)}}</b>
          <i class="bi bi-chevron-right" @click="postcardMove('right')"></i>
        </div>
        <div v-if="(Math.ceil(this.likedPostcards.length / 10) > 1 && !this.myPostcardList)" class="d-flex titleText">
          <i class="bi bi-chevron-left" @click="postcardMove('L-left')"></i>
          <b>{{this.likedPostcardStage +1}} / {{Math.ceil(this.likedPostcards.length / 10)}}</b>
          <i class="bi bi-chevron-right" @click="postcardMove('L-right')"></i>
        </div>
      </div>
      <h3 v-if="!this.postcardList.length && this.myPostcardList" class="noListText">현재 작성한 엽서가 없어요.
        <button class="postcardMoveIcon" @click="goLetters">엽서 만들기</button>
      </h3>
      <div v-if="this.myPostcardList">
        <div v-for="(page, index) in Math.ceil(this.postcardList.length / 10)"
          :key="`page-${index}`">
          <div v-show="index === this.postcardStage" class="postcardList">
            <div class="postcardLine">
              <div v-for="(postcard, idx) in this.postcardList.slice(index * 10, index*10 +5)" :key="`postcard-${page}-${idx}`">

                <img class="postcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
              </div>
            </div>
            <div class="postcardLine">
              <div v-for="(postcard, idx) in this.postcardList.slice(index*10 +5, (index + 1) *10)" :key="`postcard-${page}-${idx}`">
                <img class="postcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
              </div>
            </div>
          </div>
        </div>
      </div>
      <h3 v-if="!this.likedPostcards.length && !this.myPostcardList" class="noListText">현재 좋아요를 한 엽서 목록이 없어요.
        <button class="postcardMoveIcon" @click="goSearch" >엽서 구경하기</button>
      </h3>
      <div v-if="!this.myPostcardList">
        <div v-for="(page, idx) in Math.ceil(this.likedPostcards.length / 10)"
          :key="`liked-page-${idx}`">
          <div v-show="idx === this.likedPostcardStage" class="postcardList">
            <div class="postcardLine">
              <div v-for="(postcard, idx) in this.likedPostcards.slice(idx * 10, idx *10 +5)" :key="`likedPostcard-${page}-${idx}`">
                <img class="postcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
              </div>
            </div>
            <div class="postcardLine">
              <div v-for="(postcard, idx) in this.likedPostcards.slice(idx *10 +5, (idx + 1) *10)" :key="`likedPostcard-${page}-${idx}`">
                <img class="postcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 텍스트 입력 -->
    <div v-show="this.stage.three" style="margin-top: 7vh;">
      <h1 class="normalText">당신의 사랑을 전하세요</h1>
      <textarea @input="changInput" maxlength="100" class="inputText" :value="this.donationInfo.donationText" placeholder="간단한 글귀로 마음을 표현하세요(100자 이내, 생략가능)"></textarea>
    </div>
    <!-- 기부금 선택 입력 -->
    <div v-show="this.stage.four" style="margin-top: 7vh;">
      <h1 class="normalText">사랑을 전해주세요</h1>
      <label for="pay" class="normalText">기부 금액 : </label>
      <input v-model="this.donationInfo.donationPay" class="payInput" type="number" id="pay" />
      <p v-show="!(this.donationInfo.donationPay >= 100)" style="color:red;">* 기부를 위해선 100원 이상의 금액이 필요합니다.</p>
    </div>
    <button v-if="(this.donationInfo.donationPay >= 100) && this.stage.four" class="donaButton" @click="pay">
      <i @click="pay" class="fa-solid fa-hand-holding-heart donaIcon" ></i>
      <p style="font-size: 2vw">기부하기</p>
    </button>
    <!-- 좌우이동 아이콘 -->
    <i class="bi bi-chevron-left stageIconLeft" @click.prevent="preStage" v-show="!this.stage.one"></i>
    <i class="bi bi-chevron-right stageIconRight" @click.prevent="nextStage" v-show="!this.stage.four"></i>
  </div>
  <!-- 로고 이동 -->
  <div v-if="this.logoLoding" class="donaCompleteLogo"></div>
  <!-- 기부 성공 후 보여줄 모달 -->
    <div v-if="this.modalShow" class="donaModal">
      <h1 class="modalTitle">기부 내용</h1>
      <ul class="modalList">
        <li class="modalItem">
          <b>재단명:</b>
          <b class="modalContentColor">{{this.receipt.foundation}}</b>
          <hr>
        </li>
        <li class="modalItem">
          <b>기부자:</b>
          <b class="modalContentColor">{{this.receipt.Name}}</b>
          <hr>
        </li>
        <li class="modalItem">
          <b>기부금액:</b>
          <b class="modalContentColor">{{this.receipt.pay}}</b>
          <hr>
        </li>
        <li class="modalItem">
          <b>결제 번호:</b>
          <b class="modalContentColor">{{this.receipt.payNum}}</b>
          <hr>
        </li>
        <li class="modalItem">
          <b class="modalContentColor">당신의 따뜻한 마음을 잘 전달하겠습니다.</b>
        </li>
      </ul>
      <button class="modalButton" @click="goMypage">확인 완료</button>
    </div>
</template>
<script>
import { mapActions, mapGetters } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue";
const donationStore = "donationStore";
const organizationStore = "organizationStore";
const postcardStore = "postcardStore";
const accountStore = "accountStore";
const searchStore = "searchStore";

export default {
  name: "OrganizationListView",
  components: { SideBar},
  data() {
    return {
      // 요청을 보낸 정보들
      donationInfo: {
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
      // 우편 선택 여부
      myPostcardList: true,
      // 우편 페이지내이션
      postcardStage: 0,
      likedPostcardStage: 0,
      // 기부후 로고 보여줄 지 여부
      logoLoding: false,
      // 기부 영수증 변수
      receipt: {
        foundation: null,
        Name: null,
        pay: null,
        payNum: null,
      },
      // 모달 보여줄 변수
      modalShow: false,
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
    // 재단 리스트용
    ...mapActions(organizationStore, ["getFoundationList"]),
    // 엽서 리스트용
    ...mapActions(postcardStore, ["userPostcardList", "userLikedPostcardStore"]),
    // 검색 이동용
    ...mapActions(searchStore, ["getSearchResult"]),
    // 상위 버튼을 통한 이동

    checkTest(event) {
      this.donationInfo.donationText = event.target.innerText
    },

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
      this.errorMSG = null
    },
    // 재단 선택
    selOrg(name, logoURL, Seq) {
      this.selOrganizationInfo.name = name;
      this.selOrganizationInfo.logoURL = logoURL;
      this.donationInfo.foundationSeq = Seq;
      this.errorMSG = null;
      const btn1 = document.getElementById('싸피재단')
      const btn2 = document.getElementById('싸피어린이재단')
      const btn3 = document.getElementById('싸피월드재단')
      btn1.style.filter = 'drop-shadow(0.7vw 0.5vw 0.5vw #c3c3c3)'
      btn2.style.filter = 'drop-shadow(0.7vw 0.5vw 0.5vw #c3c3c3)'
      btn3.style.filter = 'drop-shadow(0.7vw 0.5vw 0.5vw #c3c3c3)'
      btn1.style.border = '0.2vw solid rgb(255, 255, 255)'
      btn2.style.border = '0.2vw solid rgb(255, 255, 255)'
      btn3.style.border = '0.2vw solid rgb(255, 255, 255)'

      const btn = document.getElementById(`${name}`)
      btn.style.filter = 'drop-shadow(0vw 0vw 0vw #c3c3c3)'
      btn.style.border = '0.4vw solid rgb(61, 48, 18)'
      // btn.style.
    },
    // 엽서 선택
    selPostcard(URL) {
      this.donationInfo.donationImgUrl = URL;
      this.errorMSG = null;
    },
    // 엽서 리스트 분류 변경
    changeList() {
      this.myPostcardList = !this.myPostcardList
    },
    // 엽서 목록 변경
    postcardMove(direction) {
      if (direction === 'left' && this.postcardStage > 0) {
        this.postcardStage -= 1
        // 좋아요한 엽서 목록 페이지 변경
      } else if (direction === 'L-left' && this.likedPostcardStage > 0) {
        this.likedPostcardStage -= 1
        // 좋아요한 엽서 목록 페이지 변경
      } else if (direction === 'L-right' && this.likedPostcardStage < Math.ceil(this.likedPostcards.length / 10) - 1) {
        this.likedPostcardStage += 1
      } else if (direction === 'right' && this.postcardStage < Math.ceil(this.postcardList.length / 10) - 1) {
        this.postcardStage += 1
      }
    },
    // 마이페이지로
    goMypage() {
      this.$router.push({path: `/mypage/${this.userInfo.userSeq}`, query: {ownerSeq: this.userInfo.userSeq}})
      this.reset()
    },
    // 좋아요 리스트를 위해 검색 페이지로
    async goSearch(){
      // 없는 값을 보냄
      await this.getSearchResult(" ")
      // 이동
      this.$router.push({ name: "SearchView" })
    },
    // 우편 작성 페이지로
    goLetters() {
      this.$router.push('/makecard')
    },
    // 문구창 입력 변경
    changInput(e) {
      this.donationInfo.donationText = e.target.value;
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
              this.receipt.foundation = rsp.name
              this.receipt.Name = rsp.buyer_name
              this.receipt.pay = rsp.paid_amount
              this.receipt.payNum = rsp.merchant_uid
              //도내이션 요청 보내기
              this.doDonate({
                ...this.donationInfo,
                userSeq: this.userInfo.userSeq,
              });
              // 로고 보여주기
              this.logoLoding = true
              setTimeout(() => {
                this.showLogoLoding = false;
              }, 2000);
              // 모달 띄우기
              setTimeout(()=> {
                this.modalShow = true
              }, 2100)
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
        donationPay: 0,
        donationText: "",
        foundationSeq: null,
      };
      this.selOrganizationInfo = { name: null, logoURL: null };
      this.stage = { one: true, two: false, three: false, four: false };
      this.myPostcardList = true,
      this.postcardStage = 0;
      this.likedPostcardStage = 0;
      this.logoLoding = false
      this.receipt = {
        foundation: null,
        Name: null,
        pay: null,
        payNum: null,
      },
      this.modalShow = false,
      this.errorMSG = null;
    }
  },
  created() {
    if (!this.userInfo) {
      this.$router.push({ name: "beginningView" });
    }
    // 재단 목록이 없다면 재단 목록 가져오기
    if (!this.organizationList.length) {
      this.getFoundationList();
    }
    // if (!this.postcardList.length) {
    // }
    this.userPostcardList(this.userInfo.userSeq);
    // 좋아요한 엽서 받아오기
    // if (!this.likedPostcards.length) {
    // }
    this.userLikedPostcardStore(this.userInfo.userSeq)
  },
  mounted() {
    this.reset();
  },
}
</script>

<style>
/* 전체 폼 */
.donaForm {
  background: url("../../public/images/woodBack.png");
  background-position: center bottom;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  position: relative;
  width: 94vw;
  height: 100vh;
  background-color: antiquewhite;
}
/* 일반 글 색 */
.normalText {
  color: #f7f4ed;
}
/* 현재 단계 창 전체 폼 */
.donaStage {
  display: flex;
  margin-top: 2vh;
  margin-bottom: 2vh;
  margin-left: auto;
  margin-right: auto;
  width: 70vw;
  justify-content: space-around;
}
/* 상단 폼 */
.nowForm {
  margin: auto;
  border-radius: 10px;
  background-color: #f5f5dc;
  pointer-events: none;
  filter: drop-shadow(6px 4px 4px #c3c3c3);
}
/* 작성이 완료된 단계 */
.nowDoneForm {
  margin: auto;
  border-radius: 10px;
  background-color: #f3e9be;
  filter: drop-shadow(6px 4px 4px #c3c3c3);
  cursor: pointer;
}
/* 현재 진행하고 있는 단계 */
.now {
  background-color: #fbceb1;
}

/* 예시 현황판*/
.donaPostcard {
  background: url("../../public/images/beginningPostCard.jpg");
  background-position: center bottom;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  margin: 2vh auto;
  position: relative;
  background-color: white;
  width: 50vw;
  height: 45vh;
  align-self: center;
  /* 입체 그림자효과 */
  filter: drop-shadow(6px 4px 4px #c3c3c3);
  transition: 0.4s;
}

/* 선택 재단의 로고 */
.organLogo {
  background-position: center bottom;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  position: absolute;
  right: 3vw;
  top: 4vh;
  width: 4vw;
  height: 7vh;
}
/* 엽서 프레임 */
.donaFrame {
  position: absolute;
  left: 0.5vw;
  top: 8vh;
  width: 24vw;
  height: 34vh;
}
/* 선택된 엽서 이미지 */
.selPostImg {
  position: absolute;
  left: 0.5vw;
  top: 8vh;
  width: 24vw;
  height: 34vh;
  /* 프레임 */
  border-radius: 5px;
}
/* 입력된 텍스트 모음 */
.donaTextBox {
  position: absolute;
  left: 28vw;
  top: 25vh;
  width: 20vw;
  height: 18vh;
  background-color: #f7f4ed;
  overflow: auto;
}
/* 입력된 텍스트 */
.donaText {
  text-decoration: underline black 1px;
}

/* 글자 입력 */
.inputText{
  display: flex;
  width: 30vw;
  margin: auto
}

/* 재단 리스트 */
.donaCardList {
  position: relative;
  display: flex;
  /* 중앙정렬 */
  width: 40vw;
  margin: auto;
}
/* 재단 리스트 개별 카드 크기 */
.donaCard {
  filter: drop-shadow(0.7vw 0.5vw 0.5vw #c3c3c3);
  width: 12vw;
  height: 22vh;
  margin: 0.5vw;
  border: 0.2vw solid rgb(255, 255, 255);
  border-radius: 1vw;
  background-color: white;
}
.donaCard:hover {
  transform: scale3d(1.1, 1.1, 1.1);
  transition: 0.2s;
}
/* 재단 리스트의 이미지 */
.donaImg {
  width: 100%;
  height: 70%;
}
/* 재단 이름 */
.donaTitle {
  text-align: center;
  width: auto;
  margin: 0.5vw
}

/* 엽서 모음 */
.postcardList {
  position: relative;
  width: 60vw;
  margin: auto;
}
/* 포스트 카드 개별 줄(10개니 5개씩 2줄) */
.postcardLine {
  display: flex;
}
/* 엽서 이미지 */
.postcardImg{
  width: 11vw;
  height: 12vh;
  margin: 0.3vw;
  border: 1px solid #484233;
  border-radius: 5px;
  filter: drop-shadow(6px 4px 4px #c3c3c3);
}
.postcardImg:hover {
  transform: scale3d(1.1, 1.1, 1.1);
}
/* 엽서 구분 좋아요 OR 그린 글 + 페이지내이션  */
.title {
  color: #f7f4ed;
  margin: auto;
  justify-content: space-between;
  width: 60vw;
}
/* 엽서 좋아요 OR 그린 엽서로 적은 글 */
.titleText {
  margin-top: 1vh;
  margin-bottom: 1vh;
  margin-right: 2vw;
  cursor: pointer;
}
/* 엽서가 없는 경우 나올 글 */
.noListText{
  color: #f7f4ed;
}
/* 엽서 없을 경우 이동 버튼 */
.postcardMoveIcon {
  background-color: #fbceb1;
  margin: 0.2vw;
  border: 0px;
  border-radius: 10px;
}
.postcardMoveIcon:hover{
  transform: scale3d(1.1, 1.1, 1.1);
}

/* 기부후 아이콘 */
.donaCompleteLogo {
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
  filter: drop-shadow(13px 10px 10px #c3c3c3);
}

/* 모달 */
.donaModal {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border: 1px black solid;
  background-color: ivory;
}
.modalTitle{
  border-bottom: 1px black solid;
}
.modalList{
  border-bottom: 1px black solid;
}
/* 모달 내 사항들 */
.modalItem{
  border-bottom: 0.5px black solid;
  display: flex;
  justify-content: space-between;
  margin: 1vw;
}
.modalContentColor {
  color: blue
}
/* 모달 닫기 버튼 */
.modalButton{
  margin-bottom: 0.5vw;
  background-color: rgb(36, 36, 116);
  border-radius: 5px;
  color: white;
}
/* 모달 생성시 뒷 배경 투명도 조절 */
.donaModalBack {
  opacity: 30%;
}

/* 에러 메시지 */
.donaErrorMSG {
  color: rgb(202, 81, 1);
  font-size: 1.5vw;
}
/* 좌우 이동 아이콘 */
.stageIconLeft {
  position: absolute;
  top: 30vh;
  left: 0.5vw;
  color: #f7f4ed;
  font-size: 10rem;
}
.stageIconRight {
  position: absolute;
  top: 30vh;
  right: 0.5vw;
  color: #f7f4ed;
  font-size: 10rem;
}

/* 기부금 입력창 */
.payInput{
  vertical-align: middle;
}
/* 기부 버튼 내 아이콘 */
.donaIcon {
  font-size: 2vw;
}
/* 기부버튼 전체 */
.donaButton {
  color: red;
  background-color: ivory;
  width: 8vw;
  height: 12vh;
  border: 1px solid black;
  border-radius: 5px;
  margin-left: auto;
  margin-right: auto;
  margin-top: 2vh;
  padding-top: 1vh;
  
}
</style>
