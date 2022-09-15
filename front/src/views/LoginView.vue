<template>
  <div class="logpageClass">
  <div class="mainLogoClass">
    <h1>엽AI사전</h1>
  </div>
  <div class="logInformationClass d-flex flex-row">
    <div class="col-5">
    <div class="logLogoClass">
      <h1 style="margin: 5%">POST CARD</h1>
    </div>
    <img class="justify-content-center" src="@/assets/logo.png" alt="대표우편">
    </div>
    <v-divider class="col-1" vertical />
    <form @submit.prevent="userLogin(this.credentials)" class="container col-6 align-self-center" style="max-width: 600px;">
      <div class="row mb-3">
        <label for="username" class="text-start form-label">Username</label>
        <input v-model="credentials.userId" type="text" class="form-control" id="username" placeholder="ID를 입력해 주세요." required>
      </div>
      <div class="row mb-3">
        <label for="password" class="text-start form-label">Password</label>
        <input v-model="credentials.userPassword" type="password" class="form-control" id="password" placeholder="비밀번호를 입력해 주세요." required>
      </div>
      <div class="row mb-3">
        <button type="submit" class="btn btn-primary">Login</button>    
      </div>
      <hr>
    </form>
  </div>
  </div>
</template>
<script>
  import { mapActions } from 'vuex'
  const accountStore = "accountStore";

  export default {
  name: "LoginView",
  data() { return { credentials: { userId: '', userPassword: '', }}},
  methods: {
    ...mapActions(accountStore, [
      'userLogin'
    ])
  },
}
</script>


<style>
.logpageClass {
  height: 100vh;
  background-color: #fcf4e0;
}
.mainLogoClass {
  z-index: 1;
  position: fixed;
  margin-left: 5vh;
  font-size: 1vw;
}
.logInformationClass {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  height: 70vh;
  width: 90vw;
  border-radius: 10px;
  background-color: #d9d9d9;
}
.logLogoClass {
  height: 5vh;
  width: auto;
  border-radius: 10px;
  border-width: 1px;
  border: 3px double #000;
}
</style>