<template>


  <side-bar></side-bar>

  
  
  
  <div v-if="test" class="Mypage">
    <div class="mypageNav">
      <div class="mypageBtn" @click="goProfile" @mouseover="change1">profile</div>
      <div class="mypageBtn" @click="goDonations" @mouseover="change3">donations</div>
      <div class="mypageBtn" @click="goMade" @mouseover="change5">made by {{ownerInfo.userName}}</div>
      <div class="mypageBtn" @click="goLikedPostcards" @mouseover="change2">liked postcards</div>
      <div class="mypageBtn" @click="goFollowing" @mouseover="change4">following</div>
    </div>
    <div class="updown"></div>


    <p id="goProfile" class="profileTitle">{{this.ownerInfo.userName}}'s profile page</p>
    <div style="margin-left: 10vw">
    <br>
    
    <!-- 내 정보 부분 -->
    <div class="myInfo row">
      <div class="myProfileBox row justify-content-around">


          <div class="myProfileImageBox ">
            <img class="myProfileImage" id="profileImg" :src="profileImg" alt="">
            <label for="changeImg" style="font-size: 2vw; cursor: pointer; max-width: 10vw; margin: 0 auto;">프로필 변경</label>
            <input @change="tempImg" style="display: none;" type="file" accept="image/*" id="changeImg">
          </div>


        <div class="myProfileInfo align-self-center row justify-content-center">
          <h1 style="border-width: 1vw; border: black; cursor: pointer;" @click="showCollection">컬렉션 보기</h1>
          <h1>기부 횟수: {{this.mypageUserInfo.donationCnt}}</h1>
          <h1>기부 금액: {{this.mypageUserInfo.donationMoney}}</h1>
        </div>
      </div>
    </div>
    <div class="leftRight"></div>


    <!-- 유저의 기부목록 보여주기 -->
    <p id="goDonations" class="profileText">{{this.ownerInfo.userName}}'s donations</p>
    <div id="donationList" class="mypageCarousel">
      <div class="wrap">
        <ul class="">
          <li v-for="(donation, index) in this.donationList" :key="index">
            <img class="cardItem" :src="donation.donationImgUrl" alt="">
          </li>
        </ul>
      </div>
    </div>
    
    <!-- 유저가 기부한 엽서들 페이지네이션해서 보여주는 부분 -->
    <div class="paginationPage">
      <div class="d-flex mypaginationTitle">
        <h3 class="mypaginationText">{{ownerInfo.userName}}의 기부목록</h3>
        <div class="d-flex mypaginationText">
          <i class="bi bi-chevron-left" @click="postcardMove('D-left')"></i>
          <b>{{this.donationStage +1}} / {{Math.ceil(this.donationList.length / 12)}}</b>
          <i class="bi bi-chevron-right" @click="postcardMove('D-right')"></i>
        </div>
      </div>
      <div v-for="(page, index) in Math.ceil(this.donationList.length / 12)"
        :key="`page-${index}`" >

        <div v-if="index === this.donationStage" data-aos="flip-left" data-aos-duration="200">
          
          <!-- 앞면 -->
          <div class="mypaginationPostcardList">
            <div v-for="(donation, idx) in this.donationList.slice(index * 12, index * 12 + 4)" :key="`postcard-${page}-${idx}`" class="spin">
              <div class="spinItem front">
                <div class="mypaginationImgSize">
                  <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
                  <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
                </div>
              </div>
              <div class="spinItem back">
                <div class="mypaginationImgSize">
                  <p class="mypaginationPostcardName">{{donation.donationText}}</p>
                </div>
              </div>
            </div>
          </div>
            
          <div class="mypaginationPostcardList">
            <div v-for="(donation, idx) in this.donationList.slice(index * 12 + 4, index * 12 + 8)" :key="`postcard-${page}-${idx}`" class="spin">
              <div class="spinItem front">
                <div class="mypaginationImgSize">
                  <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
                  <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
                </div>
              </div>
              <div class="spinItem back">
                <div class="mypaginationImgSize">
                  <p class="mypaginationPostcardName">{{donation.donationText}}</p>
                </div>
              </div>
            </div>
          </div>

          <div class="mypaginationPostcardList">
            <div v-for="(donation, idx) in this.donationList.slice(index * 12 + 8, index * 12 + 12)" :key="`postcard-${page}-${idx}`" class="spin">
              <div class="spinItem front">
                <div class="mypaginationImgSize">
                  <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
                  <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
                </div>
              </div>
              <div class="spinItem back">
                <div class="mypaginationImgSize">
                  <p class="mypaginationPostcardName">{{donation.donationText}}</p>
                </div>
              </div>
            </div>
          </div>

        </div>
        </div>
      </div>
    <div class="leftRight"></div>


    <!-- 유저가 만든 모든 엽서 보여주기 -->
    <p id="goMade" class="profileText">Made by {{this.ownerInfo.userName}}</p>
    <div id="madeList" class="mypageCarousel">
      <div class="wrap">
        <ul class="">
          <li v-for="(postcard, index) in this.postcardList " :key="index">
            <img class="cardItem" :src="postcard.postcard.postcardImgUrl" alt="">
          </li>
        </ul>
      </div>
    </div>

    <!-- 유저가 만든 엽서들 페이지네이션해서 보여주는 부분 -->
    <div class="paginationPage">
      <div class="d-flex mypaginationTitle">
        <h3 class="mypaginationText">내가 그린 엽서 목록</h3>
        <div class="d-flex mypaginationText">
          <i class="bi bi-chevron-left" @click="postcardMove('left')"></i>
          <b>{{this.postcardStage + 1}} / {{Math.ceil(this.postcardList.length / 12)}}</b>
          <i class="bi bi-chevron-right" @click="postcardMove('right')"></i>
        </div>
      </div>
      <div v-for="(page, index) in Math.ceil(this.postcardList.length / 12)"
        :key="`page-${index}`">

        <div v-if="index === this.postcardStage" data-aos="flip-left" data-aos-duration="200">




          
          <div class="mypaginationPostcardList" style="margin-left: 0vw;">
            <div v-for="(postcard, idx) in this.postcardList.slice(index * 12, index * 12 + 4)" :key="`postcard-${page}-${idx}`" class="mypaginationImgSize">
              <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
              <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
            </div>
          </div>

          <div class="mypaginationPostcardList" style="margin-left: 0vw;">
            <div v-for="(postcard, idx) in this.postcardList.slice(index * 12 + 4, index * 12 + 8)" :key="`postcard-${page}-${idx}`" class="mypaginationImgSize">
              <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
              <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
            </div>
          </div>

          <div class="mypaginationPostcardList" style="margin-left: 0vw;">
            <div v-for="(postcard, idx) in this.postcardList.slice(index * 12 + 8, index * 12 + 12)" :key="`postcard-${page}-${idx}`" class="mypaginationImgSize">
              <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
              <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
            </div>
          </div>

        </div>
      </div>
    </div>
    <div class="leftRight"></div>






    <!-- 팔로워 부분 -->
     
    

    <!-- 유저가 좋아요한 포스트카드 -->
    <div class="followUsers">
      <p id="goLikedPostcards" class="profileText">{{this.ownerInfo.userName}}'s pick</p>
      <div id="likedList" class="mypageCarousel">
      <div class="wrap">
        <ul id="ul" class="">
          <li v-for="(card, index) in this.userLikedPostcard.postcardList " :key="index">
            <img class="cardItem " :src="card.postcard.postcardImgUrl" alt="">
          </li>
        </ul>
      </div>
    </div>
    </div> 

    <!-- 유저가 좋아요한 엽서들 페이지네이션해서 보여주는 부분 -->
    <div class="paginationPage">

      <div class="d-flex mypaginationTitle">
        <h3 class="mypaginationText">좋아요한 엽서 목록</h3>
        <div class="d-flex mypaginationText">
          <i class="bi bi-chevron-left" @click="postcardMove('L-left')"></i>
          <b>{{this.likedPostcardStage +1}} / {{Math.ceil(this.userLikedPostcard.postcardList.length / 12)}}</b>
          <i class="bi bi-chevron-right" @click="postcardMove('L-right')"></i>
        </div>
      </div>
      <div v-for="(page, index) in Math.ceil(this.userLikedPostcard.postcardList.length / 12)"
        :key="`liked-page-${index}`" >

        <div v-if="index === this.likedPostcardStage" data-aos="flip-left" data-aos-duration="200">

        <div class="mypaginationPostcardList" style="margin-left: 0vw;">
          <div v-for="(postcard, idx) in this.userLikedPostcard.postcardList.slice(index * 12 + 0, index * 12 + 4)" :key="`likedPostcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
            <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
          </div>
        </div>

        <div class="mypaginationPostcardList" style="margin-left: 0vw;">
          <div v-for="(postcard, idx) in this.userLikedPostcard.postcardList.slice(index * 12 + 4, index * 12 + 8)" :key="`likedPostcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
            <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
          </div>
        </div>

        <div class="mypaginationPostcardList" style="margin-left: 0vw;">
          <div v-for="(postcard, idx) in this.userLikedPostcard.postcardList.slice(index * 12 + 8, index * 12 + 12)" :key="`likedPostcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
            <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
          </div>
        </div>
      </div>
      
      </div>
    </div>
    <div class="leftRight"></div>


    <div class="followUsers">
      <p id="goFollowing" class="profileText">Following</p>
      <div id="followingList" class="mypageCarousel">
      <div class="wrap">
        <ul id="ul" class="">
          <li v-for="(card, index) in this.followList" :key="index">
            <img class="cardItem " :src="card" alt="">
          </li>
        </ul>
      </div>
    </div>
    </div> 
    <!-- 유저가 기부한 엽서들 페이지네이션해서 보여주는 부분 -->
    <div class="paginationPage">
    </div>

    
    <!-- 컬렉션 모달 -->

    <div v-if="showRemind" style="z-index: 9999; position: relative;">

    <!-- 좋아하는 엽서 목록 1 -->
    <div v-if="ownerInfo.userTemplate === 1" style="position: fixed; z-index: 9999;" class="d-flex justify-content-center">
      <favorite-postcards-a></favorite-postcards-a>
    </div>

    <!-- 좋아하는 엽서 목록 2 -->
    <div v-if="ownerInfo.userTemplate === 2" style="position: fixed; z-index: 9999;" class="d-flex justify-content-center">
      <favorite-postcards-b></favorite-postcards-b>
    </div>

    <!-- 좋아하는 엽서 목록 3 -->
    <div v-if="ownerInfo.userTemplate === 3" style="position: fixed; z-index: 9999;" class="d-flex justify-content-center">
      <favorite-postcards-c></favorite-postcards-c>
    </div>

    </div>



  </div>


    <br>
    <br>
    <br>
    <br>
  </div>


