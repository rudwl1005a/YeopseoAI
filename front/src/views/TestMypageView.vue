<template>


  <side-bar></side-bar>

  
  <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="secession" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width: ">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="mypaginationPostcardName" style="margin-top: 2vw; margin-bottom: 2vw;">
        진짜 탈퇴하실건가요??
      </div>
      <div class="modal-footer">
        <div class="mypaginationPostcardName" style="margin-top: 2vw; margin-bottom: 2vw;" data-bs-dismiss="modal">아니요!</div>
        <div class="mypaginationPostcardName" @click="secession" style="margin-top: 2vw; margin-bottom: 2vw;">네..</div>
      </div>
    </div>
  </div>
</div>
  
  <div v-if="test" class="Mypage">
    <div class="mypageNav">
      <div class="mypageBtn" @click="goProfile" @mouseover="change1">profile</div>
      <div class="mypageBtn" @click="goDonations" @mouseover="change3">donations</div>
      <div class="mypageBtn" @click="goMade" @mouseover="change5">{{ownerInfo.userName}} made</div>
      <div class="mypageBtn" @click="goLikedPostcards" @mouseover="change2">liked postcards</div>
      <div v-if="isOwner" class="mypageBtn" @click="goFollowing" @mouseover="change4">following</div>
      <div v-if="isOwner" class="mypageBtn" style="font-size: 1.3vw; margin-top: 10vw;" @click="showUpdateInfo" @mouseover="change4">회원정보수정</div>
      <div v-if="isOwner" class="mypageBtn" style="font-size: 1.3vw; margin-bottom: ;" data-bs-toggle="modal" data-bs-target="#secession" @mouseover="change4">회원탈퇴</div>
    </div>
    <div class="updown"></div>


    <p id="goProfile" class="profileTitle">{{this.ownerInfo.userName}}'s profile page</p>
    <div style="margin-left: 10vw">
    <br>






    
    <!-- 내 정보 부분 -->
    <div class="myInfo row">
      <div class="myProfileBox row justify-content-around">


          <div class="myProfileImageBox ">
            <img v-if="ownerInfo.userProfileUrl !== null" class="myProfileImage" id="profileImg" :src="profileImg" alt="">
            <img v-else class="myProfileImage" id="profileImg" :src="defaultProfile.imageUrl" alt="zzz">
              
              <div v-show="!isOwner && !isFollow" @click="doFollow" id="follow" class="mpButton">
                팔로우
              </div>
              <div v-show="!isOwner && isFollow" @click="doUnFollow" id="unFollow" class="mpButton">
                팔로우 취소
              </div>

              <label v-if="isOwner" class="mpButton" for="changeImg">
              프로필 변경
              </label>
              <input style="display: none;" id="changeImg" type="file" accept="image/*" @change="tempImg"/>
          </div>


        <div class="myProfileInfo align-self-center row justify-content-center">
          <h1>기부 횟수: {{this.mypageUserInfo.donationCnt}}</h1>
          <h1>총 기부 금액: {{this.mypageUserInfo.donationMoney}}</h1>
          <h1 class="mpButton" style="border-width: 1vw; border: black; cursor: pointer;" @click="showCollection">컬렉션 보기</h1>
        </div>
      </div>
    </div>
    <div class="leftRight"></div>










    <!-- 유저의 기부목록 보여주기 -->
    <p id="goDonations" class="profileText">{{this.ownerInfo.userName}}'s donations</p>
    <!-- <div id="donationList" class="mypageCarousel">
      <div class="wrap">
        <ul class="">
          <li v-for="(donation, index) in this.donationList" :key="index">
            <img class="cardItem" :src="donation.donationImgUrl" alt="">
          </li>
        </ul>
      </div>
    </div> -->
    
    <!-- 유저가 기부한 엽서들 페이지네이션해서 보여주는 부분 -->
    <div v-if="Math.ceil(this.donationList.length / 12)">
    <div class="paginationPage">
      <div class="d-flex mypaginationTitle">
        <h3 class="mypaginationText">{{ownerInfo.userName}}의 기부목록</h3>
        <div class="d-flex mypaginationText">
          <i class="bi bi-chevron-left" @click="postcardMove('D-left')"></i>
          <b v-if="Math.ceil(this.donationList.length / 12)">{{this.donationStage +1}} / {{Math.ceil(this.donationList.length / 12)}}</b>
          <b v-else>0 / 0</b>
          <i class="bi bi-chevron-right" @click="postcardMove('D-right')"></i>
        </div>
      </div>
      
        <div v-for="(page, index) in Math.ceil(this.donationList.length / 12)"
          :key="`page-${index}`" >

          <div v-if="index === this.donationStage" data-aos="flip-left" data-aos-duration="200">
            
            <!-- 앞면 -->
            <div class="mypaginationPostcardList">
              <div v-for="(donation, idx) in this.donationList.slice(index * 12, index * 12 + 4)" :key="`postcard-${page}-${idx}`" class="spin">
                <div class="spinItem front">
                  <div class="mypaginationImgSize">
                    <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
                    <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
                  </div>
                </div>
                <div class="spinItem back">
                  <div class="mypaginationImgSize">
                    <p class="mypaginationPostcardName">{{donation.donationText}}</p>
                    <div v-if="isOwner" style="position: absolute; top: 12vw;">
                      <div class="mypaginationPostcardName">후원금액</div>
                      <div class="mypaginationPostcardName">{{donation.donationPay}} 원</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
              
            <div class="mypaginationPostcardList">
              <div v-for="(donation, idx) in this.donationList.slice(index * 12 + 4, index * 12 + 8)" :key="`postcard-${page}-${idx}`" class="spin">
                <div class="spinItem front">
                  <div class="mypaginationImgSize">
                    <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
                    <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
                  </div>
                </div>
                <div class="spinItem back">
                  <div class="mypaginationImgSize">
                    <p class="mypaginationPostcardName">{{donation.donationText}}</p>                  
                    <div v-if="isOwner" style="position: absolute; top: 12vw;">
                      <div class="mypaginationPostcardName">후원금액</div>
                      <div class="mypaginationPostcardName">{{donation.donationPay}} 원</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="mypaginationPostcardList">
              <div v-for="(donation, idx) in this.donationList.slice(index * 12 + 8, index * 12 + 12)" :key="`postcard-${page}-${idx}`" class="spin">
                <div class="spinItem front">
                  <div class="mypaginationImgSize">
                    <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
                    <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
                  </div>
                </div>
                <div class="spinItem back">
                  <div class="mypaginationImgSize">
                    <p class="mypaginationPostcardName">{{donation.donationText}}</p>
                    <div v-if="isOwner" style="position: absolute; top: 12vw;">
                      <div class="mypaginationPostcardName">후원금액</div>
                      <div class="mypaginationPostcardName">{{donation.donationPay}} 원</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
          </div>
        </div>
      </div>

      <div v-else>
        <div style="font-size:5vw; margin-top:10vw;">기부목록이 없습니다...</div>
        <div v-if="this.isOwner" class="mpButton" style="margin-bottom:10vw;" @click="goDonation">기부하러가기</div>
      </div>
    <div class="leftRight"></div>












    <!-- 유저가 만든 모든 엽서 보여주기 -->
    <p id="goMade" class="profileText">Made by {{this.ownerInfo.userName}}</p>
    <!-- <div id="madeList" class="mypageCarousel">
      <div class="wrap">
        <ul class="">
          <li v-for="(postcard, index) in this.postcardList " :key="index">
            <img class="cardItem" :src="postcard.postcard.postcardImgUrl" alt="">
          </li>
        </ul>
      </div>
    </div> -->

    <!-- 유저가 만든 엽서들 페이지네이션해서 보여주는 부분 -->
    <div v-if="Math.ceil(this.postcardList.length / 12)">
    <div class="paginationPage">
      <div class="d-flex mypaginationTitle">
        <h3 class="mypaginationText">{{ownerInfo.userName}}의 엽서 목록</h3>
        <div class="d-flex mypaginationText">
          <i class="bi bi-chevron-left" @click="postcardMove('left')"></i>
          <b v-if="Math.ceil(this.postcardList.length / 12)">{{this.postcardStage +1}} / {{Math.ceil(this.postcardList.length / 12)}}</b>
          <b v-else>0 / 0</b>
          <i class="bi bi-chevron-right" @click="postcardMove('right')"></i>
        </div>
      </div>
      <div v-for="(page, index) in Math.ceil(this.postcardList.length / 12)"
        :key="`page-${index}`">

        <div v-if="index === this.postcardStage" data-aos="flip-left" data-aos-duration="200">


          <div class="mypaginationPostcardList">
            <div v-for="(postcard, idx) in this.postcardList.slice(index * 12 , index * 12 + 4)" :key="`postcard-${page}-${idx}`" class="spin">
              <div class="spinItem front">
                <div class="mypaginationImgSize">
                  <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
                  <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
                </div>
              </div>
              <div class="spinItem back">
                <div class="mypaginationImgSize">
                  <p class="mypaginationPostcardName">made by</p>
                  <p class="mypaginationPostcardName" style="margin-top: 0px;">{{ownerInfo.userName}}</p>
                  <div style="position: absolute; top: 11vw; left: 3.5vw; cursor: pointer;">
                    <p v-show="!postcard.postcard.isLiked" :id="`l${postcard.postcard.postcardSeq}`" @click="dolikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="">좋아요</p>
                    <p v-show="postcard.postcard.isLiked" :id="`dl${postcard.postcard.postcardSeq}`" @click="dodislikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="margin-left: -0.5vw">좋아요 취소</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="mypaginationPostcardList">
            <div v-for="(postcard, idx) in this.postcardList.slice(index * 12 + 4, index * 12 + 8)" :key="`postcard-${page}-${idx}`" class="spin">
              <div class="spinItem front">
                <div class="mypaginationImgSize">
                  <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
                  <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
                </div>
              </div>
              <div class="spinItem back">
                <div class="mypaginationImgSize">
                  <p class="mypaginationPostcardName">made by</p>
                  <p class="mypaginationPostcardName" style="margin-top: 0px;">{{ownerInfo.userName}}</p>
                  <div style="position: absolute; top: 11vw; left: 3.5vw; cursor: pointer;">
                    <p v-show="!postcard.postcard.isLiked" :id="`l${postcard.postcard.postcardSeq}`" @click="dolikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="">좋아요</p>
                    <p v-show="postcard.postcard.isLiked" :id="`dl${postcard.postcard.postcardSeq}`" @click="dodislikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="margin-left: -0.5vw">좋아요 취소</p>
                  </div>
                </div>
              </div>
            </div>
          </div>


          <div class="mypaginationPostcardList">
            <div v-for="(postcard, idx) in this.postcardList.slice(index * 12 + 8, index * 12 + 12)" :key="`postcard-${page}-${idx}`" class="spin">
              <div class="spinItem front">
                <div class="mypaginationImgSize">
                  <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
                  <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
                </div>
              </div>
              <div class="spinItem back">
                <div class="mypaginationImgSize">
                  <p class="mypaginationPostcardName">made by</p>
                  <p class="mypaginationPostcardName" style="margin-top: 0px;">{{ownerInfo.userName}}</p>
                  <div style="position: absolute; top: 11vw; left: 3.5vw; cursor: pointer;">
                    <p v-show="!postcard.postcard.isLiked" :id="`l${postcard.postcard.postcardSeq}`" @click="dolikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="">좋아요</p>
                    <p v-show="postcard.postcard.isLiked" :id="`dl${postcard.postcard.postcardSeq}`" @click="dodislikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="margin-left: -0.5vw">좋아요 취소</p>
                  </div>
                </div>
              </div>
            </div>
          </div>


          <!-- <div class="mypaginationPostcardList" style="margin-left: 0vw;">
            <div v-for="(postcard, idx) in this.postcardList.slice(index * 12 + 8, index * 12 + 12)" :key="`postcard-${page}-${idx}`" class="mypaginationImgSize">
              <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
              <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
            </div>
          </div> -->

        </div>
      </div>
    </div>
    </div>
    <div v-else>
      <div style="font-size:5vw; margin-top:10vw;">엽서목록이 없습니다...</div>
      <div v-if="this.isOwner" class="mpButton" style="margin-bottom:10vw;" @click="goLetter">엽서 만들기</div>
    </div>
    <div class="leftRight"></div>










     
    

    <!-- 유저가 좋아요한 포스트카드 -->
    <div class="followUsers">
      <p id="goLikedPostcards" class="profileText">{{this.ownerInfo.userName}}'s pick</p>
    </div> 
    <!-- <div id="likedList" class="mypageCarousel">
      <div class="wrap">
        <ul id="ul" class="">
          <li v-for="(card, index) in this.userLikedPostcard.postcardList " :key="index">
            <img class="cardItem " :src="card.postcard.postcardImgUrl" alt="">
          </li>
        </ul>
      </div>
    </div> -->

    <!-- 유저가 좋아요한 엽서들 페이지네이션해서 보여주는 부분 -->
    <div v-if="Math.ceil(this.userLikedPostcard.postcardList.length / 12)">

    <div class="paginationPage">

      <div class="d-flex mypaginationTitle">
        <h3 class="mypaginationText">{{ownerInfo.userName}}님이 좋아하는 엽서 목록</h3>
        <div class="d-flex mypaginationText">
          <i class="bi bi-chevron-left" @click="postcardMove('L-left')"></i>
          <b v-if="Math.ceil(this.userLikedPostcard.postcardList.length / 12)">{{this.likedPostcardStage +1}} / {{Math.ceil(this.userLikedPostcard.postcardList.length / 12)}}</b>
          <b v-else>0 / 0</b>
          <i class="bi bi-chevron-right" @click="postcardMove('L-right')"></i>
        </div>
      </div>
      <div v-for="(page, index) in Math.ceil(this.userLikedPostcard.postcardList.length / 12)"
        :key="`liked-page-${index}`" >

        <div v-if="index === this.likedPostcardStage" data-aos="flip-left" data-aos-duration="200">

          <div class="mypaginationPostcardList">
            <div v-for="(postcard, idx) in this.userLikedPostcard.postcardList.slice(index * 12, index * 12 + 4)" :key="`postcard-${page}-${idx}`" class="spin">
              <div class="spinItem front">
                <div class="mypaginationImgSize">
                  <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
                  <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
                </div>
              </div>
              <div class="spinItem back">
                <div class="mypaginationImgSize">
                  <p class="mypaginationPostcardName">made by</p>
                  <!-- <router-view :key="$route.fullPath"/> -->
                  <p class="mypaginationPostcardName" @click="goUserPage(postcard.postcard.userSeq)" style="margin-top: 0px; cursor: pointer;">{{postcard.userId}}</p>
                  <div style="position: absolute; top: 11vw; left: 3.5vw; cursor: pointer;">
                    <p v-show="!postcard.postcard.isLiked" :id="`l${postcard.postcard.postcardSeq}`" @click="dolikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="">좋아요</p>
                    <p v-show="postcard.postcard.isLiked" :id="`dl${postcard.postcard.postcardSeq}`" @click="dodislikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="margin-left: -0.5vw">좋아요 취소</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="mypaginationPostcardList">
            <div v-for="(postcard, idx) in this.userLikedPostcard.postcardList.slice(index * 12 + 4, index * 12 + 8)" :key="`postcard-${page}-${idx}`" class="spin">
              <div class="spinItem front">
                <div class="mypaginationImgSize">
                  <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
                  <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
                </div>
              </div>
              <div class="spinItem back">
                <div class="mypaginationImgSize">
                  <p class="mypaginationPostcardName">made by</p>
                  <p class="mypaginationPostcardName" @click="goUserPage(postcard.postcard.userSeq)" style="margin-top: 0px; cursor: pointer;">{{postcard.userId}}</p>
                  <div style="position: absolute; top: 11vw; left: 3.5vw; cursor: pointer;">
                    <p v-show="!postcard.postcard.isLiked" :id="`l${postcard.postcard.postcardSeq}`" @click="dolikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="">좋아요</p>
                    <p v-show="postcard.postcard.isLiked" :id="`dl${postcard.postcard.postcardSeq}`" @click="dodislikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="margin-left: -0.5vw">좋아요 취소</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="mypaginationPostcardList">
            <div v-for="(postcard, idx) in this.userLikedPostcard.postcardList.slice(index * 12 + 8, index * 12 + 12)" :key="`postcard-${page}-${idx}`" class="spin">
              <div class="spinItem front">
                <div class="mypaginationImgSize">
                  <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl">
                  <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
                </div>
              </div>
              <div class="spinItem back">
                <div class="mypaginationImgSize">
                  <p class="mypaginationPostcardName">made by</p>
                  <p class="mypaginationPostcardName" @click="goUserPage(postcard.postcard.userSeq)" style="margin-top: 0px; cursor: pointer;">{{postcard.userId}}</p>
                  <div style="position: absolute; top: 11vw; left: 3.5vw; cursor: pointer;">
                    <p v-show="!postcard.postcard.isLiked" :id="`l${postcard.postcard.postcardSeq}`" @click="dolikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="">좋아요</p>
                    <p v-show="postcard.postcard.isLiked" :id="`dl${postcard.postcard.postcardSeq}`" @click="dodislikeLetter(postcard.postcard.postcardSeq)" class="mypaginationPostcardName" style="margin-left: -0.5vw">좋아요 취소</p>
                  </div>
                </div>
              </div>
            </div>
          </div>



        <!-- <div class="mypaginationPostcardList" style="margin-left: 0vw;">
          <div v-for="(postcard, idx) in this.userLikedPostcard.postcardList.slice(index * 12 + 8, index * 12 + 12)" :key="`likedPostcard-${page}-${idx}`" class="mypaginationImgSize">
            <img class="mypaginationPostcardImg" v-bind:src="postcard.postcard.postcardImgUrl" @click="selPostcard(postcard.postcard.postcardImgUrl)">
            <p v-for="(tag, idx) in postcard.tag" :key="idx" class="tagForm">#{{tag}} &nbsp;</p>
          </div>
        </div> -->


      </div>
      
      </div>
      </div>
    </div>
    <div v-else>
      <div style="font-size:5vw; margin-top: 10vw; margin-bottom: 3vw;">좋아요한 엽서가 없습니다...</div>
      <div v-if="this.isOwner" @click="goHome" style="font-size:3vw; margin-bottom: 10vw; cursor: pointer;">메인페이지에서 마음에 드는 엽서를 찾아보세요!</div>
      <!-- <div class="mpButton" @click="goLetter">엽서 만들기</div> -->
    </div>
    <div class="leftRight"></div>












    <div v-if="isOwner" class="followUsers">
      <p id="goFollowing" class="profileText">Following</p>
    </div> 
    <!-- 유저가 기부한 엽서들 페이지네이션해서 보여주는 부분 -->
    <div v-if="isOwner">
      <div class="mypaginationText">{{Math.ceil(this.followList.length)}}명</div>
      <div v-for="(follow, idx) in this.followList" :key="idx" in class="" style="font-size: 4vw;">
        {{follow.followId}}
      </div>
    </div>

  
  </div>
  
  
  <br>
  <br>
  <br>
  <br>
