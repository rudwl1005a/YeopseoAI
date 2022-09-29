<template>
<side-bar></side-bar>
<div class="canvasPage">
  <canvas ref="canvas" id="canvasId" class="htmlCanvasClass"></canvas>
  <div class="colorPallet">
    <div class="colorBridge" @click="changeColorBridge">다리</div>
    <div class="colorWooltari" @click="changeColorWooltari">울타리</div>
    <div class="colorHouse" @click="changeColorHouse">집</div>
    <div class="colorPlatform" @click="changeColorPlatform">플랫폼</div>
    <div class="colorRoof" @click="changeColorRoof">지붕</div>
    <div class="colorBeukDol" @click="changeColorBeukDol">벽돌벽</div>
    <div class="colorDolBeuk" @click="changeColorDolBeuk">돌벽</div>
    <div class="colorTreeWall" @click="changeColorTreeWall">나무벽</div>
    <div class="colorSoil" @click="changeColorSoil">흙</div>
    <div class="colorMiniDol" @click="changeColorMiniDol">자갈</div>
    <div class="colorEct" @click="changeColorEct">기타</div>
    <div class="colorMud" @click="changeColorMud">진흙</div>
    <div class="colorGoodRoad" @click="changeColorGoodRoad">포장도로</div>
    <div class="colorRoad" @click="changeColorRoad">도로</div>
    <div class="colorBigSoil" @click="changeColorBigSoil">모래</div>
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
    <div class="colorBush" @click="changeColorBush">부쉬</div>
    <div class="colorFlower" @click="changeColorFlower">꽃</div>
    <div class="colorPool" @click="changeColorPool">풀</div>
    <div class="colorZip" @click="changeColorZip">짚</div>
    <div class="colorTree" @click="changeColorTree">나무</div>
    <div class="colorTreeColumn" @click="changeColorTreeColumn">나무기둥</div>
  </div>
  <div class="translateBtn">이미지 변환</div>
  <div class="translatedResult">
    <div class="translatedImg"></div>
    <div class="resultSaveBtn">엽서 업로드</div>
    <div class="resultTitleBend">Result!!</div>
  </div>
</div>
</template>

