<template>
    <form @submit.prevent="login" class="container col-6 logForm" style="max-width: 600px;">
      <div class="row mb-3">
        <label for="username" class="loglabel form-label">Username</label>
        <input v-model.trim="credentials.userId" type="text" class="form-control" id="username" placeholder="ID를 입력해 주세요." required>
      </div>
      <div class="row mb-3">
        <label for="password" class="loglabel form-label">Password</label>
        <input v-model.trim="credentials.userPassword" type="password" class="form-control" id="password" placeholder="비밀번호를 입력해 주세요." required>
      </div>
      <div class="row mb-3">
        <button type="submit" class="btn btn-primary">Login</button>    
      </div>
      <hr>
    </form>
</template>
<script>
  import { mapActions, mapGetters } from 'vuex'
  const accountStore = "accountStore";

  export default {
  name: "LoginView",
  data() { return { credentials: { userId: null, userPassword: null}}},
  computed: {
    ...mapGetters(accountStore, ['isLogged'])
  },
  methods: {
    ...mapActions(accountStore, ['userLogin']),
    async login() {
      await this.userLogin(this.credentials)
      // 로그인이 된 경우
      if (this.isLogged) {
        // 입력값 초기화
        this.credentials = { userId: null, userPassword: null}
        // 메인페이지로 이동
        this.$router.push({ name: "MainView" });
      }
    }
  },
}
</script>
<style>
.logForm {
  align-self: center;
}
.loglabel {
  text-align: start;
}

</style>