</div>

<!-- 컬렉션 창 -->
<div v-if="showRemind" style="z-index: 900; position: relative;">

<!-- 좋아하는 엽서 목록 1 -->
  <favorite-postcards-a v-if="ownerInfo.userTemplate === 1" style="position: fixed; top: 3vh; left: 50%; transform: translate(-50%, 0);" class=""></favorite-postcards-a>

<!-- 좋아하는 엽서 목록 2 -->
  <favorite-postcards-b v-if="ownerInfo.userTemplate === 2" style="position: fixed; top: 3vh; left: 50%; transform: translate(-50%, 0);" class="d-flex justify-content-center"></favorite-postcards-b>

<!-- 좋아하는 엽서 목록 3 -->
  <favorite-postcards-c v-if="ownerInfo.userTemplate === 0" style="position: fixed; top: 3vh; left: 50%; transform: translate(-50%, 0);" class="d-flex justify-content-center"></favorite-postcards-c>
  
  <div type="button" @click="showCollection" style="width: 4vw; height: 4vw; font-size: 7vw; top: 1.5%; left: 80vw; position: fixed; z-index: 900;">X</div>
  
  <div v-if="isOwner" @click="showChangeTemplate" class="mpButton" data-bs-toggle="modal" data-bs-target="#changeTemplate" style="top: 5%; left: 85vw; position: fixed; z-index: 900;" for="changeImg">
  템플릿 변경
  </div>
