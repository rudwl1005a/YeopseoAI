<template>
  <side-bar></side-bar>
  
  <br>
  <p class="profileText">Foundation List</p>
  
  <div id="carouselExampleIndicators" class="foundationCarousel carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
  
      <div class="carousel-item active">
        <div class="foundationCarouselIn d-flex">
          <img src="https://via.placeholder.com/150" class="foundationLogo" alt="...">
          <div class="foundationInfo">
            <div 
            class="remindButton"
            @click="setFoundationDonationList(organizationList[0].foundationSeq)"
            ><b>{{ organizationList[0].foundationName }}</b>이 받은 기부목록 보기
            </div>
            
            <div class="donationButton" @click="setFoundationInfo(organizationList[0].foundationSeq)">{{ organizationList[0].foundationContent }}</div>
            <div class="donationButton" @click="donation">기부하실?</div>
          </div>
        </div>  
      </div>
  
      <div class="carousel-item">
        <div class="foundationCarouselIn d-flex">
          <img src="https://via.placeholder.com/150" class="foundationLogo" alt="...">
          <div class="foundationInfo">
            <div 
            class="remindButton"
            @click="getFoundationDonationList(organizationList[0].foundationSeq)" 
            data-bs-toggle="modal" 
            data-bs-target="#exampleModal"
            ><b>{{ organizationList[0].foundationName }}</b>이 받은 기부목록 보기
            </div>
            <div class="donationButton" @click="setFoundationInfo(organizationList[0].foundationSeq)">{{ organizationList[0].foundationContent }}</div>
            <div class="donationButton" @click="donation">기부하실?</div>
          </div>
        </div>  
      </div>
  
      <div class="carousel-item">
        <div class="foundationCarouselIn d-flex">
          <img src="https://via.placeholder.com/150" class="foundationLogo" alt="...">
          <div class="foundationInfo">
            <div 
            class="remindButton"
            @click="getFoundationDonationList(organizationList[0].foundationSeq)" 
            data-bs-toggle="modal" 
            data-bs-target="#exampleModal"
            ><b>{{ organizationList[0].foundationName }}</b>이 받은 기부목록 보기
            </div>
            <div class="donationButton" @click="setFoundationInfo(organizationList[0].foundationSeq)">{{ organizationList[0].foundationContent }}</div>
            <div class="donationButton" @click="donation">기부하실?</div>
          </div>
        </div>  
      </div>
  
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  
  <!-- 상세모달 -->
  <div v-if="showModal" style="z-index: 9999; position: relative;">
    <foundation-modal style="position: fixed; top: 5%; left: 5%; z-index: 9999;">
    </foundation-modal>
    <div type="button" @click="setFoundationDonationList(organizationList[0].foundationSeq)" style="width: 4vw; height: 4vw; font-size: 7vw; top: 5%; left: 90vw; position: fixed; z-index: 10000;">X</div>
  </div>
  
  </template>
  
  <script>
  import { mapActions, mapGetters } from "vuex";
  import SideBar from "@/components/Nav/SideBar.vue";
  import FoundationModal from "@/components/Foundation/foundationModal.vue";
  const organizationStore = "organizationStore";
  
  export default {
    name:"OrganizationListView",
    data() {
    return {
      showModal: false,
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
      FoundationModal,
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
      async setFoundationDonationList(foundationSeq) {
        await this.getFoundationDonationList(foundationSeq)
        this.showModal = !this.showModal
        // 스토어에서 foundation_Seq 들고와서 넣어줘야됨
        // let modalBox = document.getElementById('modalBox')
        // let i = 0
        // this.organizationDonationList.forEach((donation) => {
        //     const randomAngle = Math.random() * (10) - 5
        //     const postcard = document.createElement('div')
        //     // postcard.setAttribute(':src', `${this.showImages[0].imageUrl}`)
        //     // postcard.style.backgroundImage = '../../../public/images/test6.jpg'
        //     postcard.style.backgroundImage = `url(${donation.donationImgUrl})`
        //     postcard.style.backgroundRepeat = 'no-repeat'
        //     postcard.style.backgroundSize = '100% 100%'
        //     postcard.style.position = 'absolute'
        //     postcard.style.top = `${10 + 6 * (parseInt(i/13)) + randomAngle/10}vw`
        //     postcard.style.left = `${6 + 6 * (i%13) + randomAngle/10}vw`
        //     postcard.style.width = '5vw'
        //     postcard.style.height = '5vw'
        //     postcard.style.boxShadow = '0 0.5vw 1vw rgba(0, 0, 0, 0.15)'
  

        //     postcard.style.transform = `rotate(${randomAngle}deg)`

        //     modalBox.appendChild(postcard)
        //     i = (i+1) % (13*5)
        // });
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
    width: 100vh;
    height: 50vh;
    box-sizing: border-box;
    box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
  }
  .foundationCarouselIn {
    margin: 0 auto;
    width: 100vh;
    height: 50vh;
  }
  .foundationLogo {
    display: inline;
    border-radius: 30px;
    margin: 0;
    padding: 3vh;
    width: 45vh;
    height: 45vh;
  }
  .foundationInfo {
    display: inline;
    margin: 0;
    padding: 3vh;
    width: 30vh;
    height: 45vh;
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
  
  /* .modal-dialog {
    max-width:150vh;
    width: 130vh;
    height: 90vh;
  }
  
  .donationListModal {
    width: 130vh;
    height: 90vh;
    background-color: white;
    border-radius: 10px;
    background-image: url(../../public/images/remind_wallpaper.jpg);
    background-repeat: no-repeat;
    background-size: 100% 100%;
  } */
  
  .donationButton {
    font-size: 3vw;
    font-family: 'Nanum Pen Script', cursive;;
    /* cursor : pointer; */
  }
  
  .carousel-control-prev-icon,
  .carousel-control-next-icon {
    height: 100px;
    width: 100px;
    outline: black;
    background-size: 100%, 100%;
    border-radius: 50%;
    background-image: none;
    z-index: 5000 !important;
  }
  
  .carousel-control-next-icon:after
  {
    content: '>';
    font-size: 5vw;
    color: rgb(63, 63, 63);
    z-index: 5000 !important;
  }
  
  .carousel-control-prev-icon:after {
    content: '<';
    font-size: 5vw;
    color: rgb(63, 63, 63);
    z-index: 5000 !important;
  }
  </style>