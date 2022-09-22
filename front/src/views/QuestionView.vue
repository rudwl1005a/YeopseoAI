<template>
<side-bar></side-bar>
<div>문의 페이지</div>
<div>
  <input v-model="board.boardTitle" class="questionTitle" type="text">
  <input v-model="board.boardContent" class="questionContent" type="text">
</div>
<div @click="doPostBoard">등록</div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue";
import { postBoard, patchBoard, deleteBoard } from "@/api/board.js";
const boardStore = "boardStore";
const accountStore = "accountStore";

export default {
  name: "QuestionView",
  components: {
    SideBar,
  },
  computed: {
    ...mapState(boardStore, ["watchingBoard"]), // 상세조회중인 게시글
    ...mapState(accountStore, ["userInfo"]), // userSeq를 가져오기 위해
  },
  data() {
    return {
      board: {
        boardCode: 202, // 여기선 문의사항으로만 넣어야 함
        boardContent: "",
        boardTitle: "",
        userSeq: "",
      },
    }
  },
  methods: {
    ...mapActions(boardStore, ["detailBoardStore", "listBoardStore"]),
    async doPostBoard() {
      await postBoard(this.board);
      this.$router.push("/board");
    },
    async doPatchBoard() {
      await patchBoard();
    },
    async doDeleteBoard() {
      await deleteBoard();
    },
  },
  created() {
    this.board.userSeq = this.userInfo.userSeq;
  }
}
</script>

<style>

</style>