</div>



<!-- 탬플릿 선택 Modal -->
<div class="modal fade" id="changeTemplate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal--choice-size">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">템플릿 선택</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="d-flex" style="vertical-align: center;">
          <div @click="tempChoice(0)" class="temp1"></div>
          <p @click="tempChoice(0)" class="mpButton" data-bs-toggle="modal" data-bs-target="#changeTemplate" style="margin-top: 14vw;">
           선택
          </p>
        </div>

        <div class="d-flex" style="vertical-align: center;">
          <div @click="tempChoice(1)" class="temp2"></div>
          <p @click="tempChoice(1)" class="mpButton" data-bs-toggle="modal" data-bs-target="#changeTemplate" style="margin-top: 14vw;">
           선택
          </p>
        </div>
      </div>
    </div>
  </div>
</div>




<!-- 탬플릿 기부 선택 Modal -->
<div class="modal fade" id="choiceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-size" style="margin-bottom: 5vw;">
    <div class="modal-content" style="padding-top: 2vw; margin-bottom: 5vw;">
      
      <div type="button" data-bs-dismiss="modal" aria-label="Close" style="width: 4vw; height: 4vw; font-size: 7vw; top: 3%; left: 80vw; position: fixed; z-index: 900;">X</div>
      
      <div v-if="Math.ceil(this.donationList.length / 12)">
        <div class="choicePaginationPage">
          <div class="d-flex mypaginationTitle">
            <h3 class="mypaginationText">당신의 기부목록</h3>
            <h3 class="mypaginationText">추억할 사진을 선택하세요</h3>
            <div class="d-flex mypaginationText">
              <i class="bi bi-chevron-left" @click="postcardMove('D-left')"></i>
              <b v-if="Math.ceil(this.donationList.length / 12)">{{this.donationStage +1}} / {{Math.ceil(this.donationList.length / 12)}}</b>
              <b v-else>0 / 0</b>
              <i class="bi bi-chevron-right" @click="postcardMove('D-right')"></i>
            </div>
          </div>
          
        <div v-for="(page, index) in Math.ceil(this.donationList.length / 12)"
          :key="`page-${index}`" >

          <div v-if="index === this.donationStage" data-aos="flip-left" data-aos-duration="200">
            
            <!-- 앞면 -->
            <div class="mypaginationPostcardList">
              <div v-for="(donation, idx) in this.donationList.slice(index * 12, index * 12 + 4)" :key="`postcard-${page}-${idx}`" class="spin">
                
                  <div class="spinItem front" style="cursor: pointer;" data-bs-dismiss="modal" aria-label="Close" @click="templateChange(donation.donationSeq)">
                    <div class="mypaginationImgSize">
                      <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
                      <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
                    </div>
                  </div>
                  <div class="spinItem back" style="cursor: pointer;" data-bs-dismiss="modal" aria-label="Close" @click="templateChange(donation.donationSeq)">
                    <div class="mypaginationImgSize">
                      <p class="mypaginationPostcardName">{{donation.donationText}}</p>
                      <div v-if="isOwner" style="position: absolute; top: 12vw;">
                        <div class="mypaginationPostcardName">후원금액</div>
                        <div class="mypaginationPostcardName">{{donation.donationPay}} 원</div>
                      </div>
                    </div>
                  </div>

              </div>
            </div>
              
            <div class="mypaginationPostcardList">
              <div v-for="(donation, idx) in this.donationList.slice(index * 12 + 4, index * 12 + 8)" :key="`postcard-${page}-${idx}`" class="spin">
                
                  <div class="spinItem front" style="cursor: pointer;" data-bs-dismiss="modal" aria-label="Close" @click="templateChange(donation.donationSeq)">
                    <div class="mypaginationImgSize">
                      <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
                      <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
                    </div>
                  </div>
                  <div class="spinItem back">
                    <div class="mypaginationImgSize" style="cursor: pointer;" data-bs-dismiss="modal" aria-label="Close" @click="templateChange(donation.donationSeq)">
                      <p class="mypaginationPostcardName">{{donation.donationText}}</p>                  
                      <div v-if="isOwner" style="position: absolute; top: 12vw;">
                        <div class="mypaginationPostcardName">후원금액</div>
                        <div class="mypaginationPostcardName">{{donation.donationPay}} 원</div>
                      </div>
                    </div>
                  </div>
                  
              </div>
            </div>

            <div class="mypaginationPostcardList">
              <div v-for="(donation, idx) in this.donationList.slice(index * 12 + 8, index * 12 + 12)" :key="`postcard-${page}-${idx}`" class="spin">
                
                  <div class="spinItem front" style="cursor: pointer;" data-bs-dismiss="modal" aria-label="Close" @click="templateChange(donation.donationSeq)">
                    <div class="mypaginationImgSize">
                      <img class="mypaginationPostcardImg" v-bind:src="donation.donationImgUrl" @click="selPostcard(donationList.donationImgUrl)">
                      <p class="mypaginationPostcardName">{{donation.foundationName}}</p>
                    </div>
                  </div>
                  <div class="spinItem back" style="cursor: pointer;" data-bs-dismiss="modal" aria-label="Close" @click="templateChange(donation.donationSeq)">
                    <div class="mypaginationImgSize">
                      <p class="mypaginationPostcardName">{{donation.donationText}}</p>
                      <div v-if="isOwner" style="position: absolute; top: 12vw;">
                        <div class="mypaginationPostcardName">후원금액</div>
                        <div class="mypaginationPostcardName">{{donation.donationPay}} 원</div>
                      </div>
                    </div>
                  </div>
                  
              </div>
            </div>

          </div>
          </div>
        </div>
      </div>

      <div v-else>
        <div style="font-size:5vw; margin-top:10vw;">기부목록이 없습니다...</div>
        <div v-if="this.isOwner" class="mpButton" data-bs-dismiss="modal" aria-label="Close" style="margin-bottom:10vw;" @click="goDonation">기부하러가기</div>
      </div>

    </div>
  </div>
