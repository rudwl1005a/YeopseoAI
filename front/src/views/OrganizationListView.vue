<template>

  <div>기부단체 목록 화면임</div>
  <div :onclick="donation">기부하실?</div>

  <div class="organizationClass">
    <div class="mainLogoClass">
      <h1>엽AI사전</h1>
    </div>
    <b style="font-size: 1.5vw; bold">기부재단</b>
    <br>
    <div class="followOrganization">
      <div class="c-title02">
        <h2 class="main">メンバー</h2>
      </div>
      <div class="organizationList">

          <div class="organizationItem">
            <div class="img">
              <img src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_kasumi.png" alt="" data-src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_kasumi.png" decoding="async" class=" lazyloaded">
              <noscript>
                <img src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_kasumi.png" alt="" data-eio="l">
              </noscript>
            </div>
            <p class="name">こたに かすみ</p>
            <p class="text">専門学校卒業後、京都・滋賀のWeb制作会社、システム開発会社に勤務。webデザイン、フロントエンド開発をはじめ、WordPressなどのCMSを使用した開発など様々な制作に携わる。7年間の活動後、フリーランスに転向。<br> メディアサイトや官公庁サイトの制作に多く携わった経験から、誰にとっても見やすく使いやすいデザイン・設計を得意としています。きめ細かいところまで丁寧にご対応させていただきます。</p>
          </div>

          <div class="organizationItem">
            <div class="img">
              <img src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_naoto.png" alt="" data-src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_naoto.png" decoding="async" class=" lazyloaded">
              <noscript>
                <img src="https://sumika-creative.net/wp/wp-content/themes/sumika_ver1.0/img/about/img_naoto.png" alt="" data-eio="l">
              </noscript>
            </div>
            <p class="name">こたに なおと</p>
            <p class="text">大学卒業後、京都のWeb制作会社にて勤務。フロントエンド開発をはじめ、Wordpressでの開発、ASPでのECサイトの構築、企画・デザイン・ディレクション等様々なサイト制作に携わる。7年間の活動後、フリーランスに転向。<br> ディレクターとして多くの案件に携わった経験からお客様にとって何が一番必要なことか、エンドユーザーにとって使いやすいサイトとなっているのかを会話から導き出し、長く使えるサイト制作を心がけています。</p>
          </div>

      </div>
    </div>        
  </div>
  </template>
  
  <script>
  // import { mapActions, mapGetters } from "vuex";
  // const mypageStore = "mypageStore";
  // const roomdataStore = "roomdataStore";
  // const mypageStore = "mypageStore";
  // const memberStore = "memberStore";

  export default {
    name:"OrganizationListView",

    methods: {
      donation() {
        this.$router.push('/test')
      }
    },
  }
  </script>
  
  <style>
  .organizationClass {
    position: relative;
    height: 100%;
    background-color: #faf8f5;
  }

  .followOrganization {
    margin: 0 auto;
    padding: 0 50px;
    max-width: 1220px;
  }

  .organizationList {
    display: flex;
    justify-content: space-between;
    justify-content: space-between;
    max-width: 890px;
    margin: 40px auto 0;
  }
  
  .organizationItem {
    background: #fff;
    border-radius: 30px;
    padding: 40px 40px 35px;
    width: 47.2%;
    box-sizing: border-box;
  }

  </style>