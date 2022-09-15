<template>
    <div>Donation</div>

    <!-- 기부 테스트 -->
    <input type="file" accept="image/*" @change="changeImage" />
    <img :src="donationInfo.donationImgUrl" alt="">
    <input
      type="number"
      placeholder="얼마?"
      v-model="donationInfo.donationPay"
    />
    <input
      type="text"
      placeholder="응원메세지"
      v-model="donationInfo.donationText"
    />
    <input
      type="number"
      placeholder="foundationSeq"
      v-model="donationInfo.foundationSeq"
    />
    <input
      type="number"
      placeholder="userSeq"
      v-model="donationInfo.userSeq"
    />
    <button @click="donate">기부ㄱㄱ</button>


</template>
  
  <script>
  import { mapActions, mapGetters } from "vuex";
  const donationStore = "donationStore";

  export default {
    name:"OrganizationListView",
    data() {
    return {
        donationInfo : {
          donationImgUrl: '',
          donationPay: '',
          donationText: '',
          foundationSeq: '',
          userSeq: '',
        }
      };
    },


    computed: {
      ...mapGetters(donationStore, [
        "organizationList",
        "organizationInfo",
        "organizationDonationList",
      ]),
    },


    methods: {
      ...mapActions(donationStore, [
        "doDonate",
      ]),

      donate() {
        console.log(this.donationInfo)
        this.doDonate(this.donationInfo)
      },

      changeImage(image) {
        // 업로드한 파일 보여주기
        // const reader = new FileReader();
        // reader.onload = (e) => {
        //   this.donationInfo.donationImgUrl = e.target.result;
        // }   

        this.donationInfo.donationImgUrl = URL.createObjectURL(image.target.files[0])
      }

    },


    created() {
    },


    mounted() {

    },  
  }
  </script>
  
  <style>
  
  </style>