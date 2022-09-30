<template>
          
  <!-- TestMypageView의 좋아하는 엽서 목록 부분에 v-if  등으로 숨겨둘 것.
  사용자가 이걸 선택하면 보여주도록 로직 추가 필요 -->
  <div id="modalBox" data-aos="fade-up" data-aos-duration="500" class="favoritePics">
    <!-- 좌측 상단부 -->
    <div class="favoritePics1">
      <div class="favoritePics1_1">
        <img class="favoriteImg" :src="imgURL" style="height: 22vh; width: 22vh;" alt="">
      </div>
      <div class="favoritePics1_2">
        <img class="favoriteImg" :src="imgURL" style="height: 22vh; width: 22vh;" alt="">
      </div>
    </div>

    <!-- 중간측 상단부 -->
    <div class="favoritePics2">
      <img class="favoriteImg" :src="imgURL" style="height: 27vh; width: 27vh;" alt="">
    </div>

    <!-- 우측 -->
    <div class="favoritePics3">
      <div class="favoritePics3_1">
        <img class="favoriteImg" :src="imgURL" style="height: 18vh; width: 18vh;" alt="">
      </div>
      <div class="favoritePics3_2">
        <img class="favoriteImg" :src="imgURL" style="height: 18vh; width: 18vh;" alt="">
      </div>
      <div class="favoritePics3_3">
        <img class="favoriteImg" :src="imgURL" style="height: 18vh; width: 18vh;" alt="">
      </div>
      <div class="favoritePics3_4">
        <img class="favoriteImg" :src="imgURL" style="height: 18vh; width: 18vh;" alt="">
      </div>
    </div>

    <!-- 좌측 하단부 -->
    <div class="favoritePics4">
      <div class="favoritePics4_1">
        <img class="favoriteImg" :src="imgURL" style="height: 22vh; width: 22vh;" alt="">
      </div>
      <div class="favoritePics4_2">
        <img class="favoriteImg" :src="imgURL" style="height: 22vh; width: 22vh;" alt="">
      </div>
      <div class="favoritePics4_3">
        <img class="favoriteImg" :src="imgURL" style="height: 22vh; width: 22vh;" alt="">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "favoritePostcardsA",
  data() {
    return {
      imgURL: require("../../../public/images/test1.jpg")
    }
  },
  methods: {
    // data의 imgURL을 변경해주는 로직이 필요
    // 현 시점에선 사용자가 좋아하는 엽서 목록을 받지 못해
    // 해당하는 imgURL을 세팅할 수 없다
  },
  created() {
    console.log('a')
  },
}
</script>

<style>
/* 좋아하는 엽서 모음 전체 */
.favoritePics {
  position: relative;
  height: 90vh;
  width: 105vh;
  /* background-image: url("../../../public/images/collection_backgroundA.jpg"); */
  background-size: 105vh 90vh;
  transition: 0.4s;
}
.favoritePics:hover {
  /* transform: rotate(360deg); */
  width: 120vh;
  transition: 0.4s;
}

/* 좋아하는 엽서 좌측 상단부 */
.favoritePics1 {

}
.favoritePics1_1 {
  position: absolute;
  z-index: 0;
  height: 25vh;
  width: 25vh;
  line-height: 25vh;
  vertical-align: middle;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  top: 12.5%;
  left: 0%;
  /* transform: translate(-50%, -50%); */
  transform: rotate(-6deg);
  transition: 0.4s;
}
.favoritePics1_1:hover {
  z-index: 10;
  transform: rotate(0deg);
}
.favoritePics1_2 {
  position: absolute;
  z-index: 1;
  height: 25vh;
  width: 25vh;
  line-height: 25vh;
  vertical-align: middle;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  top: 12.5%;
  left: 7.5%;
  /* transform: translate(-50%, -50%); */
  transform: rotate(6deg);
  transition: 0.4s;
}
.favoritePics1_2:hover {
  transform: rotate(0deg);
}

/* 좋아하는 엽서 중반측 상단부 */
.favoritePics2 {
  position: absolute;
  height: 30vh;
  width: 30vh;
  line-height: 30vh;
  vertical-align: middle;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  top: 12.5%;
  left: 45%;
  /* transform: translate(-50%, -50%); */
  transform: rotate(-4deg);
  transition: 0.4s;
}
.favoritePics2:hover {
  transform: rotate(0deg);
}

/* 좋아하는 엽서 우측 */
.favoritePics3 {
  
}
.favoritePics3_1 {
  position: absolute;
  z-index: 3;
  height: 20vh;
  width: 20vh;
  line-height: 20vh;
  vertical-align: middle;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  top: 15%;
  left: 80%;
  /* transform: translate(-50%, -50%); */
  transform: rotate(4deg);
  transition: 0.4s;
}
.favoritePics3_1:hover {
  transform: rotate(0deg);
}
.favoritePics3_2 {
  position: absolute;
  z-index: 2;
  height: 20vh;
  width: 20vh;
  line-height: 20vh;
  vertical-align: middle;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  top: 35%;
  left: 80%;
  /* transform: translate(-50%, -50%); */
  transform: rotate(-4deg);
  transition: 0.4s;
}
.favoritePics3_2:hover {
  z-index: 10;
  transform: rotate(0deg);
}
.favoritePics3_3 {
  position: absolute;
  z-index: 1;
  height: 20vh;
  width: 20vh;
  line-height: 20vh;
  vertical-align: middle;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  top: 55%;
  left: 80%;
  /* transform: translate(-50%, -50%); */
  transform: rotate(4deg);
  transition: 0.4s;
}
.favoritePics3_3:hover {
  z-index: 10;
  transform: rotate(0deg);
}
.favoritePics3_4 {
  position: absolute;
  z-index: 0;
  height: 20vh;
  width: 20vh;
  line-height: 20vh;
  vertical-align: middle;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  top: 75%;
  left: 80%;
  /* transform: translate(-50%, -50%); */
  transform: rotate(-4deg);
  transition: 0.4s;
}
.favoritePics3_4:hover {
  z-index: 10;
  transform: rotate(0deg);
}

/* 좋아하는 엽서 좌측 하단부 */
.favoritePics4 {
  
}
.favoritePics4_1 {
  position: absolute;
  z-index: 0;
  height: 25vh;
  width: 25vh;
  line-height: 25vh;
  vertical-align: middle;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  top: 62.5%;
  left: 7.5%;
  /* transform: translate(-50%, -50%); */
  transform: rotate(-4deg);
  transition: 0.4s;
}
.favoritePics4_1:hover {
  z-index: 10;
  transform: rotate(0deg);
}
.favoritePics4_2 {
  position: absolute;
  z-index: 1;
  height: 25vh;
  width: 25vh;
  line-height: 25vh;
  vertical-align: middle;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  top: 62.5%;
  left: 17.5%;
  /* transform: translate(-50%, -50%); */
  transition: 0.4s;
}
.favoritePics4_2:hover {
  z-index: 10;
  transform: rotate(0deg);
}
.favoritePics4_3 {
  position: absolute;
  z-index: 2;
  height: 25vh;
  width: 25vh;
  line-height: 25vh;
  vertical-align: middle;
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  top: 62.5%;
  left: 27.5%;
  /* transform: translate(-50%, -50%); */
  transform: rotate(4deg);
  transition: 0.4s;
}
.favoritePics4_3:hover {
  z-index: 10;
  transform: rotate(0deg);
}

/* 이미지 정렬 */
.favoriteImg {
}
</style>