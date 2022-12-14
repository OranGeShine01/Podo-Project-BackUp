<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
     <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
    <style>
      /* 기본 Reset css 셋팅입니다 지우지 마세요 */
      @import url(../src/css/reset.css);
      /* system font */
      @import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Noto+Sans+KR&display=swap");
      /* event font */
      @font-face {
        font-family: "EliceDigitalBaeum-Bd";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_elice@1.0/EliceDigitalBaeum-Bd.woff2")
          format("woff2");
        font-weight: normal;
        font-style: normal;
      }
      :root {
        --font-color: #fff;
        --background-color: #111;
        --sub-background-color: #333;
        --boder-silver: 1px solid silver;
        --main-color: #3e065f;
        --point-color: #ff00d7;
      }
      * {
        margin: 0;
        padding: 0;
        /* border: 1px solid #fff; */
        text-decoration: none;
        border: none;
      }
      body {
        width: 100vw;
        background: var(--background-color);
        color: var(--font-color);
        font-family: "Noto Sans KR", sans-serif;
      }
      .wrap {
        margin-top: 25vh;
        padding: 0 40px;
        width: 100%;
        height: 100%;
        text-align: center;
      }

      .wrap h1 {
        text-align: center;
        margin-bottom: 20px;
        opacity: 1;
      }

      .wrap form {
        width: 100%;
        text-align: center;
      }

      .wrap a {
        display: inline-block;
        margin-top: 10px;
        color: silver;
        font-size: 0.8rem;
      }

      form input {
        width: 300px;
        height: 50px;
        display: block;
        margin: 0 auto;
        margin-bottom: 10px;
        border-radius: 4px;
        border: var(--boder-silver);
        background-color: transparent;
        color: silver;
        padding: 10px;
      }
      form p {
        width: 300px;
        text-align: left;
        margin: 0 auto;
        margin-bottom: 8px;
        padding-left: 5px;
      }
      form button#numberCheck {
        width: 145px;
        height: 50px;
        margin-top: 5px;
        background: var(--main-color);
        border-radius: 4px;
        color: var(--font-color);
        font-weight: bolder;
        font-size: 1rem;
        cursor: pointer;
      }

      form button#emailSendBtn {
        width: 145px;
        height: 50px;
        margin-top: 5px;
        margin-right: 5px;
        background: #333;
        border-radius: 4px;
        color: var(--font-color);
        font-weight: bolder;
        font-size: 1rem;
        cursor: pointer;
      }

      form button:hover {
        opacity: 0.7;
      }
      footer {
        width: 100%;
        height: 100px;
        margin-top: 40vh;
        text-align: center;
        color: silver;
        font-size: 0.8rem;
        background: #000;
        opacity: 0.5;
      }
      /* delete scroll bar */
      ::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
      }
    </style>
   
  </head>
  <body>
    <div class="wrap">
      <h1 id="logo"></h1>
      <h1>비밀번호 찾기</h1>
      <form action="" method="post">
        <p>이메일 입력</p>
        <input type="text" name="email" id="email" placeholder="email" />
        <p id="msg"></p>
        <p>인증번호</p>
        <input type="text" name="pw" placeholder="" id="number" />
        <p id="msg"></p>
        <input type="hidden" name="message" id="message" />
        <button type="button" id="emailSendBtn">인증번호 전송</button>
        <button type="button" id="numberCheck">인증번호 확인</button>
      </form>
      <a href="loginForm.jsp">뒤로가기</a>
    </div>
    <!-- <footer>
      포도뮤직(주) 대표이사 : 조성태 사업자등록번호 : 220-81-99999
      통신판매업신고번호 : 제2006-경기성남-9999호 주소 : 서울 중구 남대문로 120
      대일빌딩 2층,3층 대표전화 : 1155-9999 이메일 : xorrn93@gmail.com 호스팅
      서비스 제공 : AWS 개인정보처리방침 PODO 이용약관 고객센터 결제/환불안내
      상담 © PODO Music Corp.
    </footer> -->

    <footer>
      <p>개인정보처리방침 | PODO 이용약관 | 고객센터 | 결제/환불안내 | 상담</p>
      <br />
      <img src="../image/web/logo-footer.png" alt="" style="width: 60px" />
      <p>© PODO Music Corp.</p>
    </footer>

    <script>
      window.onload = function () {
    	  var dupleResult = true;
        // 유효성 검사
        var emailRegex =
          /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

        $("#email").keyup(function () {
          let result = emailRegex.test($(this).val());
          if ($(this).val() == "") {
            $(this).val("");
          } else if (!result) {
            $(this)
              .next("#msg")
              .css("color", "#888")
              .text("올바른 이메일 형식을 입력해주세요 ");
            dupleResult= false;
          } else {
            $(this).next("#msg").css("color", "#888").text("");
            dupleResult = true;
          }
        });

        $("#email").change(function () {
          let result = emailRegex.test($(this).val());
          if (!result) {
            $(this).val("");
          } else {
          }
        });

        // email send action //
        $("#emailSendBtn").click(function () {
          if (
            $("#email").next("#msg").text() == "" &&
            $("#email").val() != "" &&
            dupleResult == true
          ) {
            $("#email")
              .next("#msg")
              .css("color", "white")
              .text("인증번호 전송중 ..");
            $("#emailSendBtn").text("재전송");
            $.ajax({
              url: "/find.member",
              type: "post",
              data: {
                email: $("#email").val(),
              }
            }).done(function (resp) {
            	if(resp){
            		$("#email")
                    .next("#msg")
                    .css("color", "white")
                    .text("인증번호 전송완료!");
                    let result = JSON.parse(resp);
              $("#message").val(result);
            		
            	}else{
            		alert("회원정보가 존재하지 않습니다!");
            		location.reload();
            	}
            });
          } else {
            $("#email")
              .next("#msg")
              .css("color", "red")
              .text("올바른 이메일 형식을 입력해주세요 !");
          }
        });

        $("#numberCheck").click(function () {
          let result = $("#number").val() == $("#message").val();
          if ($("#number").val() == "") {
        	  $("#number")
              .next("#msg")
              .css("color", "red")
              .text("인증번호를 입력해주세요.");
          } else if (!result) {
            $("#number")
              .next("#msg")
              .css("color", "red")
              .text("인증번호가 틀립니다.");
            $("#number").val("");
          } else {
            $("#number")
              .next("#msg")
              .css("color", "white")
              .text("인증번호가 일치합니다.");
            $.ajax({
                url: "/updatePw.member",
                type: "post",
                data: {
                  email: $("#email").val(),
                },
              }).done(function (resp) {
            	  if (resp == null) {
                      alert("요청 실패");
                    } else {
                      alert($("#email").val()+" 로 임시비밀번호를 보내드렸습니다!")
                  	  location.href = "/member/loginForm.jsp"
                    }
              });
            
          }
        });
      };
    </script>
  </body>
</html>
