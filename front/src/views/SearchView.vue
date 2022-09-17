<template>
  <div>SearchResult</div>
    <div class="searchBarClass">
      <div class="searchBarbody">
        <input @input="getAutoComplete" @keyup.enter="submitSearch" v-model="searchMessage" class="searchBarInput" type="text" placeholder=". . . search">
      </div>
    </div>
  <div class="letterResult">
    {{ letterResult }}
  </div>
  <div class="foundationResult">
    {{ foundationResult }}
  </div>
  <div @click="goHome">
    홈으로 이동
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
const searchStore = "searchStore";

export default {
  name:"SearchView",
  data() {
    return {
      letterResult: [], // 검색 결과가 담길 곳. store에 세팅된 검색 결과를 가져오자
      foundationResult: [],
      searchMessage: "",
    }
  },
  computed: {
    ...mapState(searchStore, ["letterSearchResult", "foundationSearchResult"]),
  },
  methods: {
    ...mapActions(searchStore, ["getSearchResult"]),
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
    }
  },
  created() {
    this.letterResult = this.letterSearchResult;
    this.foundationResult = this.foundationSearchResult;
  },
  watch: {
    letterSearchResult() {
      this.letterResult = this.letterSearchResult;
    },
    foundationSearchResult() {
      this.foundationResult = this.foundationSearchResult;
    },
  }
}
</script>

<style>

</style>