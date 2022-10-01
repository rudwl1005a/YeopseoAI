<template>
<div id="modalBox" data-aos="fade-up" data-aos-duration="500" class="favoritePicsB">
  <div class="favoritePicsB1">
    <img class="favoriteImg" :src="imgURL" style="height: 42vh; width: 22vh;" alt="">
  </div>
  <div class="favoritePicsB2">
    <img class="favoriteImg" :src="imgURL" style="height: 7vh; width: 22vh;" alt="">
  </div>
  <div class="favoritePicsB3">
    <img class="favoriteImg" :src="imgURL" style="height: 17vh; width: 17vh;" alt="">
  </div>
  <div class="favoritePicsB4">
    <img class="favoriteImg" :src="imgURL" style="height: 32vh; width: 32vh;" alt="">
  </div>
  <div class="favoritePicsB5">
    <!-- <img class="favoriteImg" :src="imgURL" style="height: 22vh; width: 22vh;" alt=""> -->
  </div>
  <div class="favoritePicsB6">
    <!-- <img class="favoriteImg" :src="imgURL" style="height: 22vh; width: 22vh;" alt=""> -->
  </div>
  <div class="favoritePicsB7"></div>
  <div class="favoritePicsB8"></div>
  <div class="favoritePicsB9"></div>
  <div class="favoritePicsB10"></div>
  <div class="favoritePicsB11"></div>
  <div class="favoritePicsB12"></div>
</div>
</template>

<script>
export default {
  name: "favoritePostcardB",
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
    console.log('b')

  },
}
</script>

<style>
.favoritePicsB {
  position: relative;
  height: 90vh;
  width: 105vh;
  background-size: 105vh 90vh;
  border: 1px solid black;
  transition: 0.4s;
}

.favoritePicsB1 {
  position: absolute;
  height: 45vh;
  width: 25vh;
  line-height: 45vh;
  vertical-align: middle;
  top: 50%;
  left: 40%;
  transform: translate(-50%, -50%);
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  transition: 0.4s;
}

.favoritePicsB2 {
  position: absolute;
  height: 10vh;
  width: 25vh;
  line-height: 10vh;
  vertical-align: middle;
  top: 15%;
  left: 60%;
  transform: translate(-50%, -50%);
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}

.favoritePicsB3 {
  position: absolute;
  height: 20vh;
  width: 20vh;
  line-height: 20vh;
  vertical-align: middle;
  top: 50%;
  left: 15%;
  transform: translate(-50%, -50%);
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}

.favoritePicsB4 {
  position: absolute;
  height: 35vh;
  width: 35vh;
  line-height: 35vh;
  vertical-align: middle;
  top: 50%;
  left: 75%;
  transform: translate(-50%, -50%);
  background-color: white;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}

.favoritePicsB5 {
  position: absolute;
}

.favoritePicsB6 {
  position: absolute;
}

.favoritePicsB7 {
  position: absolute;
}

.favoritePicsB8 {
  position: absolute;
}

.favoritePicsB9 {
  position: absolute;
}

.favoritePicsB10 {
  position: absolute;
}

.favoritePicsB11 {
  position: absolute;
}

.favoritePicsB12 {
  position: absolute;
}

</style>