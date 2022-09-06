<template>
  <div>기부단체 목록 화면임</div>
  <div :onclick="donation">기부하실?</div>
</template>

<script>
export default {
  name:"OrganizationListView",

  methods: {
    donation() {
      this.$router.push('/donation')
    }
  }
}
</script>

<style>

</style>