</template>

<script>
import AOS from 'aos';
import "aos/dist/aos.css";
import SideBar from "@/components/Nav/SideBar.vue";
import FavoritePostcardsA from "@/components/Collection/favoritePostcardsA.vue";
import FavoritePostcardsB from "@/components/Collection/favoritePostcardsB.vue";
import FavoritePostcardsC from "@/components/Collection/favoritePostcardsC.vue";
import { mapActions, mapGetters } from "vuex";
const mypageStore = "mypageStore";
const accountStore = "accountStore";
const postcardStore = "postcardStore";


export default {
  name: "MypageView",

  components: {
    SideBar,
    FavoritePostcardsA,
    FavoritePostcardsB,
    FavoritePostcardsC,
  },

  data() {
    return {
      ownerSeq: 0,
      isOwner: 0,
      test: true,
      showRemind: false,
      profileImg: '',

      
      // 페이지네이션
      donationStage: 0,
      postcardStage: 0,
      followingStage: 0,
      likedPostcardStage: 0,
    };
  },


  computed: {
    ...mapGetters(mypageStore, [
      "donationList",
      "followList",
      "profileImage",
      "mypageUserInfo",
      "ownerInfo",
    ]),
    ...mapGetters(accountStore, [
      "userInfo",
      "token",
    ]),
    ...mapGetters(postcardStore, [
      "postcardList",
      "userLikedPostcard",
      "likedPostcards",
    ]),
  },


  methods: {
    ...mapActions(mypageStore, [
      "userSecession",
      "updateUserInfo",
      "changeUserProfile",
      "getDonationList",
      "getFollowerList",
      "setMypageUserInfo",
      "setOwnerInfo",
    ]),
    ...mapActions(postcardStore, [
      "userPostcardList",
      "getUserLikedPostcard",
    ]),

    // 컬랙션 보기
    showCollection() {
      this.showRemind = !this.showRemind
      console.log(this.showRemind)
    },

    // 엽서 목록 변경
    postcardMove(direction) {
      // 만든 엽서 목록 페이지 변경
      if (direction === 'left' && this.postcardStage > 0) {
        this.postcardStage -= 1
      } else if (direction === 'right' && this.postcardStage < Math.ceil(this.postcardList.length / 12) - 1) {
        this.postcardStage += 1
      // 좋아요한 엽서 목록 페이지 변경
      } else if (direction === 'L-left' && this.likedPostcardStage > 0) {
        this.likedPostcardStage -= 1
      } else if (direction === 'L-right' && this.likedPostcardStage < Math.ceil(this.userLikedPostcard.postcardList.length / 12) - 1) {
        console.log(this.likedPostcardStage)
        this.likedPostcardStage += 1
      //  
      } else if (direction === 'D-left' && this.donationStage > 0) {
        this.donationStage -= 1
      } else if (direction === 'D-right' && this.donationStage < Math.ceil(this.donationList.length / 12) - 1) {
        this.donationStage += 1
      }
    },
    
    goProfile() {
      // document 와 element 사이의 거리를 구한다
      const getElementY = (element) => {
        return window.pageYOffset + element.getBoundingClientRect().top
      }
      // 해당 element 로 스크롤!
      window.scrollTo(0, getElementY(document.getElementById('goProfile')))
    },
    goDonations() {
      // document 와 element 사이의 거리를 구한다
      const getElementY = (element) => {
        return window.pageYOffset + element.getBoundingClientRect().top
      }
      // 해당 element 로 스크롤!
      window.scrollTo(0, getElementY(document.getElementById('goDonations')))      

    },
    goLikedPostcards() {
      // document 와 element 사이의 거리를 구한다
      const getElementY = (element) => {
        return window.pageYOffset + element.getBoundingClientRect().top
      }
      // 해당 element 로 스크롤!
      window.scrollTo(0, getElementY(document.getElementById('goLikedPostcards')))
    },
    goMade() {
      // document 와 element 사이의 거리를 구한다
      const getElementY = (element) => {
        return window.pageYOffset + element.getBoundingClientRect().top
      }
      // 해당 element 로 스크롤!
      window.scrollTo(0, getElementY(document.getElementById('goMade')))
    },
    goFollowing() {
      // document 와 element 사이의 거리를 구한다
      const getElementY = (element) => {
        return window.pageYOffset + element.getBoundingClientRect().top
      }
      // 해당 element 로 스크롤!
      window.scrollTo(0, getElementY(document.getElementById('goFollowing')))
    },


    // 회원탈퇴
    secession() {
      // 스토어에서 user_seq 들고와서 넣어줘야됨
      this.userSecession()
    },

    // 유저정보 업데이트
    updateInfo() {
      // updateInfo = { user_seq: , info: { userPassword: , userPhone: , userEmail: } }
      this.updateUserInfo(this.updateInfo)
    },

    tempImg(image) {
      this.profileImg = URL.createObjectURL(image.target.files[0])
      this.changeProfile()
    },

    // async changeProfile() {
    //   // 지금은 이미지 변환 클릭하면 엽서 등록 + 태그 등록됨
    //   // 로직 확인용이고, 잘 들어가는거 체크함
    //   const img = document.getElementById("profileImg");
    //   const canvas = await html2canvas(img);
    //   const dataUrl = canvas.toDataURL("image/png");
    //   const blobData = this.dataURItoBlob(dataUrl);
    //   const now = new Date();
    //   // 파일 이름
    //   const filename = `yeupseo-${this.userInfo.userSeq}${now.getHours()}${now.getMinutes()}${now.getSeconds()}.png`
    //   // 파일 만들기
    //   const tempFile = new File([blobData], filename, { type: 'image/png' });
    //   // 폼데이터
    //   let canvasData = new FormData;
    //   canvasData.append('postcard', tempFile); // 생성된 canvasData 정해진 uri로 axios 요청 보내면 될 듯
    //   this.changeUserProfile({ user_seq: this.ownerInfo.userSeq, profile: canvasData })
    // },

    dataURItoBlob(dataURI) {
      var binary = atob(dataURI.split(',')[1]);
      var array = [];
      for (var i = 0; i < binary.length; i++) {
        array.push(binary.charCodeAt(i));
      }
      return new Blob([new Uint8Array(array)], { type: 'image/png' });
    },

    showPostcards() {
        this.showRemind = !this.showRemind
    },

    choseImage() {
        this.showImages[0].imageUrl = require("../../public/images/test1.jpg")
    }
  },


  async created() {
    this.ownerSeq = Number(this.$route.query.ownerSeq)
    // console.log('유저시퀀스, 마이페이지 주인 시퀀스')
    // console.log(this.userInfo.userSeq, this.ownerSeq)
    if (this.userInfo.userSeq === this.ownerSeq) {
      this.isOwner = 1
    }
    
    // 스토어에서 user_seq 들고와서 넣어줘야됨
    await this.setOwnerInfo(this.ownerSeq)
    this.getDonationList(this.ownerSeq)
    this.getFollowerList(this.ownerSeq)
    this.userPostcardList(this.ownerSeq)
    this.getUserLikedPostcard(this.ownerSeq)
    // 기부총액, 기부횟수 계산
    let donationCnt = this.donationList.length
    let donationMoney = 0
    this.donationList.forEach(dontaion => {
      donationMoney += dontaion.donationPay
    });
    this.setMypageUserInfo({donationCnt: donationCnt, donationMoney: donationMoney })
    this.profileImg = this.ownerInfo.userProfileUrl
    AOS.init()    
  },


  mounted() {
    console.log(screen.width)
    console.log(screen.height)
    console.log('마운티드')
    console.log(this.ownerInfo)
    

    // 캐러셀

    // Hover-Carousel component
    // By Yair Even-Or
    // written in jQuery 2013 -> refactored to vanilla 2020
    // https://github.com/yairEO/hover-mypageCarousel

    function HoverCarousel( elm ){
      this.DOM = {
        scope: elm,
        wrap: elm.querySelector('ul').parentNode,
      }
      
      this.containerWidth = 0;
      this.scrollWidth = 0;
      this.posFromLeft = 0;    // Stripe position from the left of the screen
      this.stripePos = 0;    // When relative mouse position inside the thumbs stripe
      this.animated = null;
      this.callbacks = {}
      
      this.init()
    }

    HoverCarousel.prototype = {
      init(){
        this.bind()
      },
      
      destroy(){
        this.DOM.scope.removeEventListener('mouseenter', this.callbacks.onMouseEnter)
        this.DOM.scope.removeEventListener('mousemove', this.callbacks.onMouseMove)
      },

      bind(){
        this.callbacks.onMouseEnter = this.onMouseEnter.bind(this)
        this.callbacks.onMouseMove = e => {
          if( this.mouseMoveRAF ) 
            cancelAnimationFrame(this.mouseMoveRAF)

          this.mouseMoveRAF = requestAnimationFrame(this.onMouseMove.bind(this, e))
        }
        
        this.DOM.scope.addEventListener('mouseenter', this.callbacks.onMouseEnter)
        this.DOM.scope.addEventListener('mousemove', this.callbacks.onMouseMove)
      },
      
      // calculate the thumbs container width
      onMouseEnter(e){
        this.nextMore = this.prevMore = false // reset

        this.containerWidth       = this.DOM.wrap.clientWidth;
        this.scrollWidth          = this.DOM.wrap.scrollWidth; 
        // padding in percentage of the area which the mouse movement affects
        this.padding              = 0.2 * this.containerWidth; 
        this.posFromLeft          = this.DOM.wrap.getBoundingClientRect().left;
        var stripePos             = e.pageX - this.padding - this.posFromLeft;
        this.pos                  = stripePos / (this.containerWidth - this.padding*2);
        this.scrollPos            = (this.scrollWidth - this.containerWidth ) * this.pos;

        // temporary add smoothness to the scroll 
        this.DOM.wrap.style.scrollBehavior = 'smooth';
        
        if( this.scrollPos < 0 )
          this.scrollPos = 0;
        
        if( this.scrollPos > (this.scrollWidth - this.containerWidth) )
          this.scrollPos = this.scrollWidth - this.containerWidth

        this.DOM.wrap.scrollLeft = this.scrollPos
        this.DOM.scope.style.setProperty('--scrollWidth',  (this.containerWidth / this.scrollWidth) * 100 + '%');
        this.DOM.scope.style.setProperty('--scrollLleft',  (this.scrollPos / this.scrollWidth ) * 100 + '%');

        // lock UI until mouse-enter scroll is finihsed, after aprox 200ms
        clearTimeout(this.animated)
        this.animated = setTimeout(() => {
          this.animated = null
          this.DOM.wrap.style.scrollBehavior = 'auto';
        }, 200)

        return this
      },

      // move the stripe left or right according to mouse position
      onMouseMove(e){
        // don't move anything until inital movement on 'mouseenter' has finished
        if( this.animated ) return

        this.ratio = this.scrollWidth / this.containerWidth
        
        // the mouse X position, "normalized" to the mypageCarousel position
        var stripePos = e.pageX - this.padding - this.posFromLeft 
        
        if( stripePos < 0 )
            stripePos = 0

        // calculated position between 0 to 1
        this.pos = stripePos / (this.containerWidth - this.padding*2) 
        
        // calculate the percentage of the mouse position within the mypageCarousel
        this.scrollPos = (this.scrollWidth - this.containerWidth ) * this.pos 

        this.DOM.wrap.scrollLeft = this.scrollPos
        
        // update scrollbar
        if( this.scrollPos < (this.scrollWidth - this.containerWidth) )
          this.DOM.scope.style.setProperty('--scrollLleft',  (this.scrollPos / this.scrollWidth ) * 100 + '%');

        // check if element has reached an edge
        this.prevMore = this.DOM.wrap.scrollLeft > 0
        this.nextMore = this.scrollWidth - this.containerWidth - this.DOM.wrap.scrollLeft > 5
        
        this.DOM.scope.setAttribute('data-at',
          (this.prevMore  ? 'left ' : ' ')
          + (this.nextMore ? 'right' : '')
        )
      }
    }
              
    var madeList = document.querySelector('#madeList')
    var followElm = document.querySelector('#followingList')
    var likedList = document.querySelector('#likedList')
    var donationList = document.querySelector('#donationList')
    new HoverCarousel(madeList)
    new HoverCarousel(followElm)
    new HoverCarousel(likedList)
    new HoverCarousel(donationList)
      },
    }
