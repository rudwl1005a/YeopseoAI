<template>
<div class="mainClass">
  <div class="mainpageClass">
  <div class="mainLogoClass">
    <h1>엽AI사전</h1>
  </div>
  <div class="mainSideBarClass">
    <!-- 토글 아이콘 넣자 -->
  </div>
    <div class="informationClass">
      <!-- 웹 페이지의 각 기능들을 대표할 수 있는 사진들을 넣어두자 -->
    </div>
  </div>
  <div class="mainpageAboutClass">
    <div class="mainpageAboutContentClass">
      <b style="font-size: 1.5vw; bold">about</b>
      <br>
      <br>
      <b style="font-size: 2vw">엽서사전</b>
      <br>
      <br>
      <p style="font-size: 1.2vw">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
        Distinctio rem animi doloribus nemo neque quod rerum eveniet 
        veniam qui libero reiciendis, numquam facilis aspernatur dicta 
        sapiente necessitatibus provident fugit mollitia.
      </p>
      <br>
      <p style="font-size: 1.2vw">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
        Distinctio rem animi doloribus nemo neque quod rerum eveniet 
        veniam qui libero reiciendis, numquam facilis aspernatur dicta 
        sapiente necessitatibus provident fugit mollitia.
      </p>
      <br>
      <p style="font-size: 1.2vw">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
        Distinctio rem animi doloribus nemo neque quod rerum eveniet 
        veniam qui libero reiciendis, numquam facilis aspernatur dicta 
        sapiente necessitatibus provident fugit mollitia.
      </p>
      <br>
      <p style="font-size: 1.2vw">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. 
        Distinctio rem animi doloribus nemo neque quod rerum eveniet 
        veniam qui libero reiciendis, numquam facilis aspernatur dicta 
        sapiente necessitatibus provident fugit mollitia.
      </p>
    </div>
  </div>
  <div class="mainpageServiceIntro">
    <div class="mainpageServiceIntroContent">
      <b style="font-size: 1.5vw;">service</b>
    </div>
  </div>
  <div class="famousLetterClass">

  </div>
  <div class="famousFoundationClass">

  </div>
  <div class="searchClass">

  </div>
</div>
</template>

<script>
export default {
  name:"MainView",
}
</script>

<style>
.mainClass {
  height: 600vh;
  background-color: whitesmoke;
}
.mainpageClass {
  height: 100vh;
  background-color: #fcf4e0;
}

.informationClass {
  position: absolute;
  top: 50%;
  left: 53%;
  transform: translate(-50%, -50%);
  height: 95vh;
  width: 78vw;
  border-radius: 20px;
  background-color: white;
}

.mainLogoClass {
  z-index: 1;
  position: fixed;
  margin-left: 5vh;
  font-size: 1vw;
}

.mainSideBarClass {
  z-index: 1;
  position: fixed;
  right: 0%;
  height: 100vh;
  width: 6vw;
  background-color: white;
}

.mainpageAboutClass {
  position: relative;
  height: 100vh;
  background-color: #faf8f5;
}

.mainpageAboutContentClass {
  position: absolute;
  width: 50vw;
  height: 60vh;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
  color: #484233;
}

.mainpageServiceIntro {
  position: relative;
  height: 100vh;
  background-color: #faf8f5;
}

.mainpageServiceIntroContent {
  position: absolute;
  height: 70vh;
  width: 75vw;
  top: 50%;
  left: 47%;
  transform: translate(-50%, -50%);
  background-color: white;
  border-radius: 30px;
}

.famousLetterClass {
  height: 100vh;
  background-color: #fcf4e0;
}

.famousFoundationClass {
  height: 100vh;
  background-color: #faf8f5;
}

.searchClass {
  height: 60vh;
  background-color: #ffc322;
}
</style>