<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PODO</title>
	
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />
    <link rel="stylesheet" href="src/css/style.css" />
            <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
    <style>
      #mypage {
        width: 100%;
        height: 50px;
        text-align: center;
        line-height: 50px;
        border-top: 1px solid silver;
        border-bottom: 1px solid silver;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      #mypage > img {
        width: 30px;
        height: 30px;
        border-radius: 40px;
        margin-left: 10px;
      }
      #mypage > span {
        width: 140px;
        text-align: left;
        margin-left: 10px;
      }
      .tog {
        width: 140px;
        right: 24px;
        padding: 10px 0px;
        top: 150px;
        float: right;
        border: none;
        position: absolute;
        border-radius: 4px;
        display: none;
        background: #222;
        opacity: 0.9;
      }
      .playlist img{
      	width:20px;
      }
      #playPrev:hover, #playNext:hover, #playBtn:hover {
      	cursor:pointer;
      }
    </style>
  </head>
  <body>
    <div class="wrap">
      <div id="Header">
        <h1 id="logo">
          <a href="home.jsp"><img src="image/web/logo-f-5.png" alt="" /></a>
        </h1>
        <div id="LoginBox">
          <c:choose>
            <c:when test="${loginEmail != null}">
              <div id="mypage">
                <img src="/profile/${loginImg }" alt="" id="imgPro"/>
                <span id="nickname">${loginNickname}</span>
                
              </div>
              <ul class="tog">
                <li><a id="mypageBtn">???????????????</a></li>
                <c:choose>
                  <c:when test="${loginMembership eq 'admin'}">
                    <li><a href="/adminMain.adminMain">??????????????????</a></li>
                  </c:when>
                </c:choose>
                <li><a href="logout.member">????????????</a></li>
              </ul>
            </c:when>
            <c:otherwise>
              <a class="loginBtn" href="/member/loginForm.jsp">?????????</a>
            </c:otherwise>
          </c:choose>
        </div>

        <input type="search" placeholder="MUSIC ??????" id="search" />

        <!-- login ?????? ???  -->
        <div id="GNB">
          <ul>
            <li><a id="today">?????????</a></li>
            <li><a id="chart">??????</a></li>
            <li><a id="wishBtn">???????????????</a></li>
            <li><a id="station">????????????</a></li>
            <li><a id="mag">?????????</a></li>
            <li><a id="serviceBtn">????????????</a></li>
          </ul>
        </div>
        <div id="events">
          <ul>
            <li>EVENT1</li>
            <li>EVENT2</li>
            <li>EVENT3</li>
          </ul>
        </div>

        <div id="FloatArea">
          <a id="membership">????????? ??????</a>
          <a id="ticketing">?????? ??????</a>
        </div>
        <a href="" class="service">????????? ??????</a>
      </div>

      <iframe
        src="/view/main.jsp"
        width="100%"
        height="100%"
 
        style="display: block; padding-left: 230px; border: none;"
        id="iframe"
      ></iframe>
      <c:choose>
        <c:when
          test="${loginMembership eq 'admin' || loginMembership eq 'VIP'}"
        >
          <div id="MusicControl">
            <div class="hidden">
              <div>	
                    <img src="image/web/logo-f-5.png" alt="">	
                </div>
              <ul>
              
              </ul>
            </div>
            <div class="gageBar" id="gageBar">
              <div class="gage" id="gage"></div>
            </div>
            <div class="controller">
              <ul class="musicInfo">
                <li>
                  <img
                    src="/image/web/album-p.png"
                    alt="/image/web/album-p.png"
                    id="musicImg"
                  />
                </li>
                <li id="playInfo">
                  <strong id="playTitle">title</strong>
                  <p id="playArtist">name</p>
                </li>
                <li>
                  <button>
                    <span
                      class="material-symbols-rounded"
                      id="wish"
                      data-wish="false"
                      title="??????????????? ??????"
                    >
                      favorite
                    </span>
                    <!-- 								<img src="/image/web/favorite_fill0.png"> -->
                  </button>
                </li>
                <li>
                  <button>
                    <span class="material-symbols-rounded">
                      library_books
                    </span>
                  </button>
                </li>
              </ul>
              <ul class="controlBtn">
                <li><span class="material-symbols-rounded" style="display:none"> repeat </span></li>
                <li>
                  <span class="material-symbols-rounded" id="playPrev">
                    skip_previous
                  </span>
                </li>
                <li>
                  <audio
                    id="playAudio"
                    data-status="pause"
                    title="??????/???????????? ??????"
                  ></audio>
                  <span class="material-symbols-rounded" id="playBtn">
                    play_arrow
                  </span>
                </li>
                <li>
                  <span class="material-symbols-rounded" id="playNext">
                    skip_next
                  </span>
                </li>
                <li><span class="material-symbols-rounded" style="display:none"> replay </span></li>
              </ul>

              <ul class="volume">
                <li>
                  <div>
                    <span id="currentTimeText">0 : 00</span><span> / </span
                    ><span id="entireTimeText">0 : 00</span>
                  </div>
                </li>
                <li>
                  <a
                    ><span class="material-symbols-rounded" id="volumeMute">
                      volume_up
                    </span></a
                  >
                </li>
                <li><input type="range" id="volumeBar" min="0" max="100" /></li>
                <li>
                  <a id="openList"
                    ><span class="material-symbols-rounded">
                      queue_music
                    </span></a
                  >
                </li>
              </ul>
            </div>
          </div>
        </c:when>
      </c:choose>
    </div>


    <script>
      // openList button toggle
      let ow = document.getElementById("openList");
      $(ow).click(function () {
        $(".hidden").toggle();
      });
    </script>
    <script>
      // loginBox button toggle
      let lb = document.getElementById("mypage");
      $(lb).click(function () {
        $(this).next(".tog").fadeToggle();
      });
    </script>
    <script>
      // login page move action
      $(".loginBtn").click(function () {
        $("#loginPage").fadeIn(450).css("display", "block");
        $("#test").css("display", "none");
        $("#main").css("display", "none");
      });
    </script>
    <script>
      // list page move action
      $("#today").click(function () {
        $("#iframe").attr("src", "/mainList.music");
      });
      $("#chart").click(function () {
        $("#iframe").attr("src", "/chart.music");
      });
      $("#wishBtn").click(function () {
    	let loginEmail = "${loginEmail}";
        if (loginEmail) {
      	$("#iframe").attr("src", "/list.wish");
        }else{
        	alert("????????? ??? ????????? ??? ????????????.");
        	return false;
        }
      });
      $("#mag").click(function () {
        $("#iframe").attr("src", "/view/mag.jsp");
      });
      $("#station").click(function () {
        $("#iframe").attr("src", "/view/station.jsp");
      });
      $("#mypageBtn").click(function () {
        $("#iframe").attr("src", "/mypage.member");
      });
      let loginEmail = "${loginEmail }";
      $("#ticketing").click(function () {
        $("#iframe").attr("src", "/list.perform");
      });
      $("#serviceBtn").click(function () {
        $("#iframe").attr("src", "/listLook.notice?cpage=1");
      });
      $("#membership").click(function () {
          $("#iframe").attr("src", "/index.goods");
      });
      
    </script>
    <script>
      let membership = "${loginMembership}";
      if (membership=="admin" || membership=="VIP") {
      // Music Controller ??????
        	// ??????????????? ?????? div???
        	const musicListPage = document.querySelector(".hidden ul");
        	musicListPage.setAttribute("id","???????????????");
        	// ?????? ??? ?????? offset
        	let playIndex = 0;
        	// ?????????/???????????? ??????
        	const playBtn = document.querySelector("#playBtn");
        	// ??????/?????? ?????? ??????
        	const playPrev = document.querySelector("#playPrev");
        	const playNext = document.querySelector("#playNext");
        	// ???????????? ????????? a?????? ??? ?????????
        	const playAudio = document.querySelector("#playAudio");
        	// ?????? ????????? ?????? ?????? ??????
        	const playInfo = document.querySelector("#playInfo");
        	const musicImg = document.querySelector("#musicImg");
        	
        	const playTitle = document.querySelector("#playTitle");
        	const playArtist = document.querySelector("#playArtist");
        	// ???????????? ?????? ???
        	const volumeBar = document.querySelector("#volumeBar");
        	playAudio.volume = volumeBar.value/100; // ?????? ??????????????? ???????????? ???, ???????????? ?????? ?????????.
        	// ????????? ??????
        	const volumeMute = document.querySelector("#volumeMute");
        	// ????????? ?????? ?????? ??????
        	const gage = document.querySelector("#gage"); // ?????? ?????????
        	const gageBar = document.querySelector("#gageBar"); // ?????? ?????????
        	const currentTimeText = document.querySelector("#currentTimeText"); // ????????? ???????????? ??????????????? ?????????
        	const entireTimeText = document.querySelector("#entireTimeText"); // ????????? ???????????? ?????? ????????????
        	// ??????????????? ?????? ??????
        	const wish = document.querySelector("#wish");
        	// music list array
        	let musicList = new Array();
        		<c:forEach items="${musicList }" var="i">
        			musicList.push({
        				musicSeq : "${i.musicSeq}",
        				musicName : "${i.musicName}",
        				musicArtist : "${i.musicArtist}",
        				musicAlbum : "${i.musicAlbum}",
        				musicImg : "${i.musicImg}",
        				musicMp3 : "${i.musicMp3}",
        				musicChart : "${i.musicChart}",
        				musicLylics : "${i.musicLylics}"
        			})
        		</c:forEach>
        	// ????????? ??? ?????? ?????????, ?????? ???????????? ?????? ??????????????? ??? ??? ?????? ???????????????.
        	playAudio.setAttribute("src","/audio/" + musicList[playIndex].musicMp3);
        	// ?????? ????????? ?????????????????? ????????? ????????? ????????????.
        	playTitle.innerHTML = musicList[playIndex].musicName;
        	playArtist.innerHTML = musicList[playIndex].musicArtist;
        	musicImg.src = `/audio/\${musicList[playIndex].musicImg}`;
        	// ??? ?????? ??????
        	// ?????? ??????
        	function playMusic() {
      			playAudio.setAttribute("data-status", "play");
      			playAudio.play();
      			playBtn.innerText = "pause";
      			wishExist();
        	};
        	// ???????????? ??????
        	function pauseMusic() {
        		playAudio.setAttribute("data-status", "pause");
      	playAudio.pause();
      	playBtn.innerText = "play_arrow";
        	}
        	// ?????? ?????? ???????????? ??????
        	function loadMusic(index) {
            	playTitle.innerHTML = musicList[playIndex].musicName;
            	playArtist.innerHTML = musicList[playIndex].musicArtist;
            	musicImg.src = `/audio/\${musicList[index].musicImg}`;
            	playAudio.setAttribute("src","/audio/" + musicList[index].musicMp3);
        	}
        	// ?????? ??? ?????? ??????
        	function prevMusic(){
        		playIndex--;
        		playIndex < 0 ? playIndex = musicList.length-1 : playIndex = playIndex;
        		loadMusic(playIndex);
        		playMusic();
        	}
        	// ?????? ??? ?????? ??????
        	function nextMusic(){
        		playIndex++;
        		playIndex > musicList.length-1 ? playIndex = 0 : playIndex = playIndex;
        		loadMusic(playIndex);
        		playMusic();
        	}
        	// ??????????????? ????????? ?????? ??????????????? ???????????? ??????
        	function wishExist(){
        		$.ajax({
        			url : "/exist.wish",
        			type : "get",
        			data:{
        				"musicSeq" : musicList[playIndex].musicSeq
        			},
        			dataType:"json"
        		}).done(function(resp){
        			let result = JSON.parse(resp);
        			if (result==false) {
        				$("#wish").html("favorite");
        				$("#wish").css({
                            "font-variation-settings":"'FILL' 0,'wght' 400,'GRAD' 0,'opsz' 48",
                            "color":"white"});
        				$("#wish").attr("title","??????????????? ??????");
        				$("#wish").attr("data-wish","false");
        			} else {
        				$("#wish").html("favorite");
        				$("#wish").css({
                            "font-variation-settings":"'FILL' 1,'wght' 400,'GRAD' 0,'opsz' 48",
                            "color":"red"});
        				$("#wish").attr("title","??????????????? ??????");
        				$("#wish").attr("data-wish","true");
        			}
        		});
        	};
        	// ?????? ??????????????? ??????????????? ????????? ???????????????.
        	wishExist();
        	// ???????????? ????????? ??????
        	playAudio.addEventListener("timeupdate", e=>{
        		const currentTime = e.target.currentTime;
        		const entireTime = e.target.duration;
        		let currentBar = (currentTime/entireTime)*100; // %???????????? 100??? ????????????.
        		gage.style.width = `\${currentBar}%`; // ???????????? ????????? ?????? ????????? ?????? ????????????.
        		let entireMin = Math.floor(entireTime/60); // ?????? ???????????? (???)
        		let entireSec = Math.floor(entireTime%60); // ?????? ???????????? (???)
        		if (entireSec < 10) {
        			entireSec = `0\${entireSec}`;
        		} // 10??? ????????? ??????, ?????? 0??? ?????????.
        		// ????????? ?????? ?????? ??????
        		entireTimeText.innerText = `\${entireMin} : \${entireSec}`;
        		// ??????????????? ????????? ????????? ??????
        		playAudio.addEventListener("loadeddata", function() {
        			let audioDuration = playAudio.duration;
        			let loadEntireMin = Math.floor(audioDuration/60);
            		let loadEntireSec = Math.floor(audioDuration%60);
            		if (loadEntireSec < 10) {
            			loadEntireSec = `0\${loadEntireSec}`;
            		}
            		//????????? ?????? ?????? ?????? ??????
            		entireTimeText.innerText = `\${loadEntireMin} : \${loadEntireSec}`;
        		});
        		let currentMin = Math.floor(currentTime/60);
        		let currentSec = Math.floor(currentTime%60);
        		if (currentSec < 10) {
        			currentSec = `0\${currentSec}`;
        		}
        		//????????? ?????? ?????? ?????? ??????
        		currentTimeText.innerText = `\${currentMin} : \${currentSec}`;
        	});
        	// ????????? ?????????, ?????? ????????? ???????????? ????????? ??????
        	gageBar.addEventListener("click", function(e){
        		let gageBarWidth = gageBar.clientWidth;
        		let timerOffsetX = e.offsetX;
        		playAudio.currentTime = (timerOffsetX / gageBarWidth) * playAudio.duration;
        		playMusic();
        	});
        	// PlayList ????????? ???????????? ??????
        	function listMusic(){
        		musicListPage.innerHTML = "";
        		for (let i=0; i<musicList.length; i++) {
            		// ??? ???????????? ????????? li ??????
            	    let li = `
            	    <li class="playList" data-index="\${i}">
                            <div>
                            <img src ="/audio/\${musicList[i].musicImg}" ></div>
                            <div>
                            <p>\${musicList[i].musicName}</p>
                            <p>\${musicList[i].musicArtist}</p>
                        </div>
                        </li>
                    `;
            		musicListPage.insertAdjacentHTML("beforeend",li);
            	}	
        	};
        	
        	listMusic();
        	
        	// ??????/???????????? ?????? ?????????
        	playBtn.addEventListener("click",function (){
        		// ???????????? ???????????? ??????????????? ????????? ??????
        		if (playAudio.getAttribute("data-status") == "pause") {
        			playMusic();
        		} else if (playAudio.getAttribute("data-status") == "play") {
        			pauseMusic();
        		}
        	});
        	// ?????? ?????? ?????????
        	playPrev.addEventListener("click", function(){
        		prevMusic();
        	});
        	// ?????? ?????? ?????????
        	playNext.addEventListener("click", function(){
        		nextMusic();
        	});
        	// ????????? ????????? ????????? ????????????
        	playAudio.addEventListener("ended", function(){
        		nextMusic();
        	})
        	// ???????????? ?????? ??????
        	volumeBar.addEventListener("change", function(){
        		playAudio.volume = this.value/100;
        	});
        	volumeBar.addEventListener("mousemove", function(){
        		playAudio.volume = this.value/100;
        	});
        	// ????????? ?????? ????????? ?????????
        	volumeMute.addEventListener("click", function(){
        		if (playAudio.muted) {
        			playAudio.muted = false;
        			volumeMute.innerText = "volume_up";
        		} else {
        			playAudio.muted = true;
        			volumeMute.innerText = "volume_off";
        		}
        	});
        	// ?????? ?????????, ?????? ????????? ??????
        	let playList = document.querySelectorAll(".playList");
        	for (let i=0; i<playList.length; i++) {
        			playList[i].addEventListener("click", function(){
        			playIndex = this.getAttribute("data-index");
        			loadMusic(playIndex);
        			playMusic();
        		});
        	};
        	// ??????????????? ??????
        	$("#wish").on("click",function(){
        		if ($("#wish").attr("data-wish")=="false") {
        			$.ajax({
            			url:"/add.wish",
            			type:"get",
            			data:{
            				"musicSeq" : musicList[playIndex].musicSeq
            			}
            		}).done(function(){
            			wishExist();
            		});
        		} else {
        			$.ajax({
            			url:"/del.wish",
            			type:"get",
            			data:{
            				"musicSeq" : musicList[playIndex].musicSeq
            			}
            		}).done(function(){
            			wishExist();
            		});
        		}
        	});
      }
    </script>

  </body>
</html>