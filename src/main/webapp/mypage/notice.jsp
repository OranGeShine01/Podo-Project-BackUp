<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        @import url(src/css/reset.css);
        /* system font */
        @import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Noto+Sans+KR&display=swap");

        /* event font */
        @font-face {
            font-family: "EliceDigitalBaeum-Bd";
            src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_elice@1.0/EliceDigitalBaeum-Bd.woff2") format("woff2");
            font-weight: normal;
            font-style: normal;
        }

        :root {
            --font-color: #fff;
            --background-color: #000;
            --sub-background-color: #222;
            --boder-silver: 1px solid silver;
            --main-color: #3e065f;
            --point-color: #ff00d7;
            --font-weight: bold;
            --line-height: 45px;
        }

        * {
            margin: 0;
            padding: 0;
            border: 1px solid #fff;
            text-decoration: none;
            border: none;
        }

        body {
            width: 100vw;
            background: var(--sub-background-color);
            color: var(--font-color);
            font-family: "Noto Sans KR", sans-serif;
        	-ms-overflow-style: none;
        }
		body::-webkit-scrollbar{
  			display:none;
		}

        .container {
            padding: 0 75px;
            height: 100%;
            width: 100vw;
        }
		
		.main {
            height: 100%;
            margin-top: 8vh;
        }
        
        .titleText {
            font-size: 38px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
            margin-bottom: 2vw;
            font-family: "EliceDigitalBaeum-Bd";
        }
        
        /*category css*/
        .titleCategory>div>a{
        color: var(--font-color);
        font-weight: var(--font-weight);
        line-height: var(--line-height);
        }
        .titleCategory{
        width:100%;
        height: 59px;
        font-size: 28px;
        text-aline:center;
        }
        
        /* ???????????? ???????????? */
        #notice{
        min-width: 169px;
        float:left;
        width:10vw;
        line-height: var(--line-height);
        color: var(--font-color);
        }
        
        /* ??? ?????? ???????????? */
        #myInquiry{
        min-width: 253.5px;
        float:left;
        width:15vw;
        line-height: var(--line-height);
        color: var(--font-color);
        }
        
        /*division css*/
        .division {
            width: 100%;
            font-size: 20px;
            height: 35px;
            font-weight: var(--font-weight);
            line-height: var(--line-height);
        }
        
        
        /* ?????? */
        #category {
            float: left;
            width: 20%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
        
		#noticeCategory{
			float: left;
            width: 20%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
		
		/* ?????? */
        #history {
            float: left;
            width: 45%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
		#noticeTitle{
			float: left;
            width: 45%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
		
		/*????????? */
		#writer{
			float: left;
            width: 20%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
		}
		#noticeWriter{
			float: left;
            width: 20%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
		}
		
		/* ????????? */
        #date{
            float: left;
            width: 15%;
            border-width: 0 0 1px;
            border-bottom: var(--boder-silver);
        }
        #noticeWriteDate{
        	float: left;
            width: 15%;
            border-width: 0 0 1px;
            line-height: var(--line-height);
        }
        
        /*??? list ?????? ???*/
        .list{
		margin-top: 2vh;
		width: 100%;
		height: 41vh;
		border: 1px solid transparent;
        }
        
        /* ??? 1??? div */
        .writelist{
        width: 100%;
		height: 46px;
		font-size: 18px;
		margin-top:2vh;
		margin-bottom:2vh;
		border-bottom: 1px solid rgb(255,255,255,0.3);
        }
        
        #navi{
        text-align:center;
        }
        #navi>a{
        color:white;
        margin-right: 10px;
        }
        
        footer {
        width: 100%;
        height: 200px;
        margin-top: 40vh;
        text-align: center;
        color: silver;
        font-size: 0.8rem;
        background: transparent;
        opacity: 0.5;
      }
    </style>
        <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
</head>

<body>
    <div class="container">
        <div class="main">
            <div class="titleText">????????????</div>
            <div class="titleCategory">
                    <div id="notice"><a href="/listLook.notice?cpage=1" style="color: var(--point-color);">????????????</a></div>
                    <div id="myInquiry">
                    <a href="" id="inquiryBtn">??? ?????? ??????</a>
                    </div>
            </div>
            
            <div class="division">
                    <div id="category">??????</div>
                    <div id="history">??????</div>
                    <div id="writer">?????????</div>
                    <div id="date">?????????</div>
            </div>
            
            <div class="list">
            
				<c:choose>
					<c:when test="${not empty noticeBoardList}">
						<c:forEach var="n" items="${noticeBoardList }">
							<div class="writelist">
								<div id="noticeCategory">${n.noticeCategory }</div>
								<div id="noticeTitle">
									<a href="/detailLook.notice?noticeSeq=${n.noticeSeq }" style="color:white;">${n.noticeTitle }</a>
								</div>
								<div id="noticeWriter">${n.noticeWriter }</div>
								<div id="noticeWriteDate">
								<fmt:formatDate value="${n.noticeWriteDate }" pattern="yyyy-MM-dd" />
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
         ????????? ????????????
         </c:otherwise>
				</c:choose>
				
			</div>

			<div id="navi">${naviLook }</div>
        </div>
        
        <footer>
       <p>???????????????????????? | PODO ???????????? | ???????????? | ??????/???????????? | ??????</p>
       <br />
       <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
       <p>?? PODO Music Corp.</p>
    	</footer>
    	
    </div>
    
    <script>
    let loginEmail = "${loginEmail}";
    document.getElementById("inquiryBtn").addEventListener("click",function(e){
    	if (loginEmail) {
    		e.preventDefault();
    		location.href="/list.board?cpage=1";
    	    }else{
    	    	alert("????????? ??? ????????? ??? ????????????.");
    	    	return false;
    	    }
    });
    </script>
</body>

</html>