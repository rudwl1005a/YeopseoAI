<template>
    
    <!-- 재단이 받은 기부목록 모달 -->
    <!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
      <!-- <div class="modal-dialog" style="position: relative;"> -->
      <!-- <div class="modal-dialog">
        <div class="modal-content"> -->
            <div id="modalBox" data-aos="fade-up" data-aos-duration="500" class="donationListModal d-flex row">
                <div style="width: 100vw; height: 4vw; font-size: 3vw; left: -25vw; top: 2vw; position: absolute;">받은 기부 총액: {{organizationModalInfo.totalDonationMoney}}원</div>
                <div style="width: 100vw; height: 4vw; font-size: 3vw; left: -25vw; top: 5vw; position: absolute;">받은 기부 횟수: {{organizationModalInfo.totalDonationCnt}}회</div>
                <!-- <div class="donationButton">{{ organizationList[0].foundationContent }}</div> -->
                <!-- <div class="donationButton">{{ seeingFoundation.foundationName }}</div> -->
                <!-- <div class="donationButton">{{ seeingFoundation.foundationContent }}</div> -->
                <div style="width: 10vw; height: 4vw; font-size: 3vw; left: 81vw; top: 40vw; position: absolute; cursor : pointer;" data-bs-dismiss="modal" aria-label="Close" @click="donation">기부하기</div>
            </div>
        <!-- </div>
      </div>
    </div> -->



</template>

<script>
import { mapActions, mapGetters } from "vuex";
const organizationStore = "organizationStore";

export default {
    name:"foundationModal",
    props: {
        seeingFoundation: Object,
    },
    data() {
    return {
    foundations: [
        ``
    ],
    showImages: [
        {
            imageUrl: require("../../../public/images/test1.jpg")
        },
        {
            imageUrl: require("../../../public/images/test1.jpg")
        },
        {
            imageUrl: require("../../../public/images/test2.jpg")
        },
        {
            imageUrl: require("../../../public/images/test3.jpg")
        },
        {
            imageUrl: require("../../../public/images/test4.jpg")
        },
        {
            imageUrl: require("../../../public/images/test5.jpg")
        },
        {
            imageUrl: require("../../../public/images/test6.jpg")
        },
        ],
    
    testImages: [
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E','https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E','https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E','https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E','https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
        'https://t1.daumcdn.net/cfile/tistory/995343395B2B88F01E',
    ]
    };
    },

    components: {
    },

    computed: {
    ...mapGetters(organizationStore, [
        "organizationList",
        "organizationInfo",
        "organizationDonationList",
        "organizationModalInfo",
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
    },



    created() {
    // 재단 기부 목록 가져오기
    },
    mounted() {
        let modalBox = document.getElementById('modalBox')
        let i = 0
        this.organizationDonationList.forEach((donation) => {
            // console.log(donation.donationImgUrl)
            const randomAngle = Math.random() * (10) - 5
            const postcard = document.createElement('div')
            // postcard.setAttribute(':src', `${this.showImages[0].imageUrl}`)
            // postcard.style.backgroundImage = '../../../public/images/test6.jpg'
            postcard.style.backgroundImage = `url(${donation.donationImgUrl})`
            postcard.style.backgroundRepeat = 'no-repeat'
            postcard.style.backgroundSize = '100% 100%'
            postcard.style.position = 'absolute'
            postcard.style.top = `${10 + 6 * (parseInt(i/13)) + randomAngle/10}vw`
            postcard.style.left = `${6 + 6 * (i%13) + randomAngle/10}vw`
            postcard.style.width = '5vw'
            postcard.style.height = '5vw'
            postcard.style.boxShadow = '0 0.5vw 1vw rgba(0, 0, 0, 0.15)'
  

            postcard.style.transform = `rotate(${randomAngle}deg)`

            modalBox.appendChild(postcard)
            i = (i+1) % (13*5)
        });
    },  
}
</script>

<style>

.modal-dialog {
    /* position: fixed; */
    /* margin: 0 auto; */
    max-width:90vw;
    /* width: 90vw; */
    height: 45vw;
    overflow: hidden;
}

.donationListModal {
    position: relative;
    width: 91vw;
    height: 45vw;
    background-color: white;
    border-radius: 10px;
    /* background-image: url(../../../public/images/remind_wallpaper.jpg); */
    background-repeat: no-repeat;
    background-size: 100% 100%;
    box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}
</style>