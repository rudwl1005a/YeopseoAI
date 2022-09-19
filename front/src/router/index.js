import { createRouter, createWebHistory } from "vue-router";
import DonationView from "../views/DonationView";
import LoginView from "../views/LoginView";
import MainView from "../views/MainView";
import MakeCardView from "../views/MakeCardView";
import MypageView from "../views/MypageView";
import OrganizationListView from "../views/OrganizationListView";
import SearchView from "../views/SearchView";
import SignupView from "../views/SignupView";
import TestView from "../views/TestView";
import TestMypageView from "../views/TestMypageView";

const routes = [
  {
    path: "/",
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
    path: "/test",
    name: "TestView",
    component: TestView,
  }, 
  {
    path: "/mypage",
    name: "TestMypageView",
    component: TestMypageView,
  }, 
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