</div>




</template>

<script>
import { likeLetter, dislikeLetter } from "@/api/mainpage.js";
import AOS from 'aos';
import "aos/dist/aos.css";
import html2canvas from 'html2canvas';
import SideBar from "@/components/Nav/SideBar.vue";
import FavoritePostcardsA from "@/components/Collection/favoritePostcardsA.vue";
import FavoritePostcardsB from "@/components/Collection/favoritePostcardsB.vue";
import FavoritePostcardsC from "@/components/Collection/favoritePostcardsC.vue";
import { mapActions, mapGetters } from "vuex";
const mypageStore = "mypageStore";
const accountStore = "accountStore";
const postcardStore = "postcardStore";


export default {
  name: "MypageView",

  components: {
    SideBar,
    FavoritePostcardsA,
    FavoritePostcardsB,
    FavoritePostcardsC,
  },

  data() {
    return {
      // 탬플릿 변경 관련 함수
      // 
      isFollow: 0,
      changeTemplateNum: 0,
      showUpdate : false,
      isShowChangeTemplate: 0,
      ownerSeq: 0,
      isOwner: 0,
      test: true,
      showRemind: false,
      profileImg: '',
      defaultProfile: { imageUrl: require("../../public/images/mypageDummyImage.png")},
      
      // 페이지네이션
      donationStage: 0,
      postcardStage: 0,
      followingStage: 0,
      likedPostcardStage: 0,
    };
  },


  computed: {
    ...mapGetters(mypageStore, [
      "donationList",
      "followList",
      "myFollowList",
      "profileImage",
      "mypageUserInfo",
      "ownerInfo",
      "userRemind",
    ]),
    ...mapGetters(accountStore, [
      "userInfo",
      "token",
    ]),
    ...mapGetters(postcardStore, [
      "postcardList",
      "userLikedPostcard",
      "likedPostcards",
    ]),
  },


  methods: {
    ...mapActions(mypageStore, [
      "userSecession",
      "updateUserInfo",
      "changeUserProfile",
      "getDonationList",
      "getFollowerList",
      "getMyFollowerList",
      "setMypageUserInfo",
      "setOwnerInfo",
      "changeTemplate",
      "changeRemind",
      "follow",
      "unFollow",
    ]),
    ...mapActions(postcardStore, [
      "userPostcardList",
      "getUserLikedPostcard",
      "userLikedPostcardStore",
    ]),

    doFollow() {
      this.follow({ myId: this.userInfo.userId, followId: this.ownerInfo.userId })
      this.isFollow = 1
    },

    doUnFollow() {
      this.unFollow({ myId: this.userInfo.userId, followId: this.ownerInfo.userId })
      this.isFollow = 0
    },

    tempChoice(tempN) {
      this.changeTemplate({ userSeq: this.userInfo.userSeq, userTemplate: {userTemplate: tempN} })
      setTimeout(() => {
        this.$router.go()
      }, 100)
    },

    async dolikeLetter(postcardSeq) {
      // console.log(postcardSeq)
      const likes = document.querySelectorAll(`#l${postcardSeq}`)
      likes.forEach((like) => {
        // console.log(like)
        like.style.display = 'none'
      })
      const dislikes = document.querySelectorAll(`#dl${postcardSeq}`)
      dislikes.forEach((dislike) => {
        // console.log(dislike)
        dislike.style.display = 'block'
      })

      await likeLetter(postcardSeq, this.userInfo.userSeq);
    },
    async dodislikeLetter(postcardSeq) {
      // console.log(postcardSeq)
      const likes = document.querySelectorAll(`#l${postcardSeq}`)
      likes.forEach((like) => {
        // console.log(like)
        like.style.display = 'block'
      })
      const dislikes = document.querySelectorAll(`#dl${postcardSeq}`)
      dislikes.forEach((dislike) => {
        // console.log(dislike)
        dislike.style.display = 'none'
      })
      await dislikeLetter(postcardSeq, this.userInfo.userSeq);
    },

    templateChange(url) {
      const templateInfo = { userSeq: this.userInfo.userSeq, uesrRemind: this.userRemind, donationSeq: url }
      
      this.changeRemind(templateInfo)
      this.$router.go()
    },

    // 메인으로
    goHome() {      
      this.$router.push('/search');
    },

    // 엽서만들러가기
    goLetter() {      
      this.$router.push('/makecard');
    },

    // 기부하러가기
    goDonation() {
      this.$router.push('/donation')
    },

    // 다른유저 페이지로 가는 함수
    async goUserPage(userSeq) {
    this.ownerSeq = userSeq
    // console.log('유저시퀀스, 마이페이지 주인 시퀀스')
    // console.log(this.userInfo.userSeq, this.ownerSeq)
    if (this.userInfo.userSeq === this.ownerSeq) {
      this.isOwner = 1
    }
    
    // 스토어에서 user_seq 들고와서 넣어줘야됨
    await this.setOwnerInfo(this.ownerSeq)
    await this.getDonationList(this.ownerSeq)
    await this.getFollowerList(this.ownerInfo.userId)
    await this.userPostcardList(this.ownerSeq)
    await this.getUserLikedPostcard(this.ownerSeq)
    await this.userLikedPostcardStore(this.userInfo.userSeq)
    // 기부총액, 기부횟수 계산
    let donationCnt = this.donationList.length
    let donationMoney = 0
    this.donationList.forEach(dontaion => {
      donationMoney += dontaion.donationPay
    });
    this.setMypageUserInfo({donationCnt: donationCnt, donationMoney: donationMoney })
    this.profileImg = this.ownerInfo.userProfileUrl

    // console.log(this.userLikedPostcard)
    this.$router.push({path: `/mypage/${userSeq}`, query: {ownerSeq: userSeq}});
    },

    // 컬렉션 정보 변경 창 띄우기
    showChangeTemplate() {
      this.isShowChangeTemplate = !this.isShowChangeTemplate
    },

    // 컬랙션 보기
    showCollection() {
      this.showRemind = !this.showRemind
      // console.log(this.showRemind)
    },

    // 엽서 목록 변경
    postcardMove(direction) {
      // 만든 엽서 목록 페이지 변경
      if (direction === 'left' && this.postcardStage > 0) {
        this.postcardStage -= 1
      } else if (direction === 'right' && this.postcardStage < Math.ceil(this.postcardList.length / 12) - 1) {
        this.postcardStage += 1
      // 좋아요한 엽서 목록 페이지 변경
      } else if (direction === 'L-left' && this.likedPostcardStage > 0) {
        this.likedPostcardStage -= 1
      } else if (direction === 'L-right' && this.likedPostcardStage < Math.ceil(this.userLikedPostcard.postcardList.length / 12) - 1) {
        this.likedPostcardStage += 1
      //  
      } else if (direction === 'D-left' && this.donationStage > 0) {
        this.donationStage -= 1
      } else if (direction === 'D-right' && this.donationStage < Math.ceil(this.donationList.length / 12) - 1) {
        this.donationStage += 1
      }
    },
    
    goProfile() {
      // document 와 element 사이의 거리를 구한다
      const getElementY = (element) => {
        return window.pageYOffset + element.getBoundingClientRect().top
      }
      // 해당 element 로 스크롤!
      window.scrollTo(0, getElementY(document.getElementById('goProfile')))
    },
    goDonations() {
      // document 와 element 사이의 거리를 구한다
      const getElementY = (element) => {
        return window.pageYOffset + element.getBoundingClientRect().top
      }
      // 해당 element 로 스크롤!
      window.scrollTo(0, getElementY(document.getElementById('goDonations')))      

    },
    goLikedPostcards() {
      // document 와 element 사이의 거리를 구한다
      const getElementY = (element) => {
        return window.pageYOffset + element.getBoundingClientRect().top
      }
      // 해당 element 로 스크롤!
      window.scrollTo(0, getElementY(document.getElementById('goLikedPostcards')))
    },
    goMade() {
      // document 와 element 사이의 거리를 구한다
      const getElementY = (element) => {
        return window.pageYOffset + element.getBoundingClientRect().top
      }
      // 해당 element 로 스크롤!
      window.scrollTo(0, getElementY(document.getElementById('goMade')))
    },
    goFollowing() {
      // document 와 element 사이의 거리를 구한다
      const getElementY = (element) => {
        return window.pageYOffset + element.getBoundingClientRect().top
      }
      // 해당 element 로 스크롤!
      window.scrollTo(0, getElementY(document.getElementById('goFollowing')))
    },


    // 회원탈퇴
    secession() {
      // 스토어에서 user_seq 들고와서 넣어줘야됨
      this.userSecession(this.userInfo.userSeq)
    },

    showUpdateInfo() {
      this.showUpdate = !this.showUpdate
    },

    // 유저정보 업데이트
    updateInfo() {
      // updateInfo = { user_seq: , info: { userPassword: , userPhone: , userEmail: } }
      this.updateUserInfo(this.updateInfo)
    },

    async tempImg(image) {
      this.profileImg = URL.createObjectURL(image.target.files[0])
      setTimeout(() => {
        this.changeProfile()
      }, 100)
    },

    async changeProfile() {
      const element = document.getElementById("profileImg");
      const canvas = await html2canvas(element);
      // console.log('canvas')
      // console.log(canvas)
      const dataUrl = canvas.toDataURL("image/png");
      const blobData = this.dataURItoBlob(dataUrl);
      const now = new Date();
      // 파일 이름
      const filename = `yeupseo-${this.userInfo.userSeq}${now.getHours()}${now.getMinutes()}${now.getSeconds()}.png`
      // 파일 만들기
      const tempFile = new File([blobData], filename, { type: 'image/png' });
      // 폼데이터
      let canvasData = new FormData;
      canvasData.append('profile', tempFile); // 생성된 canvasData 정해진 uri로 axios 요청 보내면 될 듯
      await this.changeUserProfile({ user_seq: this.ownerInfo.userSeq, profile: canvasData })
      this.pageReload()  
    },
    
    pageReload() {
      this.$router.go()
    },

    dataURItoBlob(dataURI) {
      var binary = atob(dataURI.split(',')[1]);
      var array = [];
      for (var i = 0; i < binary.length; i++) {
        array.push(binary.charCodeAt(i));
      }
      return new Blob([new Uint8Array(array)], { type: 'image/png' });
    },

    showPostcards() {
        this.showRemind = !this.showRemind
    },

    choseImage() {
        this.showImages[0].imageUrl = require("../../public/images/test1.jpg")
    }
  },


  async created() {
    
    // console.log(this.postcardList)
    
    // console.log('크리에이트가 되나?')
    this.ownerSeq = Number(this.$route.query.ownerSeq)
    // console.log('유저시퀀스, 마이페이지 주인 시퀀스')
    // console.log(this.userInfo.userSeq, this.ownerSeq)
    if (this.userInfo.userSeq === this.ownerSeq) {
      this.isOwner = 1
    }
    
    // 스토어에서 user_seq 들고와서 넣어줘야됨
    await this.setOwnerInfo(this.ownerSeq)
    await this.getDonationList(this.ownerSeq)
    await this.getFollowerList(this.ownerInfo.userId)
    await this.getMyFollowerList(this.userInfo.userId)
    await this.userPostcardList(this.ownerSeq)
    await this.getUserLikedPostcard(this.ownerSeq)
    await this.userLikedPostcardStore(this.userInfo.userSeq)
    // 기부총액, 기부횟수 계산
    let donationCnt = this.donationList.length
    let donationMoney = 0
    await this.postcardList.forEach((mPostcard) =>{
      mPostcard.postcard.isLiked = false
      this.likedPostcards.forEach((lPostcard) => {
        if (lPostcard.postcard.postcardSeq === mPostcard.postcard.postcardSeq) {
          mPostcard.postcard.isLiked = true;
          return false;
        }
      })
    });
    await this.userLikedPostcard.postcardList.forEach((mPostcard) =>{
      mPostcard.postcard.isLiked = false
      this.likedPostcards.forEach((lPostcard) => {
        if (lPostcard.postcard.postcardSeq === mPostcard.postcard.postcardSeq) {
          mPostcard.postcard.isLiked = true;
          return false;
        }
      })
    });
    await this.donationList.forEach(dontaion => {
      donationMoney += dontaion.donationPay
    });
    if (!this.isOwner) {
      // const follow = document.querySelector('#follow')
      // follow.style.display = 'block'
      console.log(this.myFollowList)
      await this.myFollowList.forEach(follower => {
        if (follower.followId === this.ownerInfo.userId) {
          this.isFollow = 1
          console.log('ddddddd')
          // const follow = document.querySelector('#follow')
          // follow.style.display = 'none'
          // const unFollow = document.querySelector('#unFollow')
          // unFollow.style.display = 'block'
        }
      });
    }
    console.log(this.followList)
    await this.setMypageUserInfo({donationCnt: donationCnt, donationMoney: donationMoney })
    this.profileImg = this.ownerInfo.userProfileUrl
    AOS.init()    
  },


  async mounted() {
    await window.scrollTo({ left: 0, top: 0, behavior: "smooth" });
    this.ownerSeq = Number(this.$route.query.ownerSeq)
    // console.log('유저시퀀스, 마이페이지 주인 시퀀스')
    // console.log(this.userInfo.userSeq, this.ownerSeq)
    if (this.userInfo.userSeq === this.ownerSeq) {
      this.isOwner = 1
    }
    
    // 스토어에서 user_seq 들고와서 넣어줘야됨
    await this.setOwnerInfo(this.ownerSeq)
    await this.getDonationList(this.ownerSeq)
    await this.getFollowerList(this.ownerInfo.userId)
    // await this.userPostcardList(this.ownerSeq)
    // await this.getUserLikedPostcard(this.ownerSeq)
    // 기부총액, 기부횟수 계산
    let donationCnt = this.donationList.length
    let donationMoney = 0
    await this.donationList.forEach(dontaion => {
      donationMoney += dontaion.donationPay
    });
    await this.setMypageUserInfo({donationCnt: donationCnt, donationMoney: donationMoney })
    this.profileImg = this.ownerInfo.userProfileUrl

    // console.log(screen.width)
    // console.log(screen.height)
    console.log('마운티드')
    console.log(this.ownerInfo)
    

    // 캐러셀

    // Hover-Carousel component
    // By Yair Even-Or
    // written in jQuery 2013 -> refactored to vanilla 2020
    // https://github.com/yairEO/hover-mypageCarousel

    function HoverCarousel( elm ){
      this.DOM = {
        scope: elm,
        wrap: elm.querySelector('ul').parentNode,
      }
      
      this.containerWidth = 0;
      this.scrollWidth = 0;
      this.posFromLeft = 0;    // Stripe position from the left of the screen
      this.stripePos = 0;    // When relative mouse position inside the thumbs stripe
      this.animated = null;
      this.callbacks = {}
      
      this.init()
    }

    HoverCarousel.prototype = {
      init(){
        this.bind()
      },
      
      destroy(){
        this.DOM.scope.removeEventListener('mouseenter', this.callbacks.onMouseEnter)
        this.DOM.scope.removeEventListener('mousemove', this.callbacks.onMouseMove)
      },

      bind(){
        this.callbacks.onMouseEnter = this.onMouseEnter.bind(this)
        this.callbacks.onMouseMove = e => {
          if( this.mouseMoveRAF ) 
            cancelAnimationFrame(this.mouseMoveRAF)

          this.mouseMoveRAF = requestAnimationFrame(this.onMouseMove.bind(this, e))
        }
        
        this.DOM.scope.addEventListener('mouseenter', this.callbacks.onMouseEnter)
        this.DOM.scope.addEventListener('mousemove', this.callbacks.onMouseMove)
      },
      
      // calculate the thumbs container width
      onMouseEnter(e){
        this.nextMore = this.prevMore = false // reset

        this.containerWidth       = this.DOM.wrap.clientWidth;
        this.scrollWidth          = this.DOM.wrap.scrollWidth; 
        // padding in percentage of the area which the mouse movement affects
        this.padding              = 0.2 * this.containerWidth; 
        this.posFromLeft          = this.DOM.wrap.getBoundingClientRect().left;
        var stripePos             = e.pageX - this.padding - this.posFromLeft;
        this.pos                  = stripePos / (this.containerWidth - this.padding*2);
        this.scrollPos            = (this.scrollWidth - this.containerWidth ) * this.pos;

        // temporary add smoothness to the scroll 
        this.DOM.wrap.style.scrollBehavior = 'smooth';
        
        if( this.scrollPos < 0 )
          this.scrollPos = 0;
        
        if( this.scrollPos > (this.scrollWidth - this.containerWidth) )
          this.scrollPos = this.scrollWidth - this.containerWidth

        this.DOM.wrap.scrollLeft = this.scrollPos
        this.DOM.scope.style.setProperty('--scrollWidth',  (this.containerWidth / this.scrollWidth) * 100 + '%');
        this.DOM.scope.style.setProperty('--scrollLleft',  (this.scrollPos / this.scrollWidth ) * 100 + '%');

        // lock UI until mouse-enter scroll is finihsed, after aprox 200ms
        clearTimeout(this.animated)
        this.animated = setTimeout(() => {
          this.animated = null
          this.DOM.wrap.style.scrollBehavior = 'auto';
        }, 200)

        return this
      },

      // move the stripe left or right according to mouse position
      onMouseMove(e){
        // don't move anything until inital movement on 'mouseenter' has finished
        if( this.animated ) return

        this.ratio = this.scrollWidth / this.containerWidth
        
        // the mouse X position, "normalized" to the mypageCarousel position
        var stripePos = e.pageX - this.padding - this.posFromLeft 
        
        if( stripePos < 0 )
            stripePos = 0

        // calculated position between 0 to 1
        this.pos = stripePos / (this.containerWidth - this.padding*2) 
        
        // calculate the percentage of the mouse position within the mypageCarousel
        this.scrollPos = (this.scrollWidth - this.containerWidth ) * this.pos 

        this.DOM.wrap.scrollLeft = this.scrollPos
        
        // update scrollbar
        if( this.scrollPos < (this.scrollWidth - this.containerWidth) )
          this.DOM.scope.style.setProperty('--scrollLleft',  (this.scrollPos / this.scrollWidth ) * 100 + '%');

        // check if element has reached an edge
        this.prevMore = this.DOM.wrap.scrollLeft > 0
        this.nextMore = this.scrollWidth - this.containerWidth - this.DOM.wrap.scrollLeft > 5
        
        this.DOM.scope.setAttribute('data-at',
          (this.prevMore  ? 'left ' : ' ')
          + (this.nextMore ? 'right' : '')
        )
      }
    }
              
    var madeList = document.querySelector('#madeList')
    var followElm = document.querySelector('#followingList')
    var likedList = document.querySelector('#likedList')
    var donationList = document.querySelector('#donationList')
    new HoverCarousel(madeList)
    new HoverCarousel(followElm)
    new HoverCarousel(likedList)
    new HoverCarousel(donationList)
      },
    }
