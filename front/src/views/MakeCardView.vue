<template>
<side-bar></side-bar>
  <div>MakeCard</div>
  <div @click="goCanvas">엽서 디자인 화면으로</div>
  <input type="file" accept="image/*" @change="changeImage" />
  <img style="width: 30vw; height: 20vh" :src="showPostcard" alt="">
  <div :onclick="upload">엽서ㄱㄱ?</div>
</template>
  
<script>
import AOS from 'aos';
import "aos/dist/aos.css";
import SideBar from "@/components/Nav/SideBar.vue";
import { mapActions, mapGetters } from "vuex";
const accountStore = "accountStore";
const postcardStore = "postcardStore";


export default {
  name: "MakeCardView",

  components: {
    SideBar,
  },

  data() {
    return {
      postcardInfo: {
        postcard: '', 
        tag: ['따뜻한'], 
        userId: '12',
      },
      showPostcard: '',
    };
  },


  computed: {
    ...mapGetters(postcardStore, [
      "uploadedPostcard",
      "postcardInfo",
      "deletePostcard",
      "userLikePostcard",
      "userUnlikePostcard",
      "postcardList",
      "popularPostcardList",
    ]),
    ...mapGetters(accountStore, [
      "userInfo",
      "token",
    ]),
  },


  methods: {
    ...mapActions(postcardStore, [
      "uploadPostcard",
      "getPostcardInfo",
      "deletePostcard",
      "userLikePostcard",
      "userUnlikePostcard",
      "postcardList",
      "popularPostcardList",
    ]),

    // 엽서 업로드
    // postcardInfo = {postcard: 이미지파일, tag: [태그리스트], userId: 'string',}
    upload() {
      // console.log(Uint8Array String(this.postcardInfo.postcard.length.prototype))
      // console.log(Uint8Array.prototype.toString(this.postcardInfo.postcard))
      
      console.log('보내는 이미지')
      console.log(this.postcardInfo.postcard)
      this.uploadPostcard(this.postcardInfo)
    },

    changeImage(image) {
      // 업로드한 파일 보여주기
      // const reader = new FileReader();
      // reader.onload = (e) => {
      //   this.donationInfo.donationImgUrl = e.target.result;
      // }

      var f = image.target.files[0];
      var r = new FileReader();
      r.onload = (e) => {
         
        this.postcardInfo.postcard = this.convertDataURIToBinary(e.target.result);
        // this.postcardInfo.postcard = toString(this.convertDataURIToBinary(e.target.result));
      };
      r.readAsDataURL(f);
      // this.postcardInfo.postcard = f
      this.showPostcard = URL.createObjectURL(image.target.files[0])
    },

    convertDataURIToBinary(dataURI) {
      var BASE64_MARKER = ';base64,';
      var base64Index = dataURI.indexOf(BASE64_MARKER) + BASE64_MARKER.length;
      var base64 = dataURI.substring(base64Index);
      var raw = window.atob(base64);
      var rawLength = raw.length;
      var array = new Uint8Array(new ArrayBuffer(rawLength));

      for (var i = 0; i < rawLength; i++) {
        array[i] = raw.charCodeAt(i);
      }
      return array;
    },


    goCanvas() {
      this.$router.push("/canvasTest");
    },
  },


  created() {
    AOS.init()    
  },


  mounted() {
    
  },
}
  </script>
  
  <style>
  
  </style>
