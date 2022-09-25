<template>
<div class="searchPostcard">
  <div>
    <!-- {{ searchItem }} -->
    <!-- 엽서 이미지 넣을거임 -->
    <img :src="searchItem.postcard.postcardImgUrl" style="height: 20vw; width: 30vw;" alt="">
  </div>
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

export default {
  name: "SearchPostCard",
  props: {
    searchItem: {
      type: Object,
    }
  },
  computed: {
    ...mapState(accountStore, ["userInfo"]),
  },
  data() {
    return {
      isLiked: false,
    }
  },
  methods: {
    ...mapActions(mainpageStore, ["likeLetterStore", "dislikeLetterStore"]),
    dolikeLetter(postcardSeq) {
      likeLetter(postcardSeq, this.userInfo.userSeq);
    },
    dodislikeLetter(postcardSeq) {
      dislikeLetter(postcardSeq, this.userInfo.userSeq);
    },
  },
  async created() {
    // 사용자의 좋아요 목록을 순회, 만약 해당 엽서가 좋아요 목록에 있다면?
    // 좋아요 누른 엽서 목록을 받아오는 로직
    // 스토어에서 목록을 가져오는 로직
    // 목록을 순회하여 좋아요 여부를 확인하는 로직
    // 좋아요 여부에 따라 isLiked 값을 바꿔주는 로직
  },
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