</script>

<style>
/* 페이지네이션 */
.mypaginationTitle {
  /* margin: auto; */
  justify-content: space-between;
  width: 100%;
  font-size: 3vw;
}
.mypaginationText {
  margin-top: 1vh;
  margin-bottom: 1vh;
  font-size: 3vw;
}
.mypaginationPostcardList {
  position: relative;
  display: flex;
  width: 100%;
  margin: 0 auto;
  margin-left: -3vw;
}
/* .mypaginationPostcardSmallList {
  display: flex;
} */
.mypaginationPostcardImg{
  width: 11vw;
  height: 11vw;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}
.mypaginationImgSize {
  width: 12vw;
  margin-left: 2.5vw;
  height: 17vw;
  padding-top: 1vw;
  margin-top: 3vw;
  background-color: #faf8f5;
  /* background-color: #fff; */
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}

.spin {
  /* 부모의 자식 요소가 3차원의 애니메이션 효과를 가질때, 300px의 거리에서 보는 원근감을 줌 */
  margin-left: 2.5vw;
  width: 12vw;
  perspective: 500px;
}

.spin .spinItem {
  /*카드의 뒷면을 안보이게 처리-카드가 뒤집히면 뒷면이 안보임*/
  backface-visibility: hidden;
  transition: 0.7s;
}

