<template>
  <side-bar></side-bar>
  <div class="searchPageClass">
    <div class="searchBarClass">
      <div class="searchBarbody">
        <input @input="getAutoComplete" @keyup.enter="submitSearch" v-model="searchMessage" class="searchBarInput" type="text" placeholder=". . . search">
      </div>
    </div>
    <!-- 검색 결과 화면 -->
    <div class="searchResult">
      <!-- 엽서 조회결과 화면 -->
      <div :class="{searchLetterResult : isThereLetter, searchLetterNoResult : !isThereLetter }">
        <div class="searchLetterItem" v-for="(letter, index) in letterResult" :key="index">
          <search-post-card :searchItem = letter></search-post-card>
        </div>
      </div>
      <!-- 재단 조회결과 화면 -->
      <div :class="{searchFoundationResult : isThereFoundation, searchFoundationNoResult : !isThereFoundation }">
        <!-- {{ foundationResult }} -->
        <div class="searchFoundationItem" v-for="(foundation, index) in foundationResult" :key="index">
          <search-foundation :foundationItem = foundation></search-foundation>
        </div>
      </div>
    </div>
    <div class="searchGoHome" @click="goHome">
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue";
import SearchPostCard from "@/components/Postcard/SearchPostCard.vue";
import SearchFoundation from "@/components/Foundation/searchFoundation.vue";
const searchStore = "searchStore";
const accountStore = "accountStore";
const postcardStore = "postcardStore";

export default {
  name: "SearchView",
  components: {
    SideBar,
    SearchPostCard,
    SearchFoundation,
  },
  data() {
    return {
      letterResult: [], // 검색 결과가 담길 곳. store에 세팅된 검색 결과를 가져오자
      foundationResult: [],
      searchMessage: "",
      isThereLetter: true,
      isThereFoundation: true,
    }
  },
  computed: {
    ...mapState(accountStore, ["userInfo"]),
    ...mapState(searchStore, ["letterSearchResult", "foundationSearchResult"]),
  },
  methods: {
    ...mapActions(searchStore, ["getSearchResult"]),
    ...mapActions(postcardStore, ["userLikedPostcardStore"]),
    getAutoComplete() {
      console.log(this.searchMessage);
    },
    async submitSearch() {
      if (this.searchMessage !== "") {
        console.log(this.searchMessage);
        let searchWord = this.searchMessage;
        await this.getSearchResult(searchWord);
      } else {
        console.log("검색어 입력하라고");
      }
    },
    goHome() {
      this.$router.push({ name: "MainView" });
    },

    // 검색 결과 없을 때 로직
    // 엽서 결과 없을 때 -> 엽서 파티션에 "엽서 검색 결과가 없어요" 보여주고
    // 적당한 이미지를 띄워주자
    // 재단 결과 없을 때 -> 재단 파티션에 "재단 검색 결과가 없어요" 보여주고
    // 적당한 이미지를 띄워주자

  },
  created() {
    this.letterResult = this.letterSearchResult;
    this.foundationResult = this.foundationSearchResult;
    if (this.letterSearchResult == "") {
      this.isThereLetter = false;
    }
    if (this.foundationSearchResult == "") {
      this.isThereFoundation = false;
    }
  },
  watch: {
    letterSearchResult() {
      this.letterResult = this.letterSearchResult;
      // 검색 결과가 없을 때 로직
      if (this.letterSearchResult == "") {
        // class를 조절할 수 있는 변수를 data에서 바꾸어 주자
        this.isThereLetter = false;
        console.log("엽서 검색 결과가 없네요");
      } else {
        this.isThereLetter = true;
        console.log("엽서 검색 결과가 있네요");
      }
    },
    foundationSearchResult() {
      this.foundationResult = this.foundationSearchResult;
      // 검색 결과가 없을 때 로직
      if (this.foundationSearchResult == "") {
        this.isThereFoundation = false;
        console.log("재단 검색 결과가 없네요");
      } else {
        this.isThereFoundation = true;
        console.log("재단 검색 결과가 있네요");
      }
    },
  }
}
</script>

<style>
/* 검색 페이지 총괄 */
.searchPageClass {
  height: 100vh;
  background-color: #faf8f5;
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


/* 검색 결과 배치 관련 */
.searchResult {
  position: absolute;
  top: 10%;
  display: flex;
}


/* 엽서 검색 결과 배치 관련 */
.searchLetterResult {
  width: 47vw;
  height: 90vh;
  background-color: #faf8f5;
  overflow: auto;
  /* display: flex; */
  /* justify-content: space-around; */
  /* flex-wrap: wrap; */
}

.searchLetterResult::-webkit-scrollbar {
  display: none;
}

.searchLetterItem {
  display: flex;
  justify-content: center;
}

.searchLetterNoResult {
  width: 47vw;
  height: 90vh;
  background-color: #faf8f5;
  background-image: url('../../public/images/searchNoLetter.png');
  background-size: 47vw 90vh;
}


/* 재단 검색 결과 배치 관련 */
.searchFoundationResult {
  width: 47vw;
  height: 90vh;
  background-color: #faf8f5;
  overflow: auto;
}

.searchFoundationResult::-webkit-scrollbar {
  display: none;
}

.searchFoundationItem {
  display: flex;
  justify-content: center;
}

.searchFoundationNoResult {
  width: 47vw;
  height: 90vh;
  background-color: #faf8f5;
  background-image: url('../../public/images/searchNoFoundation.png');
  background-size: 47vw 90vh;
}

/* 검색화면에서 홈 화면으로 이동 */
.searchGoHome {
  cursor: pointer;
  position: absolute;
  top: 90%;
  left: 47%;
  height: 5vw;
  width: 5vw;
  background-image: url("../../public/images/homeicon.png");
  background-size: 5vw 5vw;
  transform: translate(-50%, -50%);
}
</style>