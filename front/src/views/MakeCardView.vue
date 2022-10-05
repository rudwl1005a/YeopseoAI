<template>
<side-bar></side-bar>
<div class="letterMakeClass">

  <!-- 등록 완료 모달 -->
  <!-- <div v-if="showFin" class="finModal"> -->
  <div v-if="showFin" @click="showFinModal" class="finModal">
    등록 완료!!
    <!-- <div @click="showFinModal">닫기</div> -->
  </div>

  <!-- 도움말 모달 -->
  <div v-if="showHelp" class="helpModal">
    <div class="helpCloseBtn" @click="openHelp">X</div>
    <div class="imageHelp1"></div>
    <div class="imageHelp2"></div>
  </div>

  <!-- 크게 2개의 div를 보여줄 예정 -->
  <div class="makecardClass">
    <!-- 파일 직접 업로드하는 화면. 여기선 해당 이미지를 바로 업로드하는 로직을 넣어야 함. 변환 X -->
    <div v-if="!showFileUpload" class="goMakecardPage" @click="goMakecard">
      <div class="goCanvasTitle">사진 업로드</div>
    </div>
    <div v-if="showFileUpload" class="makecardFileUpload">
      <!-- <div class="tagCheck">입력중인 태그: {{ tag }}</div> -->
      <div class="tagCheck" @click="openTagInput">
        Tag
        <div class="imgUploadTag" v-for="(ta, index) in tag" :key="index" @click="deleteTag(index)">
          #{{ ta }}
        </div>
      </div>
      <div class="tagClickInfo">Click-삭제</div>
      <label for="file">
        이미지 업로드
        <div class="makecardLoading"></div>
      </label>
      <input id="file" type="file" accept="image/*" @change="changeImage" />
      <div class="showImageClass">
        <img id="uploadFile" v-if="showImage" style="width: 20vw; height: 40vh" :src="showPostcard" alt="">
      </div>

      <!-- 태그 입력 모달 -->
      <div class="tagInputClass">
        <div style="cursor: pointer;" @click="openTagInput">Tag를 입력해주세요</div>
        <input class="tagInputInput" v-model="tagItem" type="text" @keyup.enter="appendTag">
      </div>

      <!-- 도움말 띄우는 버튼 -->
      <div class="openHelpBtn" @click="openHelp"></div>

      <!-- <div v-if="showImage" class="uploadFileYeupBtn" :onclick="upload">엽서ㄱㄱ?</div> -->
      <div v-if="showImage" class="uploadFileYeupBtn" :onclick="upload">등록!</div>
      <!-- 아래 div 클릭하면 태그 입력 가능한 모달 띄우자 -->
      <!-- <div class="inputTag" @click="openTagInput">태그 입력</div> -->
    </div>
    <!-- 엽서 디자인 화면으로 보내는 화면 -->
    <div class="goCanvasPage" @click="goCanvas">
      <div class="goCanvasTitle">직접 그려서</div>
    </div>
  </div>
</div>
</template>
  
