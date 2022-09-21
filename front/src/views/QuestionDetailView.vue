<template>
<side-bar></side-bar>
<div>상세 조회 페이지</div>
  {{ watchingDetail.data.userId }}
  <br>
  {{ watchingDetail.data.boardTitle }}
  <br>
  {{ watchingDetail.data.boardContent }}
<div v-if="itsMe" @click="goPatchBoard">수정하기</div>
<div v-if="itsMe" @click="doDeleteBoard(watchingDetail.data.boardSeq)">삭제하기</div>
<div @click="goBoard">문의사항 목록으로</div>
</template>

<script>
import { mapState } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue";
import { deleteBoard } from "@/api/board.js";
const boardStore = "boardStore";
const accountStore = "accountStore";

export default {
  name: "QuestionDetailView",
  components: {
    SideBar,
  },
  data() {
    return {
      watchingDetail: [],
      itsMe: false,
    }
  },
  computed: {
    ...mapState(boardStore, ["watchingBoard"]),
    ...mapState(accountStore, ["userInfo"]),
  },
  methods: {
    goBoard() {
      this.$router.push("/board");
    },
    goPatchBoard() {
      this.$router.push('/patchBoard');
    },
    async doDeleteBoard(boardSeq) {
      await deleteBoard(boardSeq);
      this.$router.push("/board");
    },
  },
  created() {
    // 생성되면 조회한 게시글의 상세 정보를 보여줘야 함
    this.watchingDetail = this.watchingBoard;
    if (this.watchingDetail.data.userId === this.userInfo.userId) {
      this.itsMe = true;
    } else {
      this.itsMe = false;
    }
  },
}
</script>

<style>

</style>