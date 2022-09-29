<template>
  <div class="flex-row">
    <div class="source">
      <p>Canvas:</p>
      <vue-drawing-canvas
        ref="VueCanvasDrawing"
        :image="image"
        :width="600"
        :height="400"
        :stroke-type="strokeType"
        :line-cap="lineCap"
        :line-join="lineJoin"
        :fill-shape="fillShape"
        :eraser="eraser"
        :lineWidth="line"
        :color="color"
        :background-color="backgroundColor"
        :background-image="backgroundImage"
        :watermark="watermark"
        :initial-image="initialImage"
        saveAs="png"
        :styles="{
          border: 'solid 1px #000',
        }"
        :lock="disabled"
        @mousemove="getCoordinate($event)"
        :additional-images="additionalImages"
      />

      <!-- 긋고 있는 좌표 보여주는 부분. 필요 없을 것 같아서 주석처리 -->
      <!-- <p>
        X-axis: <strong>{{ x }}</strong
        >, Y-axis: <strong>{{ y }}</strong>
      </p> -->

      <!-- 첫 줄(lock, 뒤로감기, 앞으로감기, 전체삭제 버튼) -->
      <div class="button-container">

        <!-- lock 버튼, 있으면 좋을 것 같음 -->
        <button type="button" @click.prevent="disabled = !disabled">
          <!-- <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-lock"
            viewBox="0 0 16 16"
          > -->

          
          <svg
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-lock"
            viewBox="0 0 16 16"
          >
          <!-- viewBox 전부 00으로 교체 (원랜 0 0 16 16) -->
            <path
              v-if="!disabled"
              d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2zM3 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1H3z"
            />
            <path
              v-else
              d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"
            />
          </svg>
          <span v-if="!disabled">Unlock</span>
          <span v-else>Lock</span>
        </button>

        <!-- 그림 뒤로가기 버튼, 필수 -->
        <button type="button" @click.prevent="$refs.VueCanvasDrawing.undo()">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-arrow-counterclockwise"
            viewBox="0 0 16 16"
          >
            <path
              fill-rule="evenodd"
              d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"
            />
            <path
              d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"
            />
          </svg>
          Undo
        </button>

        <!-- 그림 앞으로가기 버튼, 필수 -->
        <button type="button" @click.prevent="$refs.VueCanvasDrawing.redo()">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-arrow-clockwise"
            viewBox="0 0 16 16"
          >
            <path
              fill-rule="evenodd"
              d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"
            />
            <path
              d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"
            />
          </svg>
          Redo
        </button>

        <!-- refresh 버튼 필수 아니라서 지워도 될 것 같음 -->
        <!-- <button type="button" @click.prevent="$refs.VueCanvasDrawing.redraw()">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-arrow-repeat"
            viewBox="0 0 16 16"
          >
            <path
              d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"
            />
            <path
              fill-rule="evenodd"
              d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"
            />
          </svg>
          Refresh
        </button> -->
        
        <!-- 전체 삭제 버튼, 필수 -->
        <button type="button" @click.prevent="$refs.VueCanvasDrawing.reset()">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-file-earmark"
            viewBox="0 0 16 16"
          >
            <path
              d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"
            />
          </svg>
          전체삭제
        </button>
      </div>

      <!-- 둘째 줄(펜/지우개 설정, 두께 설정, 색 설정, 타입 설정) -->
      <div class="button-container">

        <!-- 펜/지우개 설정 -->
        <button type="button" @click.prevent="eraser = !eraser">
          <span v-if="eraser">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-eraser"
              viewBox="0 0 16 16"
            >
              <path
                d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm2.121.707a1 1 0 0 0-1.414 0L4.16 7.547l5.293 5.293 4.633-4.633a1 1 0 0 0 0-1.414l-3.879-3.879zM8.746 13.547 3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"
              />
            </svg>
            Eraser
          </span>
          <span v-else>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-pencil"
              viewBox="0 0 16 16"
            >
              <path
                d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"
              />
            </svg>
            Draw
          </span>
        </button>

        <!-- 두께 설정 -->
        <select v-model="line">
          <option v-for="n in 65" :key="'option-' + n" :value="n">
            {{ n }}
          </option>
        </select>

        <!-- 색 설정, GauGAN2 모델에 있는 색상들만 선택 가능하도록 수정해야 함 -->
        <!-- <input type="color" v-model="color" /> -->
        <select v-model="color">
          <option value="#5e5bc5">다리</option>
          <option value="#706419">울타리</option>
          <option value="#7f4502">집</option>
          <option value="#8f2a91">플랫폼</option>
          <option value="#9600b1">지붕</option>
          <option value="#aad16a">벽돌벽</option>
          <option value="#ae2974">돌벽</option>
          <option value="#b0c1c3">나무벽</option>
          <option value="#6e6e28">흙</option>
          <option value="#7c32c8">자갈</option>
          <option value="#7d3054">지상 기타</option>
          <option value="#87716f">진흙</option>
          <option value="#8b3027">포장도로</option>
          <option value="#946e28">도로</option>
          <option value="#999900">모래</option>
          <option value="#696969">구름</option>
          <option value="#77ba1d">안개</option>
          <option value="#7ec864">언덕</option>
          <option value="#869664">산</option>
          <option value="#9364c8">강</option>
          <option value="#956432">바위</option>
          <option value="#9ac6da">바다</option>
          <option value="#9ceedd">하늘</option>
          <option value="#9e9eaa">눈</option>
          <option value="#a1a164">돌</option>
          <option value="#b1c8ff">물</option>
          <option value="#606e32">부쉬</option>
          <option value="#760000">꽃</option>
          <option value="#7bc800">풀</option>
          <option value="#a2a3eb">짚</option>
          <option value="#a8c832">나무</option>
          <option value="#b57b00">나무 기둥</option>
        </select>

        <select v-model="strokeType">
          <option value="dash">Dash</option>
          <option value="line">Straight Line</option>
          <option value="circle">Circle</option>
          <option value="square">Square</option>
          <option value="triangle">Triangle</option>
          <option value="half_triangle">Half Triangle</option>
        </select>
        <select v-model="lineCap">
          <option value="round">lineCap Round</option>
          <option value="square">lineCap Square</option>
          <option value="butt">lineCap butt</option>
        </select>
        <select v-model="lineJoin">
          <option value="round">lineJoin Round</option>
          <option value="miter">lineJoin miter</option>
          <option value="bevel">lineJoin bevel</option>
        </select>
        <button type="button" @click.prevent="fillShape = !fillShape">
          <span v-if="fillShape">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-square-fill"
              viewBox="0 0 16 16"
            >
              <path
                d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z"
              />
            </svg>
            Fill
          </span>
          <span v-else>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-square"
              viewBox="0 0 16 16"
            >
              <path
                d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"
              />
            </svg>
            Stroke
          </span>
        </button>
      </div>

      <!-- 셋째 줄(저장/저장취소 버튼) -->
      <div class="button-container">

        <!-- 저장 버튼 -->
        <button type="button" @click.prevent="getStrokes()">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-image-alt"
            viewBox="0 0 16 16"
          >
            <path
              d="M7 2.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0zm4.225 4.053a.5.5 0 0 0-.577.093l-3.71 4.71-2.66-2.772a.5.5 0 0 0-.63.062L.002 13v2a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-4.5l-4.777-3.947z"
            />
          </svg>
          저장
        </button>

        <!-- 저장 취소 버튼 -->
        <button type="button" @click.prevent="removeSavedStrokes()">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-eraser"
            viewBox="0 0 16 16"
          >
            <path
              d="M8.086 2.207a2 2 0 0 1 2.828 0l3.879 3.879a2 2 0 0 1 0 2.828l-5.5 5.5A2 2 0 0 1 7.879 15H5.12a2 2 0 0 1-1.414-.586l-2.5-2.5a2 2 0 0 1 0-2.828l6.879-6.879zm2.121.707a1 1 0 0 0-1.414 0L4.16 7.547l5.293 5.293 4.633-4.633a1 1 0 0 0 0-1.414l-3.879-3.879zM8.746 13.547 3.453 8.254 1.914 9.793a1 1 0 0 0 0 1.414l2.5 2.5a1 1 0 0 0 .707.293H7.88a1 1 0 0 0 .707-.293l.16-.16z"
            />
          </svg>
          저장 취소
        </button>
      </div>

      <!-- 넷째 줄(배경 색, 배경이미지 넣기) -->
      <div class="button-container">
        <div style="margin-right: 30px">
          <p style="margin-bottom: 0">배경색:</p>
          <input type="color" v-model="backgroundColor" />
        </div>
        <div>
          <p style="margin-bottom: 0">배경 이미지 업로드:</p>
          <input type="file" @change="setImage($event)" />
        </div>

        <!-- 워터마크 넣는 부분. 필요 없어서 주석 처리 -->
        <!-- <div>
          <p style="margin-bottom: 0">Upload Watermark Image:</p>
          <input type="file" @change="setWatermarkImage($event)" />
        </div> -->
      </div>
    </div>

    <div class="output">
      <p>Output:</p>
      <img :src="image" style="border: solid 1px #000000" />
    </div>
  </div>
  <div @click="goNewCanvas">그림판2</div>
  <div @click="goHome">홈으로</div>
  <div @click="changeImage">이미지 변환!</div>
