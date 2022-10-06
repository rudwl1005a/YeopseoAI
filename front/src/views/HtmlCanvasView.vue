<template>
<side-bar></side-bar>
<div class="canvasPage">
  <div v-if="showFin" @click="goMypage" class="finModal">
    등록 완료!!
    <!-- <div @click="showFinModal">닫기</div> -->
  </div>

  <!-- 도움말 모달 -->
  <div v-if="showHelp" @click="openHelp" class="helpModal2">
    <!-- <div class="helpCloseBtn" @click="openHelp">X</div> -->
    <div class="imageHelp3"></div>
    <div class="imageHelp4"></div>
    <div class="imageHelp5"></div>
    <div class="imageHelp6"></div>
    <div class="imageHelp7"></div>
  </div>

  <!-- 로딩 화면 -->
  <div v-if="loadopen" class="canvasLoadingScene">
    <div class="canvasLoadingContent"></div>
    <div class="canvasLoadingWrite">Loading . . .</div>
  </div>

  <canvas ref="canvas" id="canvasId" class="htmlCanvasClass"></canvas>
  
  <!-- 팔레트 -->
  <div class="colorPallet">
    <!-- 대분류 선택지 -->

    <!-- 건축물 -->
    <div class="spin2">
      <div @click="spin(0)" class="colorGunChook" :class="{ fronts : spins[0] , front : !spins[0]}"><p style="margin-left: 7vw;">건물</p></div>
      <!-- <div class="colorGunChook front">건물</div> -->
      <div @click="spin(0)" class="colorGunChook" :class="{ backs : !spins[0] , back : spins[0]}">
        <div class="colorBridge" @click="changeColorBridge">다리</div>
        <div class="colorWooltari" @click="changeColorWooltari">울타리</div>
        <div class="colorHouse" @click="changeColorHouse">집</div>
        <div class="colorPlatform" @click="changeColorPlatform">플랫폼</div>
        <div class="colorRoof" @click="changeColorRoof">지붕</div>
        <div class="colorBeukDol" @click="changeColorBeukDol">벽돌벽</div>
        <div class="colorDolBeuk" @click="changeColorDolBeuk">돌벽</div>
        <div class="colorTreeWall" @click="changeColorTreeWall">나무벽</div>
      </div>
    </div>

    <!-- 지면 -->
    <div class="spin2">
      <div @click="spin(1)" class="colorGunChook" :class="{ fronts : spins[1] , front : !spins[1]}"><p style="margin-left: 7vw;">지면</p></div>
      <div @click="spin(1)" class="colorGunChook" :class="{ backs : !spins[1] , back : spins[1]}">
        <div class="colorSoil" @click="changeColorSoil">흙</div>
        <div class="colorMiniDol" @click="changeColorMiniDol">자갈</div>
        <div class="colorEct" @click="changeColorEct">기타</div>
        <div class="colorMud" @click="changeColorMud">진흙</div>
        <div class="colorGoodRoad" @click="changeColorGoodRoad">포장도로</div>
        <div class="colorRoad" @click="changeColorRoad">도로</div>
        <div class="colorBigSoil" @click="changeColorBigSoil">모래</div>
      </div>
    </div>


    <!-- 풍경 -->
    <div class="spin2">
      <div @click="spin(2)" class="colorGunChook" :class="{ fronts : spins[2] , front : !spins[2]}"><p style="margin-left: 7vw;">풍경</p></div>
      <div @click="spin(2)" class="colorGunChook" :class="{ backs : !spins[2] , back : spins[2]}">
        <div class="colorCloud" @click="changeColorCloud">구름</div>
        <div class="colorFog" @click="changeColorFog">안개</div>
        <div class="colorHill" @click="changeColorHill">언덕</div>
        <div class="colorMountain" @click="changeColorMountain">산</div>
        <div class="colorRiver" @click="changeColorRiver">강</div>
        <div class="colorRock" @click="changeColorRock">바위</div>
        <div class="colorSea" @click="changeColorSea">바다</div>
        <div class="colorSky" @click="changeColorSky">하늘</div>
        <div class="colorSnow" @click="changeColorSnow">눈</div>
        <div class="colorDol" @click="changeColorDol">돌</div>
        <div class="colorWater" @click="changeColorWater">물</div>
      </div>
    </div>


    <!-- 식물 -->
    <div class="spin2">
      <div @click="spin(3)" class="colorGunChook" :class="{ fronts : spins[3] , front : !spins[3]}"><p style="margin-left: 7vw;">식물</p></div>
      <div @click="spin(3)" class="colorGunChook" :class="{ backs : !spins[3] , back : spins[3]}">
        <div class="colorBush" @click="changeColorBush">부쉬</div>
        <div class="colorFlower" @click="changeColorFlower">꽃</div>
        <div class="colorPool" @click="changeColorPool">풀</div>
        <div class="colorZip" @click="changeColorZip">짚</div>
        <div class="colorTree" @click="changeColorTree">나무</div>
        <div class="colorTreeColumn" @click="changeColorTreeColumn">나무기둥</div>
      </div>
    </div>




  </div>
  <!-- 도움말 띄우는 버튼 -->
  <div class="openHelpBtn2" @click="openHelp"></div>
  <div class="nowColor">선택중: {{ colorMap[color] }}</div>
  <!-- <div v-if="!fillType" @click="changeFillType">펜</div>
  <div v-if="fillType" @click="changeFillType">채우기</div> -->
  <div class="eraserClass" @click="eraser"></div>
  <!-- <div @click="changeFat">굵기 {{ lineFat }}</div> -->
  <select class="changeLineFat" v-model="lineFat">
    <option v-for="n in 50" :key="n" :value="n">
      {{ n }}
    </option>
  </select>
  <div class="eraseAll" @click="eraseAll">전체 삭제</div>

  <!-- modal1 띄우는 버튼 -->
  <div class="translateBtn" @click="openModal1">이미지 변환</div>

  <div v-if="opened1" class="opened2Modal">
    <div class="changePicTitle">
      원하는 화풍을 선택한 후 이미지 변환을 눌러주세요
    </div>
    <div class="changePicItems">
      <div :class="{'changePicItem':whichClicked[0] === false, 'changePickedItem':whichClicked[0] === true,}" @click="filterSelect(1)">고흐</div>
      <div :class="{'changePicItem':whichClicked[1] === false, 'changePickedItem':whichClicked[1] === true,}" @click="filterSelect(2)">고갱</div>
      <div :class="{'changePicItem':whichClicked[2] === false, 'changePickedItem':whichClicked[2] === true,}" @click="filterSelect(3)">갱갱</div>
      <div :class="{'changePicItem':whichClicked[3] === false, 'changePickedItem':whichClicked[3] === true,}" @click="filterSelect(4)">고고</div>
      <div :class="{'changePicItem':whichClicked[4] === false, 'changePickedItem':whichClicked[4] === true,}" @click="filterSelect(5)">ㅋㅋ</div>
    </div>
    <div class="goChangePic" @click="changeImage">이미지 변환</div>
    <div class="closeModal1" @click="closeModal1">창 닫기</div>
  </div>

  <!-- 엽서 결과 부분 모달로 넣자 -->
  <div v-if="opened2" class="opened2Modal">
    <div class="translatedResult">
      <div class="translatedImg">
        <img id="uploadFile" v-bind:src="'data:image/png;base64,'+aiTransformResult" alt="" style="width: 35vw; height: 70vh;">
      </div>

      <div class="tagCanvasPage">
        태그를 입력하세요
        <div class="tagInputCanvas">
          <input class="tagInputCanvasInput" type="text" v-model="tagItem" @keyup.enter="appendTag">
        </div>
        <div class="canvasTagCheck">
          <div class="canvasTagItem" v-for="(ta, index) in tag" :key="index" @click="deleteTag(index)">
            #{{ ta }},&nbsp;
          </div>
        </div>
      </div>

      <div class="tagRemoveInfo">태그를 클릭하면 지울 수 있어요!</div>
      <div class="resultSaveBtn" @click="upload">엽서 업로드</div>
      <div class="resultTitleBend" @click="closeModal2">창 닫기</div>
    </div>
  </div>
