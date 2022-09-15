import { createStore } from 'vuex';
import createPersistedState from 'vuex-persistedstate';
import mainpageStore from './modules/mainpageStore';
import searchStore from './modules/searchStore';

export default createStore({
  state: {
  },
  getters: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    mainpageStore,
    searchStore,
  },
  plugins: [
    createPersistedState({
      storage: sessionStorage,
    })
  ],
})
