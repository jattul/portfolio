<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<meta charset="UTF-8"> 
<meta
name="viewport"
content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
<script src="/js/jquery-1.11.0.min.js"></script>

<script>

	$(function(){
		// 유효성체크
		$(".loginBtn").bind("click",function(){
			checkLoginForm();		
		});

		//--------------------------------------------------loginBtn
		// 페이지 이동
		$(".join").bind("click",function(){
			goLoginJoinForm();		
		});	
		
		
		$(".findEmail").bind("click",function(){
			goLoginFindEmailForm();		
		});	

		
		$(".findPwd").bind("click",function(){
			goLoginFindPwdForm();		
		});	

		
		//--------------------------------------------------

		
      // 이메일 기억하기 쿠키값 일단 넣어둠 
      $("[name='userid']").val( "${cookie.userid.value}" );

      $("[name='userpw']").val( "${cookie.userpw.value}" );
	})

	
//-------페이지이동------------------------------------------------------------

	function goLoginJoinForm(){
		document.loginJoinForm.submit();
	}

	function goLoginFindEmailForm(){
		document.loginFindEmailForm.submit();
	}
	
	function goLoginFindPwdForm(){
		document.loginFindPwdForm.submit();
	}
	

//-----------------------------------------------------------------------------

    function checkLoginForm(){
		// 유저 아이디가 비어있을 때(공백만 있을때) 유효성 체크
		var userId_obj = $("[name='email']");
		var userId_val = userId_obj.val();
			if( typeof(userId_val)!="string" ) { userId_val = ""; }
		if ( userId_val.split(" ").join("")=="" ){
			alert("아이디를 입력해 주십시오.")
			userId_obj.val("");
			userId_obj.focus();
			return;
		}

		// 유저 비밀번호가 비어있을 때(공백만 있을때) 유효성 체크
		var userPwd_obj = $("[name='pwd']");
		var userPwd_val = userPwd_obj.val();
			if( typeof(userPwd_val)!="string" ) { userPwd_val = ""; }
		if ( userPwd_val.split(" ").join("")=="" ){
			alert("비밀번호를 입력해 주십시오.")
			userPwd_obj.val("");
			userPwd_obj.focus();
			return;
		}

		$.ajax({
				url:"/loginProc.do"
				,type:"post"
				,data:$("[name='loginPageForm']").serialize()
				,success:function(idCnt){
					if( idCnt==1 ) { 
						
						
						document.toolRentMainForm.submit();
					} else {
						alert("로그인 실패! 아이디 또는 암호가 틀립니다. 재입력해주십시오.")
						userId_obj.val("");
						userPwd_obj.val("");
					}
				}
				,error:function(){ alert("웹서버 접속 실패!") }
			});
    }
    
  
	</script>

<style>
*{
	font-family: 'PT Sans Narrow';
}
body{
	background-color: rgb(234, 230, 219);
}


.loginForm{
	border: 1px solid rgb(147, 128, 72);
	width: 500px;
	height: 350px;
}

.loginBtn{
	width: 300px;
	height: 30px;
	color:rgb(0, 0, 0);
	background-color:rgb(202, 188, 145) ;
	border: none;
	font-size:18px;
	transition: all 0.2s ease ;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	-o-transition: all 0.2s ease;
    outline:none;
}

.loginBtn:hover{
	background-color:rgb(166, 155, 121) ;
}

.links span:hover{
        color: rgb(153, 150, 150);
	}

/* .userId{
  position:relative;
  margin:10px 0;
} */
.userId{
  background:transparent;
  border:none;
  border-bottom: solid 2px rgb(185, 184, 184);
  /* padding:20px 0px 5px 0px; */
  font-size:10pt;
  width:250px;
}
.userPwd{
  position:relative;
  margin:10px 0;
}
.userPwd{
  background:transparent;
  border:none;
  border-bottom: solid 2px rgb(185, 184, 184);
  /* padding:20px 0px 5px 0px; */
  font-size:10pt;
  width:250px;
}

.join{
	width: 300px;
	height: 30px;
	color:rgb(0, 0, 0);
	background-color:rgb(202, 188, 145) ;
	border: none;
	font-size:18px;
	transition: all 0.2s ease ;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	-o-transition: all 0.2s ease;
    outline:none;
}

.join:hover{
	background-color:rgb(166, 155, 121) ;
}
</style>
</head>
<body style="background-color: rgb(234, 230, 219);">
  <%@include file="/WEB-INF/views/commonHeader.jsp" %>
	  <form name="loginPageForm" class="loginPage" action="/loginPageForm.do" method="post" >  
	  	
	  <center>
	<div class="loginForm">
	  <table>
		<br>
	      <h2>로그인</h2>
	          <tr><br>
	            <input class="userId" type="text" placeholder="이메일을 입력해주세요" name="email"/><br><br>
	            <input class="userPwd" type="password" placeholder="비밀번호" minlength="10" name="pwd"/><br>      
	            <p class="chk_id"><input type="checkbox"  name="" ${empty cookie.mid.value?'':'checked'}>이메일 저장</p> <!--쿠키값 사용 일단 생략--><br>
	            <input type="button"  value="로그인"  class="loginBtn">
	            <td class="links">
				<br>
				<!--  
	              <span style="cursor:pointer;"  class="findEmail">이메일 찾기</span> | 
	              <span style="cursor:pointer;" class="findPwd">비밀번호 찾기</span> | -->
	              <table><input type="button" value="회원가입" class="join"></table>
	            </td>
	          </tr>
	  </table>
	</div>
	  </center>
	    <%@include file="/WEB-INF/views/commonFooter.jsp" %>
	  </form>
  
  	  <form name="toolRentMainForm" method="post" action="/toolRentMainForm.do"></form>
	  <form name="loginJoinForm" method="post" action="/loginJoinForm.do"></form>
	  <form name="loginFindEmailForm" method="post" action="/loginFindEmailForm.do"></form>
	  <form name="loginFindPwdForm" method="post" action="/loginFindPwdForm.do"></form>

</body>
</html>