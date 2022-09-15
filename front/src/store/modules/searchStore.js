import {
  search,
} from "@/api/search.js"

const searchStore = {
  namespaced: true,
  state: {
    letterSearchResult: [],
    foundationSearchResult: [],
  },
  getters: {

  },
  mutations: {
    SET_SEARCHRESULT: (state, searchResult) => {
      state.letterSearchResult = searchResult.postcardLists;
      state.foundationSearchResult = searchResult.foundationSearchLists;
    }
  },
  actions: {
    async getSearchResult({ commit }, searchWord) {
      await search(
        searchWord,
        (response) => {
          console.log("검색어 입력시 어떤 응답이 오는지 확인")
          console.log(response);
          console.log(response.data);
          commit('SET_SEARCHRESULT', response.data);
        },
        (error) => {
          console.log(error);
        }
      )
    },
  },
}

export default searchStore;