</script>

<style>

.temp1 {
  cursor: pointer;
  width: 30vw;
  height: 30vw;
  margin-bottom: 5vw;
  background-image: url(../../public/images/temp1Ex.png);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}

.temp2 {
  cursor: pointer;
  width: 30vw;
  height: 30vw;
  margin-bottom: 5vw;
  background-image: url(../../public/images/temp2Ex.PNG);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}

.bi {
  cursor: pointer;
}
.bi:hover {
  font-style:italic;
  color:rgb(169, 169, 169);
}
/* 페이지네이션 */
.mypaginationTitle {
  /* margin: auto; */
  justify-content: space-between;
  width: 100%;
  font-size: 3vw;
}
.mypaginationText {
  margin-top: 1vh;
  margin-bottom: 1vh;
  font-size: 3vw;
}
.mypaginationPostcardList {
  position: relative;
  display: flex;
  width: 100%;
  margin: 0 auto;
  margin-left: -2.5vw;
}
/* .mypaginationPostcardSmallList {
  display: flex;
} */
.mypaginationPostcardImg{
  width: 11vw;
  height: 11vw;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}
.mypaginationImgSize {
  position: relative;
  width: 12vw;
  margin-left: 2.5vw;
  height: 17vw;
  padding-top: 1vw;
  margin-top: 3vw;
  background-color: #faf8f5;
  overflow: hidden;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}

