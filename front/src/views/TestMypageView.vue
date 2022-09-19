<template>
    <div>Mypage</div>
    <div class="remindButton" @click="showPostcards">Remind your love</div>
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

    <div v-if="!showRemind" class="d-flex justify-content-center" data-aos="fade-up" data-aos-duration="500">
      <!-- 벽지 -->
      <div class="postcardBackground d-flex justify-content-center">
        
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
    <br>
</template>

<script>
import AOS from 'aos';
import "aos/dist/aos.css";
import { mapActions, mapGetters } from "vuex";
const mypageStore = "mypageStore";


export default {
  name: "MypageView",


  data() {
    return {
        showRemind: true,
        showImages: [
        //     '../../public/images/test1.jpg',
        //     'test2',
        //     'test3',
        //     'test4',
        //     'test5',
        //     'test6',
        // 

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
      ]
    };
  },


  computed: {
    ...mapGetters(mypageStore, [
      "donationList",
      "followList",
      "profileImage",
    ]),
  },


  methods: {
    ...mapActions(mypageStore, [
      "userSecession",
      "updateUserInfo",
      "changeUserProfile",
      "getDonationList",
      "getFollowerList",
    ]),

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
    // 스토어에서 user_seq 들고와서 넣어줘야됨
    this.getDonationList()
    this.getFollowerList()
    AOS.init()
  },


  mounted() {
    console.log(screen.width)
    console.log(screen.height)
  },  
}
</script>

<style>
:root {
  --remind-bg-height: 90vh;
  --remind-bg-width: 105vh;
}

.remindButton {
  font-family: 'Nanum Pen Script', cursive;;
  font-size: 3vw;
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