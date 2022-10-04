<template>
  <side-bar></side-bar>
  <div class="searchPageClass">
    <div class="searchBarClass">
      <div class="searchBarbody">
        <input @keyup.enter="submitSearch" v-model="searchMessage" class="searchBarInput" type="text" placeholder=". . . search">
      </div>
    </div>
    <!-- 검색결과 문구창 -->
    <div class="searchText">
      <h1>"{{this.searchedWord}}"에 대한 검색 결과입니다.  (총 {{this.isSearchResult ? this.letterSearchResult.length : 0}}개)</h1>
    </div>
    <!-- 검색 결과 화면 -->
    <div class="searchResult">
      <!-- 첫번째 줄 모음 -->
      <div v-if="this.isSearchResult" class="searchOddLine">
        <div v-for="(num, index) in this.letterSearchResult.length%4 ?Math.ceil(this.letterSearchResult.length/4): Math.floor(this.letterSearchResult.length/4)"
          :key="`postcard1-${index}`">
          <SearchPostCard :searchItem="this.letterSearchResult[index*4]" />
        </div>
      </div>
      <!-- 두번째 줄 모음 -->
      <div v-if="this.isSearchResult" class="searchEvenLine">
        <div v-for="(num, index) in this.letterSearchResult.length%4 > 1 ?Math.ceil(this.letterSearchResult.length/4): Math.floor(this.letterSearchResult.length/4)"
            :key="`postcard2-${index}`">
          <SearchPostCard :searchItem="this.letterSearchResult[index*4+1]" />
        </div>
      </div>
      <!-- 세번째 줄 모음 -->
      <div v-if="this.isSearchResult" class="searchOddLine">
        <div v-for="(num, index) in this.letterSearchResult.length%4 > 2 ?Math.ceil(this.letterSearchResult.length/4): Math.floor(this.letterSearchResult.length/4)"
          :key="`postcard2-${index}`">
          <SearchPostCard :searchItem="this.letterSearchResult[index*4+2]" />
        </div>
      </div>
      <!-- 네번째 줄 모음 무조건 내림, 어차피 딱 음 -->
      <div v-if="this.isSearchResult" class="searchEvenLine">
        <div v-for="(num, index) in Math.floor(this.letterSearchResult.length/4)"
          :key="`postcard2-${index}`">
          <SearchPostCard :searchItem="this.letterSearchResult[index*4+3]"/>
        </div>
      </div>
      <!-- 엽서 조회결과 화면 -->
      <div v-if="!this.isSearchResult" class="searchLetterNoResult">
        <div class="searchLetterItem" v-for="(letter, index) in this.letterSearchResult" :key="index">
          <search-post-card :searchItem = letter></search-post-card>
        </div>
      </div>
    </div>
    <!-- 화면을 위로 전환시키는 버튼 -->
    <i v-show="this.upBtn" class="fa-regular fa-circle-up searchgoUpBtn" @click="goUp"></i>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue";
import SearchPostCard from "@/components/Search/SearchPostCard.vue";
const searchStore = "searchStore";
const accountStore = "accountStore";
const postcardStore = "postcardStore";

export default {
  name: "SearchView",
  components: {
    SideBar,
    SearchPostCard,
  },
  data() {
    return {
      searchMessage: "",
      upBtn: false,
      searchItemList: [],
    }
  },
  computed: {
    ...mapGetters(accountStore, ["userInfo"]),
    ...mapGetters(searchStore, ["letterSearchResult", "isSearchResult", "searchedWord"]),
  },
  methods: {
    ...mapActions(searchStore, ["getSearchResult"]),
    ...mapActions(postcardStore, ["userLikedPostcardStore"]),
    async submitSearch() {
      await this.userLikedPostcardStore(this.userInfo.userSeq);
      if (this.searchMessage !== "") {
        // console.log(this.searchMessage);
        let searchWord = this.searchMessage;
        await this.getSearchResult(searchWord);
      }
      this.$router.push({ name: "SearchView" });
    },
    goHome() {
      this.$router.push({ name: "MainView" });
    },
    // 화면 스크롤을 위로
    goUp() {
      window.scrollTo({ left: 0, top: 0, behavior: "smooth" });
    },
    upScroll() {
      if (scrollY <= 10) {
        this.upBtn = false;
      } else {
        this.upBtn = true;
      }
    },

    // 검색 결과 없을 때 로직
    // 엽서 결과 없을 때 -> 엽서 파티션에 "엽서 검색 결과가 없어요" 보여주고
    // 적당한 이미지를 띄워주자

  },
  // 스크롤 이벤트에 추가
  mounted() {
    document.addEventListener("scroll", this.upScroll);
  },
  unmounted() {
    document.removeEventListener("scroll", this.upScroll);
  },
}
</script>

<style>
/* 검색 페이지 총괄 */
.searchPageClass {
  position: relative;
  width: 94vw;
  height: 100vh;
  background-color: #faf8f5;
  overflow-x: hidden;
  overflow-y: auto;
}

/* 검색 바 관련 */
.searchBarClass {
  position: absolute;
  top: 5%;
  left: 47%;
  transform: translate(-50%, -50%);
  height: 5vh;
  width: 25vw;
  border-radius: 1000px;
  background-color: #484233;
}
.searchBarbody {
  width: 24vw;
}
.searchBarInput {
  height: 5vh;
  width: 20vw;
  border: none;
  background: none;
  outline: none;
  color: #faf8f5;
}

/* 검색 텍스트 관련 */
.searchText {
  position: absolute;
  top: 11%;
  margin-left: auto;
  margin-right: auto;
  left: 0;
  right: 0; 
}


/* 검색 결과 배치 관련 */
.searchResult {
  position: absolute;
  top: 20%;
  /* 중앙정렬 */
  margin-left: auto;
  margin-right: auto;
  left: 0;
  right: 0; 

  width: 100vw;
  height: auto;
  background-color: #faf8f5;
  overflow: auto;
  display: flex;
  justify-content: center;
}
.searchResult::-webkit-scrollbar {
  display: none;
}
/* 각 줄 설정 */
.searchOddLine {
  display: flex;
  margin-top: 4vh;
  flex-direction: column;
  width: 20%;
  margin-left: 1vw;
  /* 부모의 자식 요소가 3차원의 애니메이션 효과를 가질때, 300px의 거리에서 보는 원근감을 줌 */
  perspective: 300px;
}
.searchEvenLine {
  display: flex;
  flex-direction: column;
  margin-top: 8vh;
  margin-bottom: 4vh;
  margin-left: 2%;
  width: 20%;
  /* 부모의 자식 요소가 3차원의 애니메이션 효과를 가질때, 300px의 거리에서 보는 원근감을 줌 */
  perspective: 300px;
}

.searchLetterNoResult {
  width: 47vw;
  height: 90vh;
  background-color: #faf8f5;
  background-image: url('../../public/images/searchNoLetter.png');
  background-size: 47vw 90vh;
}

/* 위로 올리는 버튼 */
.searchgoUpBtn {
  z-index: 1;
  cursor: pointer;
  position: fixed;
  bottom: 1%;
  left: 0.5%;
  font-size: 2.5vw;
}
</style>