.spin .spinItem.front {
  /* 앞면 카드가 부유하게 되어, 뒷면 카드가 아래에서 위로 올라감 -> 요소 두개가 겹치게 됨*/
  position: absolute;
  /* 명시적으로 기본값 설정, 없어도 됨*/
  transform: rotateY(0deg);
}

.spin:hover .spinItem.front {
  transform: rotateY(180deg);
}
.spin .spinItem.back {
  transform: rotateY(-180deg);
}
.spin:hover .spinItem.back {
  transform: rotateY(0deg);
}

.mypaginationPostcardName {
  display: inline-block;
  margin-top: 1vw;
  margin-left: 1vw;
  margin-right: 1vw;
  font-size: 2vw;
  /* text-align: center */
}
.tagForm {
  display: inline-block;
  margin-top: 1.5vw;
  font-size: 1.5vw;
  /* text-align: center */
}


.leftRight {
  /* position: fixed; */
  border-top : solid black;
  width: 0.01px;
  /* top: 15vh;
  left: 15vw; */
  /* height: 70vh; */
  width: 65vw;
  margin-left: 11.5vw;
  margin-top: 7vh;
  margin-bottom: 10vh;
  opacity: 0.1;
  z-index: 10000;
}
.mypageNav {
  position: fixed;
  top: 30vh;
  left: 3.5vw;
}
.updown {
  position: fixed;
  border-left : solid black;
  width: 0.01px;
  top: 15vh;
  left: 15vw;
  height: 70vh;
  opacity: 0.3;
}
.mypageBtn {
  cursor: pointer;
  width: 10vw;
  height: 7vh;
  font-size: 1.7vw;
  text-align: left;
  transition: 0.4s;
}
.mypageBtn:hover {
  cursor: pointer;
  width: 10vw;
  height: 7vh;
  font-size: 1.7vw;
  color: #bcbcbc;
  text-align: left;
  transition: 0.4s;
}

