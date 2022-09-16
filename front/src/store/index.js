import { createStore } from "vuex";
import createPersistedState from "vuex-persistedstate";
import mainpageStore from "./modules/mainpageStore";
import accountStore from "./modules/accountStore";
import mypageStore from "./modules/mypageStore";
import organizationStore from "./modules/organizationStore";
import donationStore from "./modules/donationStore";

export default createStore({
  state: {},
  getters: {},
  mutations: {},
  actions: {},
  modules: {
    mainpageStore,
    accountStore,
    organizationStore,
    donationStore,
    mypageStore,
  },
  plugins: [
    createPersistedState({
      storage: sessionStorage,
    }),
  ],
});
