<template>
    <div>Mypage</div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
const mypageStore = "mypageStore";


export default {
  name: "MypageView",


  data() {
    return {
    };
  },


  computed: {
    ...mapGetters(mypageStore, [
      "donationList",
      "followList",
      "profileImage",
    ]),
  },


  methods: {
    ...mapActions(mypageStore, [
      "userSecession",
      "updateUserInfo",
      "changeUserProfile",
      "getDonationList",
      "getFollowerList",
    ]),

    // 회원탈퇴
    secession() {
      // 스토어에서 user_seq 들고와서 넣어줘야됨
      this.userSecession()
    },

    // 유저정보 업데이트
    updateInfo() {
      // updateInfo = { user_seq: , info: { userPassword: , userPhone: , userEmail: } }
      this.updateUserInfo(this.updateInfo)
    },

    // 프로필사진 변경
    changeProfile() {
      // profileInfo = { user_seq: , profile: 프로필 이미지 }  
      this.changeUserProfile(this.profileInfo)
    }
  },


  created() {
    // 스토어에서 user_seq 들고와서 넣어줘야됨
    this.getDonationList()
    this.getFollowerList()
  },


  mounted() {

  },  
}
</script>

<style>

</style>