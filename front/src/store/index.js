import { createStore } from 'vuex';
import createPersistedState from 'vuex-persistedstate';
import mainpageStore from './modules/mainpageStore'
import mypageStore from './modules/mypageStore'
import organizationStore from './modules/organizationStore'
import donationStore from './modules/donationStore'

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
    mypageStore,
    organizationStore,
    donationStore,
  },
  plugins: [
    createPersistedState({
      storage: sessionStorage,
    })
  ],
})
