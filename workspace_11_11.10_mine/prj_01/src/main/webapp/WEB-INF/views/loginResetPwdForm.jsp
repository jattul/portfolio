<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <head>
  <script>
  function goLoginPage(){
		document.goLoginPageForm.submit();
	}
	function goLoginJoinPage(){
		document.goLoginJoinPageForm.submit();
	}
	function goLoginFindEmail(){
		document.goLoginFindEmailForm.submit();
	}
	

//-----------------------------------------------------------------------------

	 $(function()	{
		 	
		 	// 유효성 체크
			$(".pwdCheckBtn").bind("click",function(){
					checkPwdForm();		
			});
			
			//--------------------------------------------------
			// 페이지 이동
			$(".join").bind("click",function(){
				goLoginJoinForm();		
			});	
			
			
			$(".login").bind("click",function(){
				goLoginPageForm();		
			});	

			
			$(".findEmail").bind("click",function(){
				goLoginFindEmailForm();		
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
  	
  	function goLoginFindEmail(){
  		document.goLoginFindEmailForm.submit();
  	}
  	

//-----------------------------------------------------------------------------
	  function checkPwdForm(){
	  var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	  //비밀번호 공백확인
	  if($("#pwd").val() == ""){
	        alert("패스워드 입력바람");
	        $("#pwd").focus();
	        return false ;
	      }

	      // 비밀번호 유효성 검사 
	      if(!getCheck.test($("#pwd").val())){
	        alert("비밀번호 형식에 맞게 입력해주세요");
	        $("#pwd").val("");
	        $("#pwd").focus();
	        return false;
	      }

	      if (pwd.value != pwdCheck.value) {
	      alert("비밀번호가 서로 일치하지 않습니다.");
	      pwd.value=pwdCheck.value="";
	      pwd.focus();
	      return;
	      } 
	      alert("비밀번호 재설정 성공하셨슙니댱~!~!~!")
	      // var pwd = document.getElementById("#pwd")
	      // ,pwdCheck = document.getElementById("#pwdCheck");
	    
	      // function validatepwd(){
	      //   if(pwd.value != pwdCheck.value) { // 만일 두 인풋 필드값이 같지 않을 경우
	      //     // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
	      //     pwdCheck.setCustomValidity("비밀번호가 일치하지 않습니다."); 
	      //   } 
	      //   else { // 만일 두 인풋 필드값이 같을 경우
	      //     // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
	      //     // 따라서 빈값을 주어 submit 처리되게 한다
	      //     pwdCheck.setCustomValidity(''); 
	      //   }
	  }
//-----------------------------------------------------------------------------

	
  </script>
  </head>

<body>
  <%@include file="/WEB-INF/views/commonHeader.jsp" %>
  <form name="loginResetPwdForm" class="loginResetPwdForm" action="/loginResetPwdForm.do" method="post">  
  <center>
      <table>
        <tr>
          <input type="hidden" name="member_id" value="">
          <p class="check" id="check">내 이메일 :</p><br/>
            <input type="passwor" name="pw" id="pw" class="" placeholder="비밀번호" required ><BR>
            <input type="passwor" name="pw2" id="pw2" class="" placeholder="비밀번호 재확인" required><br>
            <p class="check" id="check2"></p><br/>
            <button type="button"  id="" onclick="goLoginJoinPage()" class="">비밀번호 재설정</button> <!-- 유효성 검사 해야함 -->
          <td class="links">
	            <span style="cursor:pointer;" class="findEmail">이메일 찾기</span> | 
				<span style="cursor:pointer;" class="login">로그인</span> | 
	           	<span style="cursor:pointer;" class="join">회원가입</span>
          </td>
        </tr>
      </table>
  </center>
  </form>
  
	<form name="loginJoinForm" method="post" action="/loginJoinForm.do"></form>
	<form name="loginPageForm" method="post" action="/loginPageForm.do"></form>
	<form name="loginFindEmailForm" method="post" action="/loginFindEmailForm.do"></form>
	
	<%@include file="/WEB-INF/views/commonFooter.jsp" %>
  </body>