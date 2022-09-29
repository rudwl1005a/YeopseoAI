<template>


  <side-bar></side-bar>

  
  
  
  <div v-if="test" class="Mypage">
    <div class="mypageNav">
      <div class="mypageBtn" @click="goProfile" @mouseover="change1">profile</div>
      <div class="mypageBtn" @click="goDonations" @mouseover="change3">donations</div>
      <div class="mypageBtn" @click="goMade" @mouseover="change5">made by {{userInfo.userName}}</div>
      <div class="mypageBtn" @click="goLikedPostcards" @mouseover="change2">liked postcards</div>
      <div class="mypageBtn" @click="goFollowing" @mouseover="change4">following</div>
    </div>
    <div class="updown"></div>


    <div style="margin-left: 10vw">
    <br>
    
    <!-- 내 정보 부분 -->
    <p id="goProfile" class="profileText">{{this.userInfo.userName}}'s Profile</p>
    <div class="myInfo row">
      <div class="myProfileBox row justify-content-around">

        <div class="myProfileImage align-self-center">
        </div>

        <div class="myProfileInfo align-self-center row justify-content-center">
          <h1>안녕 난 박정현!</h1>
          <h1>{{this.mypageUserInfo.donationCnt}}회 기부</h1>
          <h1>총 기부 금액:{{this.mypageUserInfo.donationMoney}}</h1>
        </div>
      </div>
    </div>
    <div class="leftRight"></div>


    <!-- 유저의 기부목록 보여주기 -->
    <p id="goDonations" class="profileText">{{this.userInfo.userName}}'s donations</p>
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
        <h3 class="mypaginationText">{{userInfo.userName}}의 기부목록</h3>
        <div class="d-flex mypaginationText">
          <i class="bi bi-chevron-left" @click="postcardMove('D-left')"></i>
          <b>{{this.donationStage +1}} / {{Math.ceil(this.donationList.length / 12)}}</b>
          <i class="bi bi-chevron-right" @click="postcardMove('D-right')"></i>
        </div>
      </div>
      <div v-for="(page, index) in Math.ceil(this.donationList.length / 12)"
        :key="`page-${index}`" >

        <div v-show="index === this.donationStage" class="mypaginationPostcardList">
          <div v-for="(donation, idx) in this.donationList.slice(index * 12, index * 12 + 4)" :key="`postcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
            <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
          </div>
        </div>
          
        <div v-show="index === this.donationStage" class="mypaginationPostcardList">
          <div v-for="(donation, idx) in this.donationList.slice(index * 12 + 4, index * 12 + 8)" :key="`postcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
            <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
          </div>
        </div> 

        <div v-show="index === this.donationStage" class="mypaginationPostcardList">
          <div v-for="(donation, idx) in this.donationList.slice(index * 12 + 8, index * 12 + 12)" :key="`postcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
            <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
          </div>
        </div>

        </div>
      </div>
    <div class="leftRight"></div>


    <!-- 유저가 만든 모든 엽서 보여주기 -->
    <p id="goMade" class="profileText">Made by {{this.userInfo.userName}}</p>
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
        <div v-show="index === this.postcardStage" class="mypaginationPostcardList">
          <div v-for="(postcard, idx) in this.postcardList.slice(index * 12, index * 12 + 4)" :key="`postcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
            <p v-for="(tag, idx) in postcard.tag" :key="idx" class="mypaginationPostcardName">#{{tag}} &nbsp;</p>
          </div>
        </div>

        <div v-show="index === this.postcardStage" class="mypaginationPostcardList">
          <div v-for="(postcard, idx) in this.postcardList.slice(index * 12 + 4, index * 12 + 8)" :key="`postcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
            <p v-for="(tag, idx) in postcard.tag" :key="idx" class="mypaginationPostcardName">#{{tag}} &nbsp;</p>
          </div>
        </div>

        <div v-show="index === this.postcardStage" class="mypaginationPostcardList">
          <div v-for="(postcard, idx) in this.postcardList.slice(index * 12 + 8, index * 12 + 12)" :key="`postcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
            <p v-for="(tag, idx) in postcard.tag" :key="idx" class="mypaginationPostcardName">#{{tag}} &nbsp;</p>
          </div>
        </div>

      </div>
    </div>
    <div class="leftRight"></div>






    <!-- 팔로워 부분 -->
     
    

    <!-- 유저가 좋아요한 포스트카드 -->
    <div class="followUsers">
      <p id="goLikedPostcards" class="profileText">Liked</p>
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
        <div v-show="index === this.likedPostcardStage" class="mypaginationPostcardList">
          <div v-for="(postcard, idx) in this.userLikedPostcard.postcardList.slice(index * 12 + 0, index * 12 + 4)" :key="`likedPostcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
            <p v-for="(tag, idx) in postcard.tag" :key="idx" class="mypaginationPostcardName">#{{tag}} &nbsp;</p>
          </div>
        </div>

        <div v-show="index === this.likedPostcardStage" class="mypaginationPostcardList">
          <div v-for="(postcard, idx) in this.userLikedPostcard.postcardList.slice(index * 12 + 4, index * 12 + 8)" :key="`likedPostcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
            <p v-for="(tag, idx) in postcard.tag" :key="idx" class="mypaginationPostcardName">#{{tag}} &nbsp;</p>
          </div>
        </div>

        <div v-show="index === this.likedPostcardStage" class="mypaginationPostcardList">
          <div v-for="(postcard, idx) in this.userLikedPostcard.postcardList.slice(index * 12 + 8, index * 12 + 12)" :key="`likedPostcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
            <p v-for="(tag, idx) in postcard.tag" :key="idx" class="mypaginationPostcardName">#{{tag}} &nbsp;</p>
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
          <li v-for="(card, index) in this.userCards " :key="index">
            <img class="cardItem " :src="card" alt="">
          </li>
        </ul>
      </div>
    </div>
    </div> 
    <!-- 유저가 기부한 엽서들 페이지네이션해서 보여주는 부분 -->
    <div class="paginationPage">
    </div>


    <!-- 좋아하는 엽서 목록 부분 -->
    <div class="remindButton" @click="showPostcards">{{this.userInfo.userName}}'s favorite cards</div>
    <br>
    <!-- <div @click="choseImage">이미지 넣으실?</div> -->
    
    <!-- 포스트카드 나오는 부분 -->
    <div v-if="showRemind" class="d-flex justify-content-center" data-aos="fade-up" data-aos-duration="500">
      <!-- 벽지 -->
      <div class="remindBackground d-flex justify-content-center">
        
        <!-- 유저가 정한 이미지 6개 -->
        <img class="postcard postcard1" :src="showImages[0].imageUrl" alt="테스트" />
        <img class="postcard postcard2" :src="showImages[1].imageUrl" alt="테스트" />
        <img class="postcard postcard3" :src="showImages[2].imageUrl" alt="테스트" />
        <img class="postcard postcard4" :src="showImages[3].imageUrl" alt="테스트" />
        <img class="postcard postcard5" :src="showImages[4].imageUrl" alt="테스트" />
        <img class="postcard postcard6" :src="showImages[5].imageUrl" alt="테스트" />
        
        <!-- 폴라로이드 이미지 -->
        <div class="polaroids">          
        </div>
      
      </div>
    </div>


    <!-- 좋아하는 엽서 목록 2 -->
    <div class="d-flex justify-content-center">
      <favorite-postcards-a></favorite-postcards-a>
    </div>


    <!-- 좋아하는 엽서 목록 3 -->
    <div class="d-flex justify-content-center">
      <favorite-postcards-b></favorite-postcards-b>
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
  },

  data() {
    return {
        ownerSeq: 0,
        test: true,
        showRemind: true,
        showImages: [
        {
          imageUrl: require("../../public/images/test1.jpg")
        },
        {
          imageUrl: require("../../public/images/test2.jpg")
        },
        {
          imageUrl: require("../../public/images/test3.jpg")
        },
        {
          imageUrl: require("../../public/images/test4.jpg")
        },
        {
          imageUrl: require("../../public/images/test5.jpg")
        },
        {
          imageUrl: require("../../public/images/test6.jpg")
        },
      ],

      userCards : [
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
        require("../../public/images/test1.jpg"),
      ],

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
    ]),
    ...mapActions(postcardStore, [
      "userPostcardList",
      "getUserLikedPostcard",
    ]),

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

    // 프로필사진 변경
    changeProfile() {
      // profileInfo = { user_seq: , profile: 프로필 이미지 }  
      this.changeUserProfile(this.profileInfo)
    },

    showPostcards() {
        this.showRemind = !this.showRemind
    },

    choseImage() {
        this.showImages[0].imageUrl = require("../../public/images/test1.jpg")
    }
  },


  created() {
    this.ownerSeq = Number(this.$route.query.ownerSeq)
    console.log('유저시퀀스, 마이페이지 주인 시퀀스')
    console.log(this.userInfo.userSeq, this.ownerSeq)
    
    // 스토어에서 user_seq 들고와서 넣어줘야됨
    this.getDonationList(this.userInfo.userSeq)
    this.getFollowerList(this.userInfo.userSeq)
    this.userPostcardList(this.userInfo.userSeq)
    this.getUserLikedPostcard(this.userInfo.userSeq)
    // 기부총액, 기부횟수 계산
    let donationCnt = this.donationList.length
    let donationMoney = 0
    this.donationList.forEach(dontaion => {
      donationMoney += dontaion.donationPay
    });
    this.setMypageUserInfo({donationCnt: donationCnt, donationMoney: donationMoney })
    AOS.init()    
  },


  mounted() {
    console.log(screen.width)
    console.log(screen.height)
    console.log('마운티드')
    

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
  width: 14vw;
  margin-left: 2.5vw;
  height: 17vw;
  padding-top: 1vw;
  margin-top: 3vw;
  background-color: #fff;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}
.mypaginationPostcardName {
  display: inline-block;
  margin-top: 1vw;
  font-size: 2vw;
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

.Mypage {
  position: relative;
  height: 100%;
  width: 94vw;
  /* background-image: url(../../public/images/mypageBackground.jpg);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  background-attachment: fixed; */
  background-color: whitesmoke;
}

.paginationPage {
  height: 70vw;
  width: 60vw;
  margin: 0 auto;
  /* border:#555; */
}

.profileText {
  margin: 0 auto;
  margin-top: 5vh;
  font-size: 8vh;
  font-family: 'Nanum Pen Script', cursive;;
}
.myInfo {
  /* position: absolute; */
  margin-bottom: 0vh;
  /* padding: 0 5vw; */
  /* width: 100vw; */
}
.myProfileBox {
  background: #fff;
  margin: 0 auto;
  border-radius: 30px;
  padding: 3vh;
  width: 60vw;
  height: 50vh;
  box-sizing: border-box;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}
.myProfileImage {
  margin: 0 auto;
  border-radius: 20px;
  border: 0.1vw;
  border-style: solid;
  border-color: black;
  padding: 3vh;
  width: 25vw;
  height: 40vh;
  background-image: url(../../public/images/mypageDummyImage.png);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  box-sizing: border-box;
}
.myProfileInfo {
  margin: 0 auto;
  padding: 3vh;
  width: 30vw;
  height: 40vh;
  /* background-image: url(../../public/images/remind_wallpaper.jpg); */
  background-repeat: no-repeat;
  background-size: 100% 100%;
  box-sizing: border-box;
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
  background: white;
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
:root {
  --remind-bg-height: 90vh;
  --remind-bg-width: 105vh;
}

.remindButton {
  font-size: 3vw;
  font-family: 'Nanum Pen Script', cursive;;
  cursor : pointer;
}
.remindBackground {
  position: relative;
  height: calc(var(--remind-bg-height));
  width: calc(var(--remind-bg-width));
  background-image: url(../../public/images/remind_wallpaper.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  border-radius: 10px;
}
.polaroids {
  height: calc(var(--remind-bg-height));
  width: calc(var(--remind-bg-width));
  background-image: url(../../public/images/remind_polaroids.png);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  z-index: 99;
}
.postcard1 {
  position: absolute;
  height: 21vh;
  width: 22.2vh;
  top: 15vh;
  left: 8vh;
  transform:rotate(calc(6deg));
  background-repeat: no-repeat;
  background-size: 100% 100%;
  z-index: 100;
  overflow: hidden;
  transition: all 0.1s linear;
  border-radius: 5px;
}
.postcard2 {
  position: absolute;
  height: 21vh;
  width: 22.2vh;
  top: 15vh;
  left: 45vh;
  transform:rotate(calc(3deg));
  background-repeat: no-repeat;
  background-size: 100% 100%;
  z-index: 100;
  overflow: hidden;
  transition: all 0.1s linear;
  border-radius: 5px;
}
.postcard3 {
  position: absolute;
  height: 21vh;
  width: 22.2vh;
  top: 12vh;
  left: 78.3vh;
  transform:rotate(calc(9deg));
  background-repeat: no-repeat;
  background-size: 100% 100%;
  z-index: 100;
  overflow: hidden;
  transition: all 0.1s linear;
  border-radius: 5px;
}
.postcard4 {
  position: absolute;
  height: 21vh;
  width: 22.2vh;
  top: 60vh;
  left: 8vh;
  transform:rotate(calc(9deg));
  background-repeat: no-repeat;
  background-size: 100% 100%;
  z-index: 100;
  overflow: hidden;
  transition: all 0.1s linear;
  border-radius: 5px;
}
.postcard5 {
  position: absolute;
  height: 21vh;
  width: 22.2vh;
  top: 61vh;
  left: 41.5vh;
  transform:rotate(calc(-9.5deg));
  background-repeat: no-repeat;
  background-size: 100% 100%;
  z-index: 100;
  overflow: hidden;
  transition: all 0.1s linear;
  border-radius: 5px;
}
.postcard6 {
  position: absolute;
  height: 21vh;
  width: 22.2vh;
  top: 58vh;
  left: 75.5vh;
  transform:rotate(calc(-9.5deg));
  background-repeat: no-repeat;
  background-size: 100% 100%;
  z-index: 100;
  overflow: hidden;
  transition: all 0.1s linear;
  border-radius: 5px;
}
.postcard:hover {
  transform: scale(1.1);
}

.postcardBackground {
  position: relative;
  height: calc(var(--remind-bg-height));
  width: calc(var(--remind-bg-width));
  background-image: url(../../public/images/test1.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  border-radius: 10px;
}
</style>