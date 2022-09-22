<template>
    <div>MakeCard</div>
    <div @click="goCanvas">엽서 디자인 화면으로</div>
</template>

<script>
export default {
  name:"MakeCardView",
  methods: {
    goCanvas() {
      this.$router.push("/canvasTest");
    }
  }
}
</script>

<style>

</style>