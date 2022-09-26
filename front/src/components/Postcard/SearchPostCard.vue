<template>
<div class="searchPostcard">
  <div>
    <!-- {{ searchItem }} -->
    <!-- 엽서 이미지 넣을거임 -->
    <img :src="searchItem.postcard.postcardImgUrl" style="height: 20vw; width: 30vw;" alt="">
  </div>
  <p>{{ isLiked }}</p>
  <div class="searchPostcardArtist">
    {{ searchItem.userId }}
    {{ searchItem.postcard.postcardSeq }}
  </div>
  <div v-if="!isLiked" @click="dolikeLetter(searchItem.postcard.postcardSeq)" class="searchPostcardLike">
    좋아요 아이콘
  </div>
  <div v-if="isLiked" @click="dodislikeLetter(searchItem.postcard.postcardSeq)" class="searchPostcardLike">
    좋아요 취소
  </div>
</div>
</template>

<script>
import { mapActions, mapState } from "vuex";
import { likeLetter, dislikeLetter } from "@/api/mainpage.js";
const mainpageStore = "mainpageStore";
const accountStore = "accountStore";
const postcardStore = "postcardStore";

export default {
  name: "SearchPostCard",
  props: {
    searchItem: {
      type: Object,
    }
  },
  computed: {
    ...mapState(accountStore, ["userInfo"]),
    ...mapState(postcardStore, ["likedPostcards"]), // 좋아요 누른 엽서 목록
  },
  data() {
    return {
      isLiked: false,
    }
  },
  methods: {
    ...mapActions(mainpageStore, ["likeLetterStore", "dislikeLetterStore"]),
    ...mapActions(postcardStore, ["userLikedPostcardStore"]), // 좋아요 누른 엽서 목록 세팅. 좋아요, 좋아요 취소 시 필요
    async dolikeLetter(postcardSeq) {
      // console.log(postcardSeq, this.userInfo.userSeq);
      console.log(this.searchItem);
      console.log("=================");
      await likeLetter(postcardSeq, this.userInfo.userSeq);
      await this.userLikedPostcardStore(this.userInfo.userSeq); // 좋아요 누를때마다 좋아요 누른 엽서 목록 세팅
      this.isLiked = !this.isLiked;
    },
    async dodislikeLetter(postcardSeq) {
      await dislikeLetter(postcardSeq, this.userInfo.userSeq);
      await this.userLikedPostcardStore(this.userInfo.userSeq); // 좋아요 취소 누를때마다 좋아요 누른 엽서 목록 세팅
      this.isLiked = !this.isLiked;
    },
    

  },
  async created() {
    console.log('searchItem')
    console.log(this.likedPostcards);
    if (this.likedPostcards === []) {
      console.log("좋아요 목록 비어있음");
      console.log(this.likedPostcards);
    } else {
      await this.likedPostcards.forEach((postcard) => {
        // console.log(postcard.postcard.postcardSeq)
        // console.log(this.searchItem.postcard.postcardSeq)
        if (postcard.postcard.postcardSeq === this.searchItem.postcard.postcardSeq) {
          this.isLiked = true;
          console.log(this.isLiked, this.searchItem.postcard.postcardSeq);
          return false;
        } else {
          this.isLiked = false;
        }
      });
    }
    // 사용자의 좋아요 목록을 순회, 만약 해당 엽서가 좋아요 목록에 있다면?
    // 좋아요 누른 엽서 목록을 받아오는 로직
    // 스토어에서 목록을 가져오는 로직
    // 목록을 순회하여 좋아요 여부를 확인하는 로직
    // 좋아요 여부에 따라 isLiked 값을 바꿔주는 로직
  },
//   watch: {
//     likedPostcards() {
//   if (this.likedPostcards === []) {
//     console.log("좋아요 목록 비어있음");
//   } else {
//     this.likedPostcards.forEach((postcard) => {
//       // console.log(postcard);
//       if (postcard.postcard.postcardSeq === this.searchItem.postcard.postcardSeq) {
//         this.isLiked = true;
//         console.log(this.isLiked);
//         return false;
//       } else {
//         this.isLiked = false;
//         console.log(this.isLiked);
//       }
//     });
//   }
// }
//   }
}
</script>

<style>
.searchPostcard {
  position: relative;
  width: 30vw;
  height: 20vw;
  background-color: antiquewhite;
  border-radius: 20px;
  overflow: hidden;
  margin-bottom: 2vh;
}

.searchPostcard::-webkit-scrollbar {
  display: none;
}

.searchPostcardArtist {
  cursor: pointer;
  position: absolute;
  top: 90%;
  left: 80%;
  height: 3vh;
  width: 5vw;
  border-radius: 20px;
  border: 1px solid black;
  overflow: auto;
  background-color: azure;
}

.searchPostcardArtist::-webkit-scrollbar {
  display: none;
}

.searchPostcardLike {
  position: absolute;
  cursor: pointer;
  top: 90%;
  left: 5%;
  border-radius: 20px;
  border: 1px solid black;
  background-color: azure;
}
</style>