</template>

<script type="module">
import { mapState, mapActions } from "vuex";
import VueDrawingCanvas from "vue-drawing-canvas/dist/vue-drawing-canvas.esm";
const accountStore = "accountStore";
const postcardStore = "postcardStore";

export default {
  components: {
    "vue-drawing-canvas": VueDrawingCanvas,
  },
  setup: () => {},
  computed: {
    ...mapState(accountStore, ["userInfo"]),
    ...mapState(postcardStore, ["justUploadedPostcard"]),
  },
  data() {
    return {
      initialImage: [
        {
          type: "dash",
          from: {
            x: 262,
            y: 154,
          },
          coordinates: [],
          color: "#000000",
          width: 5,
          fill: false,
        },
      ],
      x: 0,
      y: 0,
      image: "",
      eraser: false,
      disabled: false,
      fillShape: false,
      line: 65,
      color: "#9ceedd",
      strokeType: "dash",
      lineCap: "round",
      // lineJoin: "miter",
      lineJoin: "bevel",
      backgroundColor: "#9ceedd",
      backgroundImage: null,
      watermark: null,
      additionalImages: [],

      // 등록한 엽서 정보
      postedPostcard: [],
    };
  },
  mounted() {
    if ("vue-drawing-canvas" in window.localStorage) {
      this.initialImage = JSON.parse(
        window.localStorage.getItem("vue-drawing-canvas")
      );
    }
  },
  methods: {
    ...mapActions(postcardStore, ["uploadPostcard", "uploadTag", "userPostcardList"]),
    async setImage(event) {
      let URL = window.URL;
      this.backgroundImage = URL.createObjectURL(event.target.files[0]);
      await this.$refs.VueCanvasDrawing.redraw();
    },
    async setWatermarkImage(event) {
      let URL = window.URL;
      this.watermark = {
        type: "Image",
        source: URL.createObjectURL(event.target.files[0]),
        x: 0,
        y: 0,
        imageStyle: {
          width: 600,
          height: 400,
        },
      };
      await this.$refs.VueCanvasDrawing.redraw();
    },
    getCoordinate(event) {
      let coordinates = this.$refs.VueCanvasDrawing.getCoordinates(event);
      this.x = coordinates.x;
      this.y = coordinates.y;
    },
    getStrokes() {
      window.localStorage.setItem(
        "vue-drawing-canvas",
        JSON.stringify(this.$refs.VueCanvasDrawing.getAllStrokes())
      );
      // console.log(this.$refs.VueCanvasDrawing.getAllStrokes());
      console.log(this.$refs.VueCanvasDrawing);
      alert(
        "Strokes saved, reload your browser to see the canvas with previously saved image"
      );
    },
    removeSavedStrokes() {
      window.localStorage.removeItem("vue-drawing-canvas");
      alert("Strokes cleared from local storage");
    },
    goHome() {
      this.$router.push("/main");
    },
    goNewCanvas() {
      this.$router.push("/canvasNew");
    },
    async changeImage() {
      // 지금은 이미지 변환 클릭하면 엽서 등록 + 태그 등록됨
      // 로직 확인용이고, 잘 들어가는거 체크함
      console.log(document.getElementById("VueDrawingCanvas"));
      const canvas = document.getElementById("VueDrawingCanvas");
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

      for (var pair of canvasData.entries()) {
        console.log(pair[0]+ ', ' + pair[1]); 
      }
      let tagList = ["하늘", "구름"];
      console.log(canvasData);
      let postcardObj = {
        userId: this.userInfo.userId,
        postcard: canvasData,
      }
      await this.uploadPostcard(postcardObj);
      let tagObj = {
        postcardSeq: this.justUploadedPostcard.postcardSeq,
        tagList: tagList,
      }
      console.log(tagObj);
      await this.uploadTag(tagObj);
      console.log(this.userInfo.userId, tagList, canvasData);
    },
    dataURItoBlob(dataURI) {
      var binary = atob(dataURI.split(',')[1]);
      var array = [];
      for (var i = 0; i < binary.length; i++) {
        array.push(binary.charCodeAt(i));
      }
      return new Blob([new Uint8Array(array)], { type: 'image/png' });
    },
  },
};
</script>

<style scoped>
.flex-row {
  display: flex;
  flex-direction: row;
}
.button-container {
  display: flex;
  flex-direction: row;
}
.button-container > * {
  margin-top: 5px;
  margin-right: 10px;
}
</style>