<script>
import SideBar from "@/components/Nav/SideBar.vue";

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
    }
  },
  methods: {
    // 색 변경
    changeColorBridge() {
      this.color = "#5e5bc5";
      this.ctx.strokeStyle = this.color;
    },
    changeColorWooltari() {
      this.color = "#706419";
      this.ctx.strokeStyle = this.color;
    },
    changeColorHouse() {
      this.color = "#7f4502";
      this.ctx.strokeStyle = this.color;
    },
    changeColorPlatform() {
      this.color = "#8f2a91";
      this.ctx.strokeStyle = this.color;
    },
    changeColorRoof() {
      this.color = "#9600b1";
      this.ctx.strokeStyle = this.color;
    },
    changeColorBeukDol() {
      this.color = "#aad16a";
      this.ctx.strokeStyle = this.color;
    },
    changeColorDolBeuk() {
      this.color = "#ae2974";
      this.ctx.strokeStyle = this.color;
    },
    changeColorTreeWall() {
      this.color = "#b0c1c3";
      this.ctx.strokeStyle = this.color;
    },
    changeColorSoil() {
      this.color = "#6e6e28";
      this.ctx.strokeStyle = this.color;
    },
    changeColorMiniDol() {
      this.color = "#7c32c8";
      this.ctx.strokeStyle = this.color;
    },
    changeColorEct() {
      this.color = "#7d3054";
      this.ctx.strokeStyle = this.color;
    },
    changeColorMud() {
      this.color = "#87716f";
      this.ctx.strokeStyle = this.color;
    },
    changeColorGoodRoad() {
      this.color = "#8b3027";
      this.ctx.strokeStyle = this.color;
    },
    changeColorRoad() {
      this.color = "#946e28";
      this.ctx.strokeStyle = this.color;
    },
    changeColorBigSoil() {
      this.color = "#999900";
      this.ctx.strokeStyle = this.color;
    },
    changeColorCloud() {
      this.color = "#696969";
      this.ctx.strokeStyle = this.color;
    },
    changeColorFog() {
      this.color = "#77ba1d";
      this.ctx.strokeStyle = this.color;
    },
    changeColorHill() {
      this.color = "#7ec864";
      this.ctx.strokeStyle = this.color;
    },
    changeColorMountain() {
      this.color = "#869664";
      this.ctx.strokeStyle = this.color;
    },
    changeColorRiver() {
      this.color = "#9364c8";
      this.ctx.strokeStyle = this.color;
    },
    changeColorRock() {
      this.color = "#956432";
      this.ctx.strokeStyle = this.color;
    },
    changeColorSea() {
      this.color = "#9ac6da";
      this.ctx.strokeStyle = this.color;
    },
    changeColorSky() {
      this.color = "#9ceedd";
      this.ctx.strokeStyle = this.color;
    },
    changeColorSnow() {
      this.color = "#9e9eaa";
      this.ctx.strokeStyle = this.color;
    },
    changeColorDol() {
      this.color = "#a1a164";
      this.ctx.strokeStyle = this.color;
    },
    changeColorWater() {
      this.color = "#b1c8ff";
      this.ctx.strokeStyle = this.color;
    },
    changeColorBush() {
      this.color = "#606e32";
      this.ctx.strokeStyle = this.color;
    },
    changeColorFlower() {
      this.color = "#760000";
      this.ctx.strokeStyle = this.color;
    },
    changeColorPool() {
      this.color = "#7bc800";
      this.ctx.strokeStyle = this.color;
    },
    changeColorZip() {
      this.color = "#a2a3eb";
      this.ctx.strokeStyle = this.color;
    },
    changeColorTree() {
      this.color = "#a8c832";
      this.ctx.strokeStyle = this.color;
    },
    changeColorTreeColumn() {
      this.color = "#b57b00";
      this.ctx.strokeStyle = this.color;
    },

    // 그리기
    onMouseMove(event) {
      // console.log(event);
      this.x = event.offsetX;
      this.y = event.offsetY;
      if (!this.painting) {
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
    }
  },
  mounted() {
    const canvas = document.getElementById("canvasId");
    let size = 35 * window.innerWidth / 100;
    canvas.width = size;
    canvas.height = size;
    canvas.style.width = size;
    canvas.style.height = size;
    this.ctx = canvas.getContext('2d');
    this.ctx.filter = "url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxmaWx0ZXIgaWQ9ImZpbHRlciIgeD0iMCIgeT0iMCIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgY29sb3ItaW50ZXJwb2xhdGlvbi1maWx0ZXJzPSJzUkdCIj48ZmVDb21wb25lbnRUcmFuc2Zlcj48ZmVGdW5jUiB0eXBlPSJpZGVudGl0eSIvPjxmZUZ1bmNHIHR5cGU9ImlkZW50aXR5Ii8+PGZlRnVuY0IgdHlwZT0iaWRlbnRpdHkiLz48ZmVGdW5jQSB0eXBlPSJkaXNjcmV0ZSIgdGFibGVWYWx1ZXM9IjAgMSIvPjwvZmVDb21wb25lbnRUcmFuc2Zlcj48L2ZpbHRlcj48L3N2Zz4=#filter)";
    // this.ctx.strokeStyle = "#a8c832";
    this.ctx.strokeStyle = this.color;
    this.ctx.lineWidth = 20;
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
    }
  }
}
</script>

<style>
.canvasPage {
  height: 100vh;
  width: 100vw;
  background-color: #faf8f5;
}

.htmlCanvasClass {
  position: absolute;
  top: 50%;
  left: 20%;
  transform: translate(-50%, -50%);
  background-color: #9ceedd;
  width: 35vw;
  height: 35vw;
  image-rendering: pixelated;
}

.translateBtn {
  position: absolute;
  top: 90%;
  left: 20%;
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

.translateBtn:hover {
  background-color: #e85b34;
}

.translatedResult {

}

.translatedImg {
  position: absolute;
  width: 30vw;
  height: 30vw;
  transform: translate(-50%, -50%);
  top: 45%;
  left: 77%;
  background-color: #fcf4e0;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}

.resultSaveBtn {
  position: absolute;
  top: 90%;
  left: 77%;
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

.resultSaveBtn:hover {
  background-color: #e85b34;
}

.resultTitleBend {
  position: absolute;
  top: 80%;
  left: 77%;
  transform: translate(-50%, -50%);
  font-size: 2vw;
}

.colorPallet {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: flex;
  flex-wrap: wrap;
  width: 20vw;
  height: 40vw;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
  color: white;
}
.colorCloud {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #696969;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
  color: white;
}
.colorFog {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #77ba1d;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
  color: white;
}
.colorHill {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #7ec864;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
  color: white;
}
.colorMountain {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #869664;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
  color: white;
}
.colorRiver {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #9364c8;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
  color: white;
}
.colorRock {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #956432;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
  color: white;
}
.colorSea {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #9ac6da;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
  color: white;
}
.colorSky {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #9ceedd;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
  color: white;
}
.colorSnow {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #9e9eaa;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
  color: white;
}
.colorDol {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #a1a164;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
  color: white;
}
.colorWater {
  cursor: pointer;
  width: 3vw;
  height: 3vw;
  background-color: #b1c8ff;
  border-radius: 5px;
  margin: 1vw;
  line-height: 3vw;
  vertical-align: middle;
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
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
  font-size: 1.5vw;
  color: white;
}
</style>