import { createRouter, createWebHistory } from "vue-router";
import DonationView from "../views/DonationView";
import LoginView from "../views/LoginView";
import MainView from "../views/MainView";
import MakeCardView from "../views/MakeCardView";
import MypageView from "../views/MypageView";
import OrganizationListView from "../views/OrganizationListView";
import SearchView from "../views/SearchView";
import SignupView from "../views/SignupView";
import beginningView from "../views/beginningView";
import TestMypageView from "../views/TestMypageView";
import BoardView from "../views/BoardView";
import QuestionView from "../views/QuestionView";
import QuestionDetailView from "../views/QuestionDetailView";
import PatchBoardView from "../views/PatchBoardView";
import CanvasTestView from "../views/CanvasTestView";

const routes = [
  {
    path: "/",
    name: "beginningView",
    component: beginningView,
  },
  {
    path: "/main",
    name: "MainView",
    component: MainView,
  },
  {
    path: "/login",
    name: "LoginView",
    component: LoginView,
  },
  {
    path: "/signup",
    name: "SignupView",
    component: SignupView,
  },
  {
    path: "/donation",
    name: "DonationView",
    component: DonationView,
  },
  {
    path: "/makecard",
    name: "MakeCardView",
    component: MakeCardView,
  },
  {
    path: "/mypage/:user_id",
    name: "MypageView",
    component: MypageView,
  },
  {
    path: "/organizationlist",
    name: "OrganizationListView",
    component: OrganizationListView,
  },
  {
    path: "/search",
    name: "SearchView",
    component: SearchView,
  },
  {
    path: "/signup",
    name: "SignupView",
    component: SignupView,
  }, 
  {
    path: "/mypage",
    name: "TestMypageView",
    component: TestMypageView,
  }, 
  {
    path: "/board",
    name: "BoardView",
    component: BoardView,
  },
  {
    path: "/question",
    name: "QuestionView",
    component: QuestionView,
  },
  {
    path: "/questionDetail",
    name: "QuestionDetailView",
    component: QuestionDetailView,
  },
  {
    path: "/patchBoard",
    name: "PatchBoardView",
    component: PatchBoardView,
  },
  {
    path: "/canvasTest",
    name: "CanvasTestView",
    component: CanvasTestView,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
