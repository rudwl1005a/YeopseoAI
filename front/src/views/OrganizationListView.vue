<template>

<!-- 재단이 받은 기부목록 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="position: relative;">
    <div class="donationListModal">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
  </div>
</div>



<side-bar></side-bar>
<div>기부단체 목록 화면임</div>
<div :onclick="donation">기부하실?</div>
<div @click="setFoundationInfo(organizationList[0].foundationSeq)">{{ organizationList[0].foundationContent }}</div>
<div 
@click="getFoundationDonationList(organizationList[0].foundationSeq)" 
data-bs-toggle="modal" 
data-bs-target="#exampleModal"
>
<b>{{ organizationList[0].foundationName }}</b>이 받은 기부목록 보기</div>

<div class="organizationClass">
  <div class="mainLogoClass">
    <h1>엽AI사전</h1>
  </div>
  <b style="font-size: 1.5vw; bold">기부재단</b>
  <br>
  <div class="followOrganization">
    <div class="c-title02">
    </div>
    <div class="organizationList">

        <div class="organizationItem">
        
        </div>

    </div>
  </div>        
</div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue";
const organizationStore = "organizationStore";

export default {
  name:"OrganizationListView",
  data() {
  return {
  };
  },

  components: {
    SideBar,
  },

  computed: {
    ...mapGetters(organizationStore, [
      "organizationList",
      "organizationInfo",
      "organizationDonationList",
    ]),
  },


  methods: {
    ...mapActions(organizationStore, [
      "getFoundationInfo",
      "getFoundationList",
      "getFoundationDonationList",
    ]),

    donation() {
      this.$router.push('/donation')
    },

    // 재단 인포 들고오기
    setFoundationInfo(foundationSeq) {
      console.log(foundationSeq)
      // 스토어에서 foundation_Seq 들고와서 넣어줘야됨
      this.getFoundationInfo(foundationSeq)
    },

    // 재단이 받은 엽서 리스트 들고오기
    setFoundationDonationList(foundationSeq) {
      // 스토어에서 foundation_Seq 들고와서 넣어줘야됨
      this.getFoundationDonationList(foundationSeq)
    },
  },



  created() {
    // 재단 목록 가져오기
    this.getFoundationList()
  },

  mounted() {

  },  
}
</script>

<style>
.organizationClass {
  position: relative;
  height: 100%;
  background-color: #faf8f5;
}

.followOrganization {
  margin: 0 auto;
  padding: 0 5vh;
  max-width: 1220px;
}

.organizationList {
  display: flex;
  justify-content: space-between;
  justify-content: space-between;
  max-width: 890px;
  margin: 40px auto 0;
}

.organizationItem {
  background: #fff;
  border-radius: 30px;
  padding: 40px 40px 35px;
  width: 47.2%;
  box-sizing: border-box;
}

.modal-dialog {
  max-width:100vw;
  width: 90vw;
  height: 90vh;
}

.donationListModal {
  width: 90vw;
  height: 90vh;
  background-color: white;
  border-radius: 10px;
  background-image: url(../../public/images/remind_wallpaper.jpg);
  background-repeat: no-repeat;
  background-size: 100% 100%;
}

</style>