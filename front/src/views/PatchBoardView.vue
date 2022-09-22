<template>
<side-bar></side-bar>
<div>게시글 수정 페이지</div>
<input v-model="board.boardTitle" type="text">
<input v-model="board.boardContent" type="text">
<div @click="doPatchBoard(watchingDetail.data.boardSeq)">수정</div>
<div @click="goBoard">목록으로</div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue";
import { patchBoard } from "@/api/board.js";
const boardStore = "boardStore";

export default {
  name: "PatchBoardView",
  components: {
    SideBar,
  },
  data() {
    return {
      board: {
        boardContent: "",
        boardTitle: "",
      },
      watchingDetail: [],
    }
  },
  computed: {
    ...mapState(boardStore, ["watchingBoard"]),
  },
  methods: {
    ...mapActions(boardStore, ["detailBoardStore"]),
    async doPatchBoard(boardSeq) {
      await patchBoard(this.board, boardSeq);
      await this.detailBoardStore(boardSeq);
      this.$router.push("/questionDetail");
    },
    goBoard() {
      this.$router.push("/board");
    }
  },
  created() {
    this.watchingDetail = this.watchingBoard;
  },
}
</script>

<style>

</style>