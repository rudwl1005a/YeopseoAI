<template>



    <!-- 포스트카드 나오는 부분 -->
    <!-- 본인 창이면 -->
    <div v-if="this.isOwner" class="d-flex justify-content-center" data-aos="fade-up" data-aos-duration="500">
      <!-- 벽지 -->
      <div class="remindBackground d-flex justify-content-center">
        
        <!-- 유저가 정한 이미지 6개 -->


        <img class="postcard postcard1" style="cursor: pointer;" @click="changeUserRemind(0)" data-bs-toggle="modal" data-bs-target="#choiceModal" :src="showImages[0].imageUrl" alt="테스트" />
        <img class="postcard postcard2" style="cursor: pointer;" @click="changeUserRemind(1)" data-bs-toggle="modal" data-bs-target="#choiceModal" :src="showImages[1].imageUrl" alt="테스트" />
        <img class="postcard postcard3" style="cursor: pointer;" @click="changeUserRemind(2)" data-bs-toggle="modal" data-bs-target="#choiceModal" :src="showImages[2].imageUrl" alt="테스트" />
        <img class="postcard postcard4" style="cursor: pointer;" @click="changeUserRemind(3)" data-bs-toggle="modal" data-bs-target="#choiceModal" :src="showImages[3].imageUrl" alt="테스트" />
        <img class="postcard postcard5" style="cursor: pointer;" @click="changeUserRemind(4)" data-bs-toggle="modal" data-bs-target="#choiceModal" :src="showImages[4].imageUrl" alt="테스트" />
        <img class="postcard postcard6" style="cursor: pointer;" @click="changeUserRemind(5)" data-bs-toggle="modal" data-bs-target="#choiceModal" :src="showImages[5].imageUrl" alt="테스트" />
        
        <!-- 폴라로이드 이미지 -->
        <div class="polaroids">          
        </div>
      
      </div>
    </div>


    <!-- 다른사람 페이지면 -->
    <div v-else class="d-flex justify-content-center" data-aos="fade-up" data-aos-duration="500">
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


</template>

<script>
import { mapActions, mapGetters } from "vuex";
const mypageStore = "mypageStore";
const accountStore = "accountStore";
const postcardStore = "postcardStore";



export default {
    name: "favoritePostcardC",
    data() {
    return {
      isOwner: 0,
      showTemp: false,
      changeSeq: 0,
      changeDonationSeq: 0,
        showImages: [
        {
          imageUrl: require("../../../public/images/test1.jpg")
        },
        {
          imageUrl: require("../../../public/images/test2.jpg")
        },
        {
          imageUrl: require("../../../public/images/test3.jpg")
        },
        {
          imageUrl: require("../../../public/images/test4.jpg")
        },
        {
          imageUrl: require("../../../public/images/test5.jpg")
        },
        {
          imageUrl: require("../../../public/images/test6.jpg")
        },
      ],
    }
    },

    computed: {
    ...mapGetters(mypageStore, [
      "donationList",
      "ownerInfo",
    ]),
    ...mapGetters(accountStore, [
      "userInfo",
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
      "getDonationList",
      "changeTemplate",
      "changeRemind",
      "changeUserRemind",
    ]),

    },
    created() {
      if (this.ownerInfo.userSeq === this.userInfo.userSeq) {
        this.isOwner = true
      }
    },
}
</script>

<style>
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
  background-image: url(../../../public/images/remind_wallpaper.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  border-radius: 10px;
}
.polaroids {
  height: calc(var(--remind-bg-height));
  width: calc(var(--remind-bg-width));
  background-image: url(../../../public/images/remind_polaroids.png);
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
  background-image: url(../../../public/images/test1.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  border-radius: 10px;
}
</style>