.Mypage {
  position: relative;
  height: 100%;
  width: 94vw;
  /* background-image: url(../../public/images/mypageBackground.jpg);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  background-attachment: fixed; */
  /* background-color: #faf8f5; */
  /* background-color: whitesmoke; */
}

.paginationPage {
  height: 70vw;
  width: 60vw;
  margin: 0 auto;
  /* border:#555; */
}
.profileTitle {
  position: sticky;
  width: 98vw;
  background-color: #faf8f5;
  margin: 0 auto;
  /* margin-top: 5vh; */
  font-size: 8vh;
  font-family: 'Nanum Pen Script', cursive;;
}
.profileText {
  margin: 0 auto;
  margin-top: 5vh;
  font-size: 8vh;
  font-family: 'Nanum Pen Script', cursive;;
}
.myInfo {
  /* position: absolute; */
  /* margin-bottom: 0vh; */
  /* padding: 0 5vw; */
  /* width: 100vw; */
}
.myProfileBox {
  /* background-color: #faf8f5; */
  margin: 0 auto;
  margin-top: 5vh;
  /* border-radius: 30px; */
  padding: 3vh;
  width: 60vw;
  height: 50vh;
  box-sizing: border-box;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}
.myProfileImage {
  margin: 0 auto;
  padding-top: 0vw; 
  /* padding-bottom: 4vw;  */
  width: 15vw;
  height: 15vw;
}
.myProfileImageBox {
  margin: 0 auto;
  padding-top: 2vw; 
  margin-left: 7vw;
  border-radius: 25%;
  width: 15vw;
  height: 15vw;
  box-sizing: border-box;
}
.myProfileInfo {
  margin: 0 auto;
  padding: 3vh;
  width: 30vw;
  height: 40vh;
}

