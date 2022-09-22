<template>
<side-bar></side-bar>
<div>게시판입니다</div>
<div @click="goQuestion">문의하기</div>
<div @click="goHome">홈으로</div>
<div>게시글 목록</div>
<div @click="goDetail(board.boardSeq)" v-for="(board, index) in questionList" :key="index">
  작성자: {{ board.userId }}
  <br>
  제목: {{ board.boardTitle }}
  <br>
  내용: {{ board.boardContent }}
</div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import SideBar from "@/components/Nav/SideBar.vue"
import { postBoard, patchBoard, deleteBoard } from "@/api/board.js";
const boardStore = "boardStore";

export default {
  name: "BoardView",
  components: {
    SideBar,
  },
  data() {
    return {
      questionListView: [],
      noticeListView: [],
    }
  },
  computed: {
    ...mapState(boardStore, ["watchingBoard", "noticeList", "questionList"]),
  },
  methods: {
    ...mapActions(boardStore, ["detailBoardStore", "listBoardStore"]),
    async doPostBoard() {
      await postBoard();
    },
    async doPatchBoard() {
      await patchBoard();
    },
    async doDeleteBoard() {
      await deleteBoard();
    },
    goQuestion() {
      this.$router.push("/question");
    },
    async goDetail(boardSeq) {
      await this.detailBoardStore(boardSeq);
      this.$router.push("/questionDetail");
    },
    goHome() {
      this.$router.push("/");
    }
  },
  async created() {
    await this.listBoardStore(201); // 공지사항 세팅
    await this.listBoardStore(202); // 문의사항 세팅
    this.questionListView = this.questionList;
    this.noticeListView = this.noticeList;
  }
}
</script>

<style>

</style>