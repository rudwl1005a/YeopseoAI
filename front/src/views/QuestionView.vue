<template>
<side-bar></side-bar>
<div class="boardQuestionClass">
  <div class="boardQuestionInside">
    <h2>문의 작성</h2>
    <div class="boardQuesWrap">
      <div class="boardQuesTitle">
        <input v-model="board.boardTitle" class="questionTitle" type="text" placeholder="제목" style="border:0 solid black">
      </div>
      <div class="boardQuesContent">
        <textarea v-model="board.boardContent" class="questionContent" type="textarea" placeholder="내용을 입력하세요" style="border:0 solid black"></textarea>
      </div>
    </div>
    <div class="boardpostBtn" @click="doPostBoard">등록</div>
    <div class="boardGoBoardmain" @click="goBoard">문의사항 목록으로</div>
  </div>
</div>
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
    goBoard() {
      this.$router.push('/board');
    }
  },
  created() {
    this.board.userSeq = this.userInfo.userSeq;
  }
}
</script>

<style>
.boardQuestionClass {
  height: 100vh;
  width: 100vw;
  background-color: #fcf4e0;
}
.boardQuestionInside {
  position: absolute;
  top: 50%;
  left: 47%;
  height: 80vh;
  width: 80vw;
  transform: translate(-50%, -50%);
}
.boardQuesWrap {
  
}
.questionTitle {
  height: 5vh;
  width: 80vw;
  background: transparent;
  margin-bottom: 3vh;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}
.questionTitle:focus {
  outline: none;
}
.questionContent {
  height: 60vh;
  width: 80vw;
  background: transparent;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
}
.questionContent:focus {
  outline: none;
}
.boardpostBtn {
  position: absolute;
  cursor: pointer;
  top: 100%;
  left: 47%;
  height: 5vh;
  width: 5vw;
  border-radius: 20px;
  font-size: 2vw;
  color: #fcf4e0;
  background-color: #fd8a69;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  line-height: 5vh;
  vertical-align: middle;
  transition: 0.4s;
}
.boardpostBtn:hover {
  background-color: #e85b34;
}
.boardGoBoardmain {
  cursor: pointer;
  position: absolute;
  width: 8vw;
  height: 3vh;
  font-size: 1.5vw;
  top: 100%;
  left: 100%;
  transform: translate(-50%, -50%);
}
</style>