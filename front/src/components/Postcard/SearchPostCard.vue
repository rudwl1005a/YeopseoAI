<template>
<div class="searchPostcard">
  <div>
    <!-- {{ searchItem }} -->
    <!-- 엽서 이미지 넣을거임 -->
    <img src="../../../public/images/letter_dummy.jpg" style="height: 20vw; width: 30vw;" alt="">
  </div>
  <div class="searchPostcardArtist">
    {{ searchItem.userId }}
  </div>
  <div class="searchPostcardLike">
    좋아요 아이콘
  </div>
</div>
</template>

<script>
export default {
  name: "SearchPostCard",
  props: {
    searchItem: {
      type: Object,
    }
  },
}
</script>

<style>
.searchPostcard {
  position: relative;
  width: 30vw;
  height: 20vw;
  background-color: antiquewhite;
  border-radius: 20px;
  overflow: auto;
  margin-bottom: 2vh;
}

.searchPostcard::-webkit-scrollbar {
  display: none;
}

.searchPostcardArtist {
  cursor: pointer;
  position: absolute;
  top: 90%;
  left: 80%;
  height: 3vh;
  width: 5vw;
  border-radius: 20px;
  border: 1px solid black;
  overflow: auto;
  background-color: azure;
}

.searchPostcardArtist::-webkit-scrollbar {
  display: none;
}

.searchPostcardLike {
  position: absolute;
  cursor: pointer;
  top: 90%;
  left: 5%;
  border-radius: 20px;
  border: 1px solid black;
  background-color: azure;
}
</style>