<script>
import AOS from 'aos';
import "aos/dist/aos.css";
import SideBar from "@/components/Nav/SideBar.vue";
import { mapState, mapActions, mapGetters } from "vuex";
import html2canvas from 'html2canvas';
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
      showFileUpload: false,
      showImage: false,
      tagModal: false,
      tag: [],
      tagItem: "",
      showFin: false,
      showHelp: false,
    };
  },


  computed: {
    ...mapState(postcardStore, ["justUploadedPostcard"]),
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
      "uploadTag",
      "uploadedPostcard",
    ]),
    // 선택지 선택 후 화면 로드 관련
    goMakecard() {
      this.showFileUpload = true;
    },

    appendTag() {
      console.log(this.tagItem);
      if (!this.tag.includes(this.tagItem)) {
        this.tag.unshift(this.tagItem);
        this.tagItem = "";
      }
      this.tagItem = "";
      console.log(this.tag);
    },

    // 태그 빼기
    deleteTag(idx) {
      this.tag.splice(idx, 1);
    },

    openTagInput() {
      this.tagModal = !this.tagModal;
    },

    showFinModal() {
      this.showFin = !this.showFin;
    },

    // 도움말 열기
    openHelp() {
      this.showHelp = !this.showHelp;
    },

    // 엽서 업로드
    // postcardInfo = {postcard: 이미지파일, tag: [태그리스트], userId: 'string',}
    async upload() {
      // console.log(Uint8Array String(this.postcardInfo.postcard.length.prototype))
      // console.log(Uint8Array.prototype.toString(this.postcardInfo.postcard))
      
      // console.log('보내는 이미지')
      // console.log(this.postcardInfo.postcard)
      // this.uploadPostcard(this.postcardInfo)
      const element = document.getElementById("uploadFile");
      const canvas = await html2canvas(element); // html to canvaszz
      // console.log(canvas);
      // console.log("===============");
      // console.log(canvas)
      const dataUrl = canvas.toDataURL("image/png");
      const blobData = this.dataURItoBlob(dataUrl);
      // 날짜
      const now = new Date();
      // 파일 이름
      const filename = `yeupseo-${this.userInfo.userSeq}${now.getHours()}${now.getMinutes()}${now.getSeconds()}.png` 
      // 파일 만들기
      const tempFile = new File([blobData], filename, { type: 'image/png' });
      // 폼데이터
      let canvasData = new FormData;
      canvasData.append('postcard', tempFile);

      let postcardObj = {
        userId: this.userInfo.userId,
        postcard: canvasData,
      }
      await this.uploadPostcard(postcardObj);
      let tagObj = {
        postcardSeq: this.justUploadedPostcard.postcardSeq,
        tagList: this.tag,
      }

      await this.uploadTag(tagObj);
      await this.showFinModal();
    },

    dataURItoBlob(dataURI) {
      var binary = atob(dataURI.split(',')[1]);
      var array = [];
      for (var i = 0; i < binary.length; i++) {
        array.push(binary.charCodeAt(i));
      }
      return new Blob([new Uint8Array(array)], { type: 'image/png' });
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
      this.showImage = true;
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
      this.$router.push("/canvasNew");
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
.openHelpBtn {
  cursor: pointer;
  position: absolute;
  top: -45%;
  left: 10%;
  transform: translate(-50%, -50%);
  width: 3vh;
  height: 3vh;
  background-image: url("../../public/images/questionMark.png");
  background-size: 3vh 3vh;
  background-repeat: no-repeat;
  opacity: 0.7;
}

.imageHelp1 {
  height: 80vh;
  width: 80vw;
  background-image: url("../../public/images/quesImage1.png");
  background-size: 80vw 80vh;
  background-repeat: no-repeat;
  border-radius: 30px;
}
.imageHelp2 {
  height: 80vh;
  width: 80vw;
  background-image: url("../../public/images/quesImage2.png");
  background-size: 80vw 80vh;
  background-repeat: no-repeat;
  border-radius: 30px;
}

.imgUploadTag {

}

.imgUploadTag:hover {
  background-color: #c5c3c2;
  border-radius: 20px;
}

.tagCheck {
  position: absolute;
  cursor: pointer;
  top: 65%;
  left: 10%;
  transform: translate(-50%, -50%);
  width: 5vw;
  height: 15vh;
  background-color: white;
  border-radius: 10px;
  overflow: auto;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  transition: 0.2s;
}

.tagCheck::-webkit-scrollbar {
  display: none;
}

/* .tagCheck:active {
  width: 8vh;
  height: 12vh;
  background-color: #929190;
} */

.tagClickInfo {
  position: absolute;
  width: 10vh;
  top: 95%;
  left: 10%;
  transform: translate(-50%, -50%);
  font-size: 1.2vw;
}

.tagInputClass {
  z-index: 10;
  position: absolute;
  top: -50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 1.5vw;
  height: 10vh;
  width: 15vw;
}

.tagInputInput {
  border: none;
  width: 15vw;
  height: 4vh;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}

.finModal {
  z-index: 100;
  position: absolute;
  cursor: pointer;
  height: 15vh;
  width: 20vw;
  top: 20%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  border-radius: 20px;
  font-size: 2vw;
  line-height: 15vh;
  vertical-align: middle;
  box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
}

.letterMakeClass {
  height: 100vh;
  width: 100vw;
  background-color: #faf8f5;
}

.showImageClass {
  position: absolute;
  top: 30%;
  left: 50%;
  height: 40vh;
  width: 20vw;
  transform: translate(-50%, -50%);
  border-radius: 20px;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  background-color: white;
}

.makecardFileUpload label {
  position: absolute;
  top: 120%;
  left: 50%;
  transform: translate(-50%, -50%);
  height: 10vh;
  width: 15vw;
  cursor: pointer;
  border-radius: 20px;
  font-size: 3vw;
  color: #fcf4e0;
  background-color: #fd8a69;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  line-height: 10vh;
  vertical-align: middle;
  transition: 0.4s;
}

.makecardLoading {
  position: absolute;
  top: -12%;
  left: -7%;
  height: 5vh;
  width: 5vh;
  background-image: url("../../public/images/loadingCircle.png");
  background-size: 5vh 5vh;
  background-repeat: no-repeat;
  transform: rotate(0deg);
}

.makecardFileUpload label:hover > .makecardLoading {
  transition: 1000s;
  transform: rotate(288000deg);
}

.makecardFileUpload label:hover {
  background-color: #e85b34;
}

.makecardFileUpload input[type="file"] {
  position: absolute;
  width: 0;
  height: 0;
  overflow: hidden;
  border: 0;
}

.uploadFileYeupBtn {
  position: absolute;
  top: 20%;
  left: 10%;
  transform: translate(-50%, -50%);
  cursor: pointer;
  height: 10vh;
  width: 10vh;
  border-radius: 20px;
  background-color: #fd8a69;
  color: #faf8f5;
  font-size: 4vh;
  line-height: 10vh;
  vertical-align: middle;
  transition: 0.4s;
}

.uploadFileYeupBtn:hover {
  background-color: #e85b34;
}

.inputTag {
  cursor: pointer;
  height: 5vh;
  width: 10vw;
  border: 1px solid black;
}

.makecardClass {
  display: flex;
  position: absolute;
  height: 70vh;
  width: 80vw;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
}

.makecardFileUpload {
  position: absolute;
  top: 50%;
  left: 25%;
  transform: translate(-50%, -50%);
  height: 35vh;
  width: 40vw;
}

.goCanvasPage {
  position: absolute;
  right: 0%;
  height: 70vh;
  width: 40vw;
  transition: 0.2s;
  border-radius: 30px;
}

.goMakecardPage {
  position: absolute;
  left: 27%;
  transform: translate(-50%, 0%);
  height: 70vh;
  width: 40vw;
  transition: 0.2s;
  border-radius: 30px;
}

.goCanvasPage:hover {
  background-color: antiquewhite;
}

.goMakecardPage:hover {
  background-color: antiquewhite;
}

.goCanvasTitle {
  font-size: 10vw;
  line-height: 70vh;
  vertical-align: middle;
}

/* 이미지 업로드 부분 도움말 */
.helpModal {
  z-index: 100;
  position: absolute;
  height: 80vh;
  width: 80vw;
  top: 50%;
  left: 50%;
  background-color: white;
  transform: translate(-50%, -50%);
  border-radius: 30px;
  box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
  overflow: auto;
}

.helpModal::-webkit-scrollbar {
  display: none;
}

.helpCloseBtn {
  cursor: pointer;
  position: fixed;
  top: 10%;
  left: 95%;
  transform: translate(-50%, -50%);
  font-size: 5vw;
}
</style>