.spin {
  /* 부모의 자식 요소가 3차원의 애니메이션 효과를 가질때, 300px의 거리에서 보는 원근감을 줌 */
  margin-left: 2.5vw;
  width: 12vw;
  perspective: 500px;
}

.spin .spinItem {
  /*카드의 뒷면을 안보이게 처리-카드가 뒤집히면 뒷면이 안보임*/
  backface-visibility: hidden;
  transition: 0.7s;
}

.spin .spinItem.front {
  /* 앞면 카드가 부유하게 되어, 뒷면 카드가 아래에서 위로 올라감 -> 요소 두개가 겹치게 됨*/
  position: absolute;
  /* 명시적으로 기본값 설정, 없어도 됨*/
  transform: rotateY(0deg);
}

.spin:hover .spinItem.front {
  transform: rotateY(180deg);
}
.spin .spinItem.back {
  transform: rotateY(-180deg);
}
.spin:hover .spinItem.back {
  transform: rotateY(0deg);
}

.mypaginationPostcardName {
  display: inline-block;
  margin-top: 1vw;
  margin-left: 1vw;
  margin-right: 1vw;
  font-size: 2vw;
  /* text-align: center */
}
.tagForm {
  display: inline-block;
  margin-top: 1.5vw;
  font-size: 1.5vw;
  /* text-align: center */
}