/* 모든 카드 보여주는 부분 */
.allCardsTitle {
  font-size: 3vw;
  font-family: 'Nanum Pen Script', cursive;;
  cursor : pointer;
  z-index: 3000;
}
.allCards {
  margin: 0 auto;
  padding: 0 5vw;
  max-width: 80vw;
}


/* 캐러셀 */
.mypageCarousel {
  display: block;
  font-size: 0;
  border-radius: 8px;
  padding: 3.5vh;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
  /* background: white; */
  background-color: #faf8f5;
  transform: translateZ(0);
  height: 30vh;
  -webkit-overflow-scrolling: touch;
  /* for tablets */
}
.touch .mypageCarousel {
  overflow: auto;
}
.mypageCarousel[data-at*=left] > .wrap::before {
  opacity: 1;
  text-indent: -50px;
}
.mypageCarousel[data-at*=right] > .wrap::after {
  opacity: 1;
  text-indent: -50px;
}
.mypageCarousel::after {
  content: "";
  pointer-events: none;
  position: absolute;
  z-index: 4;
  bottom: -4px;
  left: 0;
  background: #d8872b;
  height: 4px;
  border-radius: 4px;
  opacity: 0;
  width: var(--scrollWidth, 0);
  left: var(--scrollLleft, 0);
  transition: opacity 0.2s, bottom 0.2s;
}
.mypageCarousel:hover::after {
  opacity: 1;
  bottom: -10px;
}
.mypageCarousel > .wrap {
  overflow: hidden;
  border-radius: 4px;
}
.mypageCarousel > .wrap::before, .mypageCarousel > .wrap::after {
  content: "‹";
  opacity: 0;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  z-index: 2;
  width: 5vw;
  font-size: 10vw;
  font-family: monospace;
  color: #555;
  font-weight: bold;
  border-radius: 2vw;
  pointer-events: none;
  transition: 0.2s ease-out;
  background: linear-gradient(to right, white 20%, transparent);
}
.mypageCarousel > .wrap::after {
  transform: rotate(180deg);
  left: auto;
  right: 0;
}
.mypageCarousel > .wrap > ul {
  list-style: none;
  white-space: nowrap;
  height: 18vh;
}
.mypageCarousel > .wrap > ul > li {
  display: inline-block;
  vertical-align: middle;
  height: 18vh;
  margin: 0 0 0 1vw;
  position: relative;
  /* overflow: hidden; */
  transition: 0.25s ease-out;
}
.mypageCarousel > .wrap > ul > li:first-child {
  margin: 0;
}
.cardItem {
  height: 12vh;
  border-radius: 10px;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}
.mypageCarousel {
  width: 60vw;
  height: 18vh;
  margin: auto;
  margin-bottom: 7vh;
}


/* 팔로잉한 유저 보여주는 부분 */
.followUsers {
  margin: 0 auto;
  padding: 0 5vh;
  max-width: 200vh;
  transition:all 5s ease;

}
.followUserList {
  display: flex;
  justify-content: space-between;
  justify-content: space-between;
  max-width: 150vh;
  margin: 40px auto 0;
}
.followUserItem {
  background: #fff;
  border-radius: 30px;
  padding: 40px 40px 35px;
  width: 47.2%;
  box-sizing: border-box;
}




/* 리마인드 파트 */

</style>