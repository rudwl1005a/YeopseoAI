<template>

<!-- 재단이 받은 기부목록 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="position: relative;">
    <div class="donationListModal">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
  </div>
</div>

<side-bar></side-bar>slide

  <br>
  <p class="profileText">Foundation List</p>

  <!-- 캐러셀 -->
  <div id="carouselExampleIndicators" class="foundationCarousel carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner row justify-content-around">

      <div class="item active">
        <img class="d-block w-50" src="https://via.placeholder.com/150" alt="First slide">
        <div class="carousel-caption d-none d-md-block">
          <h5>...</h5>
          <p>...</p>
        </div>
      </div>


      <div class="item">
        <img class="d-block w-100" src="https://via.placeholder.com/150" alt="Second slide">
        <div class="carousel-caption d-none d-md-block">
          <h5>...</h5>
          <p>...</p>
        </div>
      </div>


      <div class="item">
        <img class="d-block w-100" src="https://via.placeholder.com/150" alt="Third slide">
                  <div class="carousel-caption d-none d-md-block">
          <h5>...</h5>
          <p>...</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>


  <!--  -->
  <div class="foundationList">
    
    <div class="myProfileBox row justify-content-around">

      <div class="foundationLogo align-self-center">
      </div>

      <div class="foundationInfo align-self-center row justify-content-center">
        <h1>{{ organizationList[0].foundationName }}</h1>
        <h1>{{ organizationList[0].foundationContent }}</h1>
      </div>

    </div>
  </div>
  <br>


    <!-- 좋아하는 엽서 목록 부분 -->
  <div 
  class="remindButton"
  @click="getFoundationDonationList(organizationList[0].foundationSeq)" 
  data-bs-toggle="modal" 
  data-bs-target="#exampleModal"
  ><b>{{ organizationList[0].foundationName }}</b>이 받은 기부목록 보기</div>
  <br>

  <div class="donationButton" @click="donation">기부하실?</div>
  <div @click="setFoundationInfo(organizationList[0].foundationSeq)">{{ organizationList[0].foundationContent }}</div>

</template>

<script>
import { mapActions, mapGetters } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue";
const organizationStore = "organizationStore";

export default {
  name:"OrganizationListView",
  data() {
  return {
    foundations: [
      ``
    ],
    showImages: [
        {
          imageUrl: require("../../public/images/test1.jpg")
        },
        {
          imageUrl: require("../../public/images/test2.jpg")
        },
        {
          imageUrl: require("../../public/images/test3.jpg")
        },
        {
          imageUrl: require("../../public/images/test4.jpg")
        },
        {
          imageUrl: require("../../public/images/test5.jpg")
        },
        {
          imageUrl: require("../../public/images/test6.jpg")
        },
      ],
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
.foundationList {
  margin: 0 auto;
  padding: 0 5vw;
  width: 100vw;
}
.foundationCarousel {
  background: whitesmoke;
  margin: 0 auto;
  border-radius: 30px;
  padding: 3vh;
  width: 60vw;
  height: 50vh;
  box-sizing: border-box;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}
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

.donationButton {
  font-size: 3vw;
  font-family: 'Nanum Pen Script', cursive;;
  cursor : pointer;
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
  height: 100px;
  width: 100px;
  outline: black;
  background-size: 100%, 100%;
  border-radius: 50%;
  background-image: none;
}

.carousel-control-next-icon:after
{
  content: '>';
  font-size: 5vw;
  color: rgb(63, 63, 63);
}

.carousel-control-prev-icon:after {
  content: '<';
  font-size: 5vw;
  color: rgb(63, 63, 63);
}
</style>