.leftRight {
  /* position: fixed; */
  border-top : solid black;
  width: 0.01px;
  /* top: 15vh;
  left: 15vw; */
  /* height: 70vh; */
  width: 65vw;
  margin-left: 11.5vw;
  margin-top: 7vh;
  margin-bottom: 10vh;
  opacity: 0.1;
  z-index: 10000;
}
.mypageNav {
  position: fixed;
  top: 30vh;
  left: 3.5vw;
}
.updown {
  position: fixed;
  border-left : solid black;
  width: 0.01px;
  top: 15vh;
  left: 15vw;
  height: 70vh;
  opacity: 0.2;
}
.mypageBtn {
  cursor: pointer;
  width: 10vw;
  height: 7vh;
  font-size: 1.7vw;
  text-align: left;
  transition: 0.4s;
}
.mypageBtn:hover {
  cursor: pointer;
  width: 10vw;
  height: 7vh;
  font-size: 1.7vw;
  color: #bcbcbc;
  text-align: left;
  transition: 0.4s;
}

.Mypage {
  position: relative;
  height: 100%;
  width: 94vw;
  /* background-image: url(../../public/images/mypageBackground.jpg);
  background-repeat: no-repeat;
  background-size: 100% 100%;
  background-attachment: fixed; */
  /* background-color: #faf8f5; */
  /* background-color: whitesmoke; */
}

