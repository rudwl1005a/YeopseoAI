<template>
  <!-- 앞면 -->
  <div v-show="!this.back" class="searchPostcard front" >
    <div>
      <img :src="searchItem.postcard.postcardImgUrl" class="searchPostcardImg">
    </div>
    <button class="searchPostcardButton" @click="changeFace">
      상세정보
    </button>
    <i v-show="isLiked" @click="dodislikeLetter(searchItem.postcard.postcardSeq)"  class="fa-solid fa-heart searchPostcardLike" ></i>
    <i v-show="!isLiked" @click="dolikeLetter(searchItem.postcard.postcardSeq)" class="fa-regular fa-heart searchPostcardLike"></i>
  </div>
  <!-- 뒷면 -->
  <div v-show="this.back" class="searchPostcard back">
    <!-- 내용들 -->
    <div class="searchMade">
      <h5 style="margin-bottom:0;">작가: </h5>
      <button class="searchProfileBtn" @click="goArtistMypage(this.searchItem.postcard.userSeq)">
        {{this.searchItem.userId}}
      </button>
    </div>
    <hr>
    <h5>관련 태그</h5>
    <!-- 태그들 -->
    <div class="searchTag">
      <div class="searchTagAlign" v-for="(tag, idx) in this.searchItem.tag" :key="`postcard-${idx}`">
        <button @click="submitSearch(tag)" class="searchProfileTag">{{tag}}</button>
      </div>
    </div>
    <button class="searchPostcardButton" @click="changeFace">
      엽서보기
    </button>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";
import { likeLetter, dislikeLetter } from "@/api/mainpage.js";
const mainpageStore = "mainpageStore";
const accountStore = "accountStore";
const postcardStore = "postcardStore";
const searchStore = "searchStore"

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
      back: false,
    }
  },
  methods: {
    ...mapActions(mainpageStore, ["likeLetterStore", "dislikeLetterStore"]),
    ...mapActions(postcardStore, ["userLikedPostcardStore"]),
    ...mapActions(searchStore, ["getSearchResult"]),
    // 좋아요
    async dolikeLetter(postcardSeq) {
      await likeLetter(postcardSeq, this.userInfo.userSeq);
      await this.userLikedPostcardStore(this.userInfo.userSeq); // 좋아요 누를때마다 좋아요 누른 엽서 목록 세팅
      this.isLiked = !this.isLiked;
    },
    // 싫어요
    async dodislikeLetter(postcardSeq) {
      await dislikeLetter(postcardSeq, this.userInfo.userSeq);
      await this.userLikedPostcardStore(this.userInfo.userSeq); // 좋아요 취소 누를때마다 좋아요 누른 엽서 목록 세팅
      this.isLiked = !this.isLiked;
    },
    // 검색
    async submitSearch(tag) {
      await this.getSearchResult(tag);
      this.$router.go(0);
    },
    // 앞뒤 변경 버튼
    changeFace() {
      this.back = !this.back
    },

    // 아티스트 마이페이지 가는 버튼
    goArtistMypage(userSeq) {
      this.$router.push({path: `/mypage/${userSeq}`, query: {ownerSeq: userSeq}});
      window.scrollTo(0, 0)
    },

  },
  async created() {
    this.isLiked = await this.likedPostcards.some((postcard) => {
        return postcard.postcard.postcardSeq === this.searchItem.postcard.postcardSeq 
        }  
      );
    },
    // 사용자의 좋아요 목록을 순회, 만약 해당 엽서가 좋아요 목록에 있다면?
    // 좋아요 누른 엽서 목록을 받아오는 로직
    // 스토어에서 목록을 가져오는 로직
    // 목록을 순회하여 좋아요 여부를 확인하는 로직
    // 좋아요 여부에 따라 isLiked 값을 바꿔주는 로직
}
</script>

<style>
/* 개별 포스트 카드 */
.searchPostcard {
  position: relative;
  width: 18vw;
  height: 18vw;
  background-color: antiquewhite;
  border-radius: 10px;
  overflow: hidden;
  margin-bottom: 2vh;
  /* 입체 그림자효과 */
  filter: drop-shadow(10px 6px 6px #c3c3c3);
  /*카드의 뒷면을 안보이게 처리-카드가 뒤집히면 뒷면이 안보임*/
  backface-visibility: hidden;
  transition: 0.3s;
}
.searchPostcard:hover {
  transform: scale3d(1.1, 1.1, 1.1);
  z-index: 1
}

.searchPostcard .front {
  /* 앞면 카드가 부유하게 되어, 뒷면 카드가 아래에서 위로 올라감 -> 요소 두개가 겹치게 됨*/
  position: absolute;
  /* 명시적으로 기본값 설정, 없어도 됨*/
  transform: rotateY(0deg);
}
.searchPostcard .back {
  /* 앞면 카드가 부유하게 되어, 뒷면 카드가 아래에서 위로 올라감 -> 요소 두개가 겹치게 됨*/
  position: absolute;
  /* 명시적으로 기본값 설정, 없어도 됨*/
  transform: rotateY(0deg);
}
.searchPostcard:hover .front {
  transform: rotateY(180deg);
}
.searchPostcard .back {
  transform: rotateY(-180deg);
}
.searchPostcard .back {
  transform: rotateY(0deg);
}

/* 엽서 이미지 */
.searchPostcardImg {
  width: 18vw;
  height: 15.5vw;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}
/* 상세정보 버튼 */
.searchPostcardButton {
  cursor: pointer;
  position: absolute;
  right: 0.5vw;
  bottom: 0.3vw;
  border-radius: 5px;
  border: 0px;
  overflow: auto;
  background-color: azure;
}
/* 좋아요 버튼 */
.searchPostcardLike {
  position: absolute;
  cursor: pointer;
  top: 16.3vw;
  left: 5%;
  font-size: 1.5vw;
  border-radius: 20px;
  color: red;
}
/* 뒷면 */
/* 작성자 */
.searchMade {
  margin-left: 1vw;
  margin-top: 1vw;
  display: flex;
}
/* 작성유저 프로필 버튼 */
.searchProfileBtn {
  cursor: pointer;
  border-radius: 5px;
  border: 0px;
  overflow: auto;
  background-color: azure;
}
.searchProfileBtn:hover {
  transform: scale3d(1.3, 1.3, 1.3);
}

/* 태그 */
.searchTag {
  background-color: beige;
  width: 16vw;
  height: 8vw;
  margin: auto;
  display: flex;
  flex-wrap: wrap;
  align-content: flex-start;
  /* justify-content: flex-start; */
  border: 0.5px grey dashed;
  border-radius: 5px;
  overflow: auto;
}

.searchTag::-webkit-scrollbar {
  display: none;
}

/* 세부 태그들 */
.searchTagAlign {

}

.searchProfileTag {
  width: auto;
  height: 30px;
  margin: 0.5vw;
  cursor: pointer;
  border-radius: 5px;
  border: 0px;
  background-color: azure;
  font-size: 1vw;
}

.searchProfileTag:hover {
  transform: scale3d(1.3, 1.3, 1.3);
}
</style>