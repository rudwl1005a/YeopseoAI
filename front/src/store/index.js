import { createStore } from "vuex";
import createPersistedState from "vuex-persistedstate";
import mainpageStore from "./modules/mainpageStore";
import accountStore from "./modules/accountStore";

export default createStore({
  state: {},
  getters: {},
  mutations: {},
  actions: {},
  modules: {
    mainpageStore,
    accountStore,
  },
  plugins: [
    createPersistedState({
      storage: sessionStorage,
    }),
  ],
});