.paginationPage {
  height: 70vw;
  width: 60vw;
  margin: 0 auto;
  /* border:#555; */
}
.choicePaginationPage {
  height: 70vw;
  width: 60vw;
  margin: 0 auto;

}
.profileTitle {
  position: sticky;
  width: 98vw;
  background-color: #faf8f5;
  margin: 0 auto;
  padding-bottom: 1vh;
  padding-top: 1vh;
  /* margin-top: 5vh; */
  text-align: center;
  font-size: 8vh;
  font-family: 'Nanum Pen Script', cursive;;
}
.profileText {
  margin: 0 auto;
  margin-top: 5vh;
  font-size: 8vh;
  font-family: 'Nanum Pen Script', cursive;;
}
.myInfo {
  /* position: absolute; */
  /* margin-bottom: 0vh; */
  /* padding: 0 5vw; */
  /* width: 100vw; */
}
.myProfileBox {
  /* background-color: #faf8f5; */
  background-color: #faf8f5;
  margin: 0 auto;
  margin-top: 5vh;
  /* border-radius: 30px; */
  padding: 3vh;
  width: 60vw;
  height: 50vh;
  box-sizing: border-box;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}
.myProfileImage {
  margin: 0 auto;
  padding-top: 0vw; 
  /* padding-bottom: 4vw;  */
  width: 15vw;
  height: 15vw;
}
.myProfileImageBox {
  margin: 0 auto;
  padding-top: 2vw; 
  margin-left: 7vw;
  border-radius: 25%;
  width: 17vw;
  box-sizing: border-box;
}
.myProfileInfo {
  margin: 0 auto;
  padding: 3vh;
  width: 30vw;
  height: 40vh;
  border-radius: 20px;
  background-color: #ffffff;
  box-shadow: 0.5vw 0.5vw 1vw rgba(0, 0, 0, 0.15);
}

/* 모든 카드 보여주는 부분 */
.allCardsTitle {
  font-size: 3vw;
  font-family: 'Nanum Pen Script', cursive;;
  cursor : pointer;
  z-index: 3000;
}
.allCards {
  margin: 0 auto;
  padding: 0 5vw;
  max-width: 80vw;
}


/* 캐러셀 */
.mypageCarousel {
  display: block;
  font-size: 0;
  border-radius: 8px;
  padding: 3.5vh;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
  /* background: white; */
  background-color: #faf8f5;
  transform: translateZ(0);
  height: 30vh;
  -webkit-overflow-scrolling: touch;
  /* for tablets */
}
.touch .mypageCarousel {
  overflow: auto;
}
.mypageCarousel[data-at*=left] > .wrap::before {
  opacity: 1;
  text-indent: -50px;
}
.mypageCarousel[data-at*=right] > .wrap::after {
  opacity: 1;
  text-indent: -50px;
}
.mypageCarousel::after {
  content: "";
  pointer-events: none;
  position: absolute;
  z-index: 4;
  bottom: -4px;
  left: 0;
  background: #d8872b;
  height: 4px;
  border-radius: 4px;
  opacity: 0;
  width: var(--scrollWidth, 0);
  left: var(--scrollLleft, 0);
  transition: opacity 0.2s, bottom 0.2s;
}
.mypageCarousel:hover::after {
  opacity: 1;
  bottom: -10px;
}
.mypageCarousel > .wrap {
  overflow: hidden;
  border-radius: 4px;
}
.mypageCarousel > .wrap::before, .mypageCarousel > .wrap::after {
  content: "‹";
  opacity: 0;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  z-index: 2;
  width: 5vw;
  font-size: 10vw;
  font-family: monospace;
  color: #555;
  font-weight: bold;
  border-radius: 2vw;
  pointer-events: none;
  transition: 0.2s ease-out;
  background: linear-gradient(to right, white 20%, transparent);
}
.mypageCarousel > .wrap::after {
  transform: rotate(180deg);
  left: auto;
  right: 0;
}
.mypageCarousel > .wrap > ul {
  list-style: none;
  white-space: nowrap;
  height: 18vh;
}
.mypageCarousel > .wrap > ul > li {
  display: inline-block;
  vertical-align: middle;
  height: 18vh;
  margin: 0 0 0 1vw;
  position: relative;
  /* overflow: hidden; */
  transition: 0.25s ease-out;
}
.mypageCarousel > .wrap > ul > li:first-child {
  margin: 0;
}
.cardItem {
  height: 12vh;
  border-radius: 10px;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  box-shadow: 0 0.5vw 1vw rgba(0, 0, 0, 0.15);
}
.mypageCarousel {
  width: 60vw;
  height: 18vh;
  margin: auto;
  margin-bottom: 7vh;
}


/* 팔로잉한 유저 보여주는 부분 */
.followUsers {
  margin: 0 auto;
  padding: 0 5vh;
  max-width: 200vh;
  transition:all 5s ease;

}
.followUserList {
  display: flex;
  justify-content: space-between;
  justify-content: space-between;
  max-width: 150vh;
  margin: 40px auto 0;
}
.followUserItem {
  background: #fff;
  border-radius: 30px;
  padding: 40px 40px 35px;
  width: 47.2%;
  box-sizing: border-box;
}


.mpButton {
  /* position: absolute; */
  /* transform: translate(-50%, -50%); */
  margin: 0 auto;
  margin-top: 1vw;
  height: 7vh;
  width: 10vw;
  cursor: pointer;
  border-radius: 20px;
  font-size: 2vw;
  color: #fcf4e0;
  background-color: #fd8a69;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.15);
  line-height: 7vh;
  vertical-align: middle;
  transition: 0.4s;
}
.mpButton:hover {
  background-color: #e85b34;
}

.modal-size {
    /* position: fixed; */
    /* margin: 0 auto; */
    max-width:90vw;
    width: 75vw;
    height: 70vw;
    
    /* overflow: hidden; */
}
.modal--choice-size {
    /* position: fixed; */
    /* margin: 0 auto; */
    max-width:90vw;
    width: 75vw;
    height: 70vw;
    background-image: url(../../public/images/foundationBack.jpg);
    background-repeat: no-repeat;
    background-size: 100% 100%;
    overflow: hidden;
}

</style>