</div>
</template>

<script>
import SideBar from "@/components/Nav/SideBar.vue";
import html2canvas from 'html2canvas';
import { mapState, mapActions, mapGetters } from "vuex";
const accountStore = "accountStore";
const postcardStore = "postcardStore";


export default {
  name: "HtmlCanvasView",
  components: {
    SideBar,
  },
  data() {
    return {
      x: 0,
      y: 0,
      painting: false,
      ctx: "",
      color: "#a8c832",
      lineFat: 20,
      opened1: false,
      opened2: false,
      toWhatPic: "",
      tag: [],
      tagItem: "",
      resultimg: "",
      showFin: false,
      loadopen: false,
      nowErase: false,
      fillType: false, // 채우기 형식인지 아닌지를 보여줌
      showHelp: false, // 도움말을 보여주고 있는지 아닌지 확인
      whichClicked: [false, false, false, false, false],
      colorMap: {
        "#5e5bc5": "다리",
        "#706419": "울타리",
        "#7f4502": "집",
        "#8f2a91": "플랫폼",
        "#9600b1": "지붕",
        "#aad16a": "벽돌벽",
        "#ae2974": "돌벽",
        "#b0c1c3": "나무벽",
        "#6e6e28": "흙",
        "#7c32c8": "자갈",
        "#7d3054": "기타",
        "#87716f": "진흙",
        "#8b3027": "포장도로",
        "#946e28": "도로",
        "#999900": "모래",
        "#696969": "구름",
        "#77ba1d": "안개",
        "#7ec864": "언덕",
        "#869664": "산",
        "#9364c8": "강",
        "#956432": "바위",
        "#9ac6da": "바다",
        "#9ceedd": "하늘",
        "#9e9eaa": "눈",
        "#a1a164": "돌",
        "#b1c8ff": "물",
        "#606e32": "부쉬",
        "#760000": "꽃",
        "#7bc800": "풀",
        "#a2a3eb": "짚",
        "#a8c832": "나무",
        "#b57b00": "나무기둥",
      },
      filterCode: 1,
      spins: [
        true,
        true,
        true,
        true,
      ]
    }
  },
  computed: {
    ...mapState(postcardStore, ["justUploadedPostcard", "aiTransformResult"]),
    ...mapGetters(accountStore, ["userInfo"]),
  },
  methods: {
    ...mapActions(postcardStore, [
      "uploadPostcard", 
      "uploadTag",       
      "setFilterCode",
      "setBeforeTransformImg",
      "sendTransformStore",
    ]),
    spin(n) {
      this.spins[n] = !this.spins[n]
    },
    // 모달1 열기/닫기
    filterSelect(c) {
      this.filterCode = c
      this.setFilterCode(c)
      this.whichClicked = [false, false, false, false, false]; // 전부 false로 변경 후
      this.whichClicked[c-1] = true; // 선택한 요소만 true로 변경
    },
    openModal1() {
      this.opened1 = true;
    },
    closeModal1() {
      this.opened1 = false;
      this.loadopen = false; // 첫번째 모달 꺼주면서 로딩화면도 꺼주자. 로딩화면 꺼진 다음 두번째 모달이 열릴 것
    },

    // 모달2 열기/닫기
    openModal2() {
      this.opened2 = true;
    },
    closeModal2() {
      this.opened2 = false;
    },

    // 도움말 열기
    openHelp() {
      this.showHelp = !this.showHelp;
    },

    // 태그 넣기
    appendTag() {
      // this.tag.push(this.tagItem);
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

    // 로딩화면
    openLoading() {
      this.loadopen = true;
    },


    
    // 스케치와 화풍 선택 정보 전달
    async changeImage() {
      await console.log("hi");
      // 로딩화면 켜기
      await this.openLoading();

      console.log(document.getElementById("canvasId"));
      const canvas = document.getElementById("canvasId");
      // canvas.height = Math.floor(400*0.264583);
      // canvas.width = Math.floor(600*0.264583);
      console.log(canvas);
      console.log(canvas.toDataURL()); // data:image/png;base64,
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
      canvasData.append('postcard', tempFile); // 생성된 canvasData 정해진 uri로 axios 요청 보내면 될 듯

      // for (var pair of canvasData.entries()) {
      //   console.log(pair[0]+ ', ' + pair[1]); 
      // }
      // let tagList = ["하늘", "구름"];
      // console.log(canvasData);
      // let postcardObj = {
      //   userId: this.userInfo.userId,
      //   postcard: canvasData,
      // }
      console.log('=====================')
      console.log(this.filterCode)
      await this.sendTransformStore({ filterCode: this.filterCode, image: {image: canvasData }});
      // let tagObj = {
      //   postcardSeq: this.justUploadedPostcard.postcardSeq,
      //   tagList: tagList,
      // }
      // console.log(tagObj);
      // await this.uploadTag(tagObj);
      // console.log(this.userInfo.userId, tagList, canvasData);


      // 캔버스 부분을 formdata로 만들어 전송하는 로직 + 화풍 정보 전달하는 로직 필요
      // await 이용, 해당 formdata 전송이 완료된 후 다음 코드 실행되도록 ㄱ
      // 순서: 로딩화면 띄우는 함수 -> 데이터 전송 후 결과 받음 -> 로딩화면 끄는 함수 -> 두번째 모달로 이동하는 함수
      
      // canvas 데이터 및 선택한 화풍 정보 전송 함수

      await setTimeout(() => {
        this.closeModal1(); // 여기 로딩화면 끄는 부분도 포함되어 있음
      }, 1000);
      await this.openModal2();
    },

    // 엽서 업로드
    async upload() {
      // 로딩부분 추가
      await this.openLoading();
      console.log('업로드 함수 실행도ㅔ어요')
      //

      const element = document.getElementById("uploadFile");
      const canvas = await html2canvas(element);
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

      // 로딩부분 추가
      // await setTimeout(() => {
      //   this.closeModal1(); // 여기 로딩화면 끄는 부분도 포함되어 있음
      // }, 1000);
      await this.closeModal1();
      //
      await this.showFinModal();
    },

    goMypage() {
      this.showFin = !this.showFin;
      let userSeq = this.userInfo.userSeq;
      this.$router.push({path: `/mypage/${userSeq}`, query: {ownerSeq: userSeq}});
    },

    showFinModal() {
      this.showFin = !this.showFin;
    },

    dataURItoBlob(dataURI) {
      var binary = atob(dataURI.split(',')[1]);
      var array = [];
      for (var i = 0; i < binary.length; i++) {
        array.push(binary.charCodeAt(i));
      }
      return new Blob([new Uint8Array(array)], { type: 'image/png' });
    },

    // 색 채우기/펜 변경
    changeFillType() {
      this.fillType = !this.fillType;
    },

    fillPaint(event) {
      if (this.fillType === true) {
        console.log(event);
        this.ctx.fillStyle = this.color;
        console.log(this.color);
        this.ctx.fill();
      }
    },

    // 색 변경
    changeColorBridge() {
      this.color = "#5e5bc5";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(0)
    },
    changeColorWooltari() {
      this.color = "#706419";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(0)
    },
    changeColorHouse() {
      this.color = "#7f4502";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(0)
    },
    changeColorPlatform() {
      this.color = "#8f2a91";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(0)
    },
    changeColorRoof() {
      this.color = "#9600b1";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(0)
    },
    changeColorBeukDol() {
      this.color = "#aad16a";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(0)
    },
    changeColorDolBeuk() {
      this.color = "#ae2974";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(0)
    },
    changeColorTreeWall() {
      this.color = "#b0c1c3";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(0)
    },
    changeColorSoil() {
      this.color = "#6e6e28";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(1)
    },
    changeColorMiniDol() {
      this.color = "#7c32c8";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(1)
    },
    changeColorEct() {
      this.color = "#7d3054";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(1)
    },
    changeColorMud() {
      this.color = "#87716f";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(1)
    },
    changeColorGoodRoad() {
      this.color = "#8b3027";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(1)
    },
    changeColorRoad() {
      this.color = "#946e28";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(1)
    },
    changeColorBigSoil() {
      this.color = "#999900";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(1)
    },
    changeColorCloud() {
      this.color = "#696969";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorFog() {
      this.color = "#77ba1d";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorHill() {
      this.color = "#7ec864";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorMountain() {
      this.color = "#869664";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorRiver() {
      this.color = "#9364c8";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorRock() {
      this.color = "#956432";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorSea() {
      this.color = "#9ac6da";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorSky() {
      this.color = "#9ceedd";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorSnow() {
      this.color = "#9e9eaa";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorDol() {
      this.color = "#a1a164";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorWater() {
      this.color = "#b1c8ff";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(2)
    },
    changeColorBush() {
      this.color = "#606e32";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(3)
    },
    changeColorFlower() {
      this.color = "#760000";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(3)
    },
    changeColorPool() {
      this.color = "#7bc800";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(3)
    },
    changeColorZip() {
      this.color = "#a2a3eb";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(3)
    },
    changeColorTree() {
      this.color = "#a8c832";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(3)
    },
    changeColorTreeColumn() {
      this.color = "#b57b00";
      this.ctx.strokeStyle = this.color;
      this.nowErase = false; // 색 선택하면 지우개 끄자
      this.spin(3)
    },

    // 지우기
    eraser() {
      this.nowErase = !this.nowErase;
    },

    // 그리기
    onMouseMove(event) {
      // console.log(event);
      this.x = event.offsetX;
      this.y = event.offsetY;
      if (this.nowErase === true && this.painting === true) {
        this.ctx.clearRect(this.x, this.y, this.lineFat, this.lineFat);
      } else if (!this.painting) {
        this.ctx.beginPath();
        this.ctx.moveTo(this.x, this.y);
      } else {
        this.ctx.lineTo(this.x, this.y);
        this.ctx.stroke();
      }
    },
    onMouseDown(event) {
      console.log(event);
    },
    onMouseUp(event) {
      console.log(event);
      this.stopPainting();
    },
    stopPainting() {
      this.painting = false;
    },
    startPainting() {
      this.painting = true;
      this.tagItem = this.colorMap[this.color];
      this.appendTag();
    },

    // 지우기
    eraseAll() {
      // this.$router.go();
      let sizeWidth = 43 * window.innerWidth / 100;
      let sizeHeight = 80 * window.innerHeight / 100;
      this.ctx.clearRect(0, 0, sizeWidth, sizeHeight);
      // 모두 지웠으므로 태그 리스트 또한 비워주자
      this.tag = [];
    }
  },
  mounted() {
    const canvas = document.getElementById("canvasId");
    let sizeWidth = 43 * window.innerWidth / 100;
    // let sizeWidth = 600;
    let sizeHeight = 80 * window.innerHeight / 100;
    // let sizeHeight = 400;
    canvas.width = sizeWidth;
    canvas.height = sizeHeight;
    canvas.style.width = sizeWidth;
    canvas.style.height = sizeHeight;
    this.ctx = canvas.getContext('2d');
    this.ctx.filter = "url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxmaWx0ZXIgaWQ9ImZpbHRlciIgeD0iMCIgeT0iMCIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgY29sb3ItaW50ZXJwb2xhdGlvbi1maWx0ZXJzPSJzUkdCIj48ZmVDb21wb25lbnRUcmFuc2Zlcj48ZmVGdW5jUiB0eXBlPSJpZGVudGl0eSIvPjxmZUZ1bmNHIHR5cGU9ImlkZW50aXR5Ii8+PGZlRnVuY0IgdHlwZT0iaWRlbnRpdHkiLz48ZmVGdW5jQSB0eXBlPSJkaXNjcmV0ZSIgdGFibGVWYWx1ZXM9IjAgMSIvPjwvZmVDb21wb25lbnRUcmFuc2Zlcj48L2ZpbHRlcj48L3N2Zz4=#filter)";
    // this.ctx.strokeStyle = "#a8c832";
    this.ctx.strokeStyle = this.color;
    this.ctx.lineWidth = this.lineFat;
    this.ctx.imageSmoothingEnabled = false;
    this.ctx.mozImageSmoothingEnabled = false;
    this.ctx.oImageSmoothingEnabled = false;
    this.ctx.webkitImageSmoothingEnabled = false;
    this.ctx.msImageSmoothingEnabled = false;
    // ctx.fillStyle = 'green';
    // ctx.fillRect(10, 10, 150, 100);
    // this.ctx.filter = "none";
    if (canvas) {
      canvas.addEventListener("mousemove", this.onMouseMove);
      canvas.addEventListener("mousedown", this.startPainting);
      canvas.addEventListener("mouseup", this.stopPainting);
      canvas.addEventListener("mouseleave", this.stopPainting);
      canvas.addEventListener("click", this.fillPaint);
    }
  },
  watch: {
    lineFat() {
      // console.log(this.lineFat);
      this.ctx.lineWidth = this.lineFat;
    }
  }
}
</script>

<style>
/* 요청 보낸 후 띄워주는 로딩창 */
.canvasLoadingScene {
  position: absolute;
  z-index: 100;
  /* position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 100;
  height: 70vh;
  width: 70vw;
  background-color: #fcf4e0;
  box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px; */
  justify-content: center;
  align-items: center;
  width: 70vw;
  height: 80vh;
  top: 50%;
  left: 50%;
  background-color: #fcf4e0;
  box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
  border-radius: 30px;
  transform: translate(-50%, -50%);
  display: flex;
}

.changePickedItem {
  cursor: pointer;
  border-radius: 20px;
  width: 12vw;
  height: 40vh;
  background-color: white;
  /* box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.5); */
  transition: 0.1s;
}

.helpModal2 {
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

.helpModal2::-webkit-scrollbar {
  display: none;
}

.imageHelp3 {
  height: 80vh;
  width: 80vw;
  background-image: url("../../public/images/quesImage3.png");
  background-size: 80vw 80vh;
  background-repeat: no-repeat;
  border-radius: 30px;
}
.imageHelp4 {
  height: 80vh;
  width: 80vw;
  background-image: url("../../public/images/quesImage4.png");
  background-size: 80vw 80vh;
  background-repeat: no-repeat;
  border-radius: 30px;
}
.imageHelp5 {
  height: 80vh;
  width: 80vw;
  background-image: url("../../public/images/quesImage5.png");
  background-size: 80vw 80vh;
  background-repeat: no-repeat;
  border-radius: 30px;
}
.imageHelp6 {
  height: 80vh;
  width: 80vw;
  background-image: url("../../public/images/quesImage6.png");
  background-size: 80vw 80vh;
  background-repeat: no-repeat;
  border-radius: 30px;
}
.imageHelp7 {
  height: 80vh;
  width: 80vw;
  background-image: url("../../public/images/quesImage7.png");
  background-size: 80vw 80vh;
  background-repeat: no-repeat;
  border-radius: 30px;
}

.canvasLoadingContent {
  /* position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 30vh;
  height: 30vh;
  background-image: url("../../public/images/logo.png");
  background-size: 30vh 30vh;
  animation-name: switchingLogo;
  animation-iteration-count: infinite;
  animation-duration: 3s; */
  width: 30vh;
  height: 30vh;
  animation: rotate 2.5s infinite;
  background: linear-gradient(to right, rgb(90, 92, 231) 50%, #f16d6d 50%);
  background-size: 200% 100%;
  background-position:right bottom;
  transform: rotate(-90deg);
  border-radius: 15%;
}

@keyframes switchingLogo {
  from {
    top: 50%;
    left: 0%;
    transform: translate(-50% -50%) rotate(0deg);
  } to {
    top: 50%;
    left: 100%;
    transform: translate(-50% -50%) rotate(1080deg);
  }
}

@keyframes rotate{
  0%{ 
    background-position: right bottom;
  }
  50%{
    background-position: left bottom;
    transform: rotate(90deg);
  }
  100%{
    background-position: right bottom;
    transform: rotate(270deg);
  }
}

.openHelpBtn2 {
  cursor: pointer;
  position: absolute;
  top: 10%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 3vh;
  height: 3vh;
  background-image: url("../../public/images/questionMark.png");
  background-size: 3vh 3vh;
  background-repeat: no-repeat;
  opacity: 0.7;
}

.canvasLoadingWrite {
  position: absolute;
  top: 90%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 3vw;
}

/* 화풍 선택지 띄워주는 모달 */
/* opened2Modal 같이 이용 */
.changePicTitle {
  position: absolute;
  top: 8%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 2vw;
}

/* 이미지 변환 버튼(화풍 선택 모달) */
.goChangePic {
  position: absolute;
  top: 80%;
  left: 50%;
  transform: translate(-50%, -50%);
  height: 8vh;
  width: 12vw;
  cursor: pointer;
  border-radius: 20px;
  font-size: 2vw;
  color: #fcf4e0;
  background-color: #fd8a69;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  line-height: 8vh;
  vertical-align: middle;
  transition: 0.4s;
}

.closeModal1 {
  position: absolute;
  top: 90%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 5vw;
  height: 3vh;
  cursor: pointer;
  font-size: 1.2vw;
}

.goChangePic:hover {
  background-color: #e85b34;
}

.changePicItems {
  position: absolute;
  top: 40%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 65vw;
  height: 40vh;
  display: flex;
  justify-content: space-between;
}

.changePicItem {
  cursor: pointer;
  border-radius: 20px;
  width: 12vw;
  height: 40vh;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.5);
  transition: 0.1s;
}

.changePicItem:hover {
  /* background-color: #696969; */
}

.changePicItem:active {
  box-shadow: 0 0vh 0vh rgba(0, 0, 0, 0);
}



/* 엽서 변환 결과 보여주는 모달 */
.opened2Modal {
  z-index: 99;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 70vw;
  height: 80vh;
  background-color: #faf8f5;
  border-radius: 30px;
  box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
}

.canvasTagCheck {
  position: absolute;
  top: 20%;
  left: 80%;
  transform: translate(-50%, -50%);
}

.canvasPage {
  height: 100vh;
  width: 100vw;
  background-color: #faf8f5;
}

.htmlCanvasClass {
  position: absolute;
  top: 52%;
  left: 25%;
  transform: translate(-50%, -50%);
  background-color: #9ceedd;
  width: 43vw;
  height: 80vh;
  image-rendering: pixelated;
}

.nowColor {
  position: absolute;
  top: 65%;
  left: 70%;
  transform: translate(-50%, -50%);
  width: 8vw;
  height: 5vh;
  font-size: 1.5vw;
}

.eraserClass {
  position: absolute;
  cursor: pointer;
  top: 70%;
  left: 60%;
  transform: translate(-50%, -50%);
  width: 3vw;
  height: 5vh;
  background-image: url("../../public/images/erase.png");
  background-size: 3vw 5vh;
  background-repeat: no-repeat;
}

.eraserClass:hover {
  animation-name: switchErase;
  animation-iteration-count: infinite;
  animation-direction: alternate;
  animation-duration: 1s;
}

@keyframes switchErase {
  from {
    transform: translate(-50%, -50%) rotate(-15deg);
  } to {
    transform: translate(-50%, -50%) rotate(15deg);
  }
}

.changeLineFat {
  cursor: pointer;
  position: absolute;
  top: 70%;
  left: 70%;
  transform: translate(-50%, -50%);
  width: 5vw;
  height: 2vw;
  background-color: #faf8f5;
  font-size: 1.7vw;
  line-height: 2vw;
  vertical-align: middle;
}

.eraseAll {
  position: absolute;
  cursor: pointer;
  top: 70%;
  left: 80%;
  transform: translate(-50%, -50%);
  width: 6vw;
  height: 2vw;
  font-size: 1.5vw;
  line-height: 2vw;
  vertical-align: middle;
  transition: 0.4s;
  border-radius: 20px;
}

.eraseAll:hover {
  background-color: #696969;
  color: #fcf4e0;
}


.translateBtn {
  position: absolute;
  top: 80%;
  left: 70%;
  transform: translate(-50%, -50%);
  height: 8vh;
  width: 12vw;
  cursor: pointer;
  border-radius: 20px;
  font-size: 2vw;
  color: #fcf4e0;
  background-color: #fd8a69;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  line-height: 8vh;
  vertical-align: middle;
  transition: 0.4s;
}

.translateBtn:hover {
  background-color: #e85b34;
}

.translatedResult {

}

.translatedImg {
  position: absolute;
  width: 35vw;
  height: 70vh;
  transform: translate(-50%, -50%);
  top: 50%;
  left: 29%;
  background-color: #fcf4e0;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}

.resultSaveBtn {
  position: absolute;
  top: 80%;
  left: 75%;
  transform: translate(-50%, -50%);
  height: 8vh;
  width: 12vw;
  cursor: pointer;
  border-radius: 20px;
  font-size: 2vw;
  color: #fcf4e0;
  background-color: #fd8a69;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  line-height: 8vh;
  vertical-align: middle;
  transition: 0.4s;
}

.resultSaveBtn:hover {
  background-color: #e85b34;
}

.resultTitleBend {
  position: absolute;
  cursor: pointer;
  top: 90%;
  left: 75%;
  transform: translate(-50%, -50%);
  font-size: 1.5vw;
}

/* 팔레트 부분 */

.colorPallet {
  position: absolute;
  top: 35%;
  left: 70%;
  transform: translate(-50%, -50%);
  display: flex;
  flex-wrap: wrap;
  width: 40vw;
  height: 24vw;
  /* box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15); */
}

.spin2 {
  cursor: pointer;
  width: 20vw;
  height: 12vw;
  margin: 0;
  perspective: 500px;
  line-height: 12vw;
  vertical-align: middle;
  font-size: 4vw;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}


.spin2 .colorGunChook {
  backface-visibility: hidden;
  transition: 0.4s;
}

.spin2 .colorGunChook.fronts {
  transform: rotateY(0deg);
}

.colorGunChook.front {
  backface-visibility: hidden;
  transform: rotateY(180deg);
}

.spin2 .colorGunChook.back {
  backface-visibility: hidden;
  transform: rotateY(-180deg);
}

.colorGunChook.backs {
  transform: rotateY(0deg);
}

.spin2:hover .colorGunChook.fronts  {
  transform: scale(1.03)
}

.chooseG {
  width: 20vw;
  height: 12vw;
  line-height: 12vw;
  vertical-align: middle;
}

.chooseJ {
  width: 20vw;
  height: 12vw;
  line-height: 12vw;
  vertical-align: middle;
}
.chooseGr {
  width: 20vw;
  height: 12vw;
  line-height: 12vw;
  vertical-align: middle;
}
.chooseP {
  width: 20vw;
  height: 12vw;
  line-height: 12vw;
  vertical-align: middle;
}

.colorGunChook {
  position: absolute;
  /* left: 4vw; */
  width: 20vw;
  height: 12vw;
  display: flex;
  flex-wrap: wrap;
  /* box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15); */
  /* background-color: #faf8f5; */
  overflow: hidden;
  transition: 0.4s;
}

.colorJiMyun {
  position: absolute;
  width: 20vw;
  height: 12vw;
  transform: translate(-50%, -50%);
  display: flex;
  flex-wrap: wrap;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  background-color: #faf8f5;
  overflow: hidden;
}

.colorGrandScape {
  position: absolute;
  width: 20vw;
  height: 12vw;
  transform: translate(-50%, -50%);
  display: flex;
  flex-wrap: wrap;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  background-color: #faf8f5;
  overflow: hidden;
}

.colorPlant {
  position: absolute;
  width: 20vw;
  height: 12vw;
  transform: translate(-50%, -50%);
  display: flex;
  flex-wrap: wrap;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  background-color: #faf8f5;
  overflow: hidden;
}

/* 태그 관련 */
.tagCanvasPage {
  position: absolute;
  width: 20vw;
  height: 40vh;
  top: 30%;
  left: 75%;
  transform: translate(-50%, -50%);
  border-radius: 20px;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}

.tagInputCanvasInput {
  position: absolute;
  top: 17%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 10vw;
  height: 4vh;
}

.tagRemoveInfo {
  position: absolute;
  top: 60%;
  left: 75%;
  transform: translate(-50%, -50%);
  font-size: 1.5vw;
}

.canvasTagCheck {
  position: absolute;
  padding: 1vw;
  display: flex;
  flex-wrap: wrap;
  align-content: flex-start;
  width: 15vw;
  height: 25vh;
  top: 60%;
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 20px;
  overflow: auto;
  font-size: 1.4vw;
}

.canvasTagCheck::-webkit-scrollbar {
  display: none;
}

.canvasTagItem {
  border-radius: 5px;
  cursor: pointer;
}

.canvasTagItem:hover {
  background-color: rgb(176, 173, 173);
}

.colorBridge {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #5e5bc5;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorWooltari {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #706419;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorHouse {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #7f4502;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorPlatform {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #8f2a91;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorRoof {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #9600b1;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorBeukDol {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #aad16a;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorDolBeuk {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #ae2974;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorTreeWall {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #b0c1c3;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorSoil {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #6e6e28;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorMiniDol {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #7c32c8;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorEct {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #7d3054;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorMud {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #87716f;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorGoodRoad {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #8b3027;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorRoad {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #946e28;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorBigSoil {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #999900;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorCloud {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #696969;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorFog {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #77ba1d;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorHill {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #7ec864;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorMountain {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #869664;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorRiver {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #9364c8;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorRock {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #956432;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorSea {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #9ac6da;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorSky {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #9ceedd;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorSnow {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #9e9eaa;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorDol {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #a1a164;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorWater {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #b1c8ff;
  border-radius: 5px;
  margin: 0.5vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorBush {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #606e32;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorFlower {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #760000;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorPool {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #7bc800;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorZip {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #a2a3eb;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorTree {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #a8c832;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
.colorTreeColumn {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #b57b00;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.2vw;
  color: white;
}
</style>