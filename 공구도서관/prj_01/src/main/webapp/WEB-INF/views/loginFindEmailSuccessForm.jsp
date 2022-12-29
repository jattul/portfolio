<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<!DOCTYPE html>

<html>
<head><!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡHEAD ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
  
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <script src = "/js/jquery-1.11.0.min.js"></script>
	  
  <script>
  

	$(function(){
		
		//--------------------------------------------------
		// 페이지 이동
		$(".join").bind("click",function(){
			goLoginJoinForm();		
		});	
		
		
		$(".login").bind("click",function(){
			goLoginPageForm();		
		});	


		$(".findPwd").bind("click",function(){
			goLoginFindPwdForm();		
		});	

		
		//--------------------------------------------------
		
	})
	//-------페이지이동------------------------------------------------------------

	function goLoginJoinForm(){
		document.loginJoinForm.submit();
	}

	function goLoginPageForm(){
		document.loginPageForm.submit();
	}
	
	function goLoginFindPwdForm(){
		document.loginFindPwdForm.submit();
	}
	

//-----------------------------------------------------------------------------
  
  </script>
  
</head><!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡHEAD ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->

<body>
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
	
	<form action="loginFindEmailSuccessForm" action="/loginFindEmailSuccessForm.do" method="post"> 
	<center>
	<table>
		<tr>
          <input type="hidden" name="member_id" value="">
          <p class="check" id="check">내 아이디 : 지선공쥬</p><br/>
          <p class="" id="check">이메일 찾기를 성공했습니다!*^^*</p><br/>
            <br>
          <tr class="links">
				<span style="cursor:pointer;" class="findPwd">비밀번호 찾기</span> | 
				<span style="cursor:pointer;" class="login">로그인</span> | 
	            <span style="cursor:pointer;" class="join">회원가입</span>
          </tr>
        </tr>
	</table>
	</center>
	</form>
  
  
	<form name="loginJoinForm" 		method="post" action="/loginJoinForm.do"></form>
	<form name="loginPageForm" 		method="post" action="/loginPageForm.do"></form>
	<form name="loginFindPwdForm" 	method="post" action="/loginFindPwdForm.do"></form>
	<%@include file="/WEB-INF/views/commonFooter.jsp" %>
 </body>
</html>