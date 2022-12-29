<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
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

    function goLoginFindEmail(){
   		var getName = new RegExp(/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/);
   	    var getMail = new RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
   	    var getNum= new RegExp(/^[0-9]{9,11}$/);
   	    //---------------------------------------
   	    //이름 공백 확인  
   		var name_obj = $("[name='name']");
   		var name_val = name_obj.val();
   			if( typeof(name_val)!="string" ) { name_val = ""; }
   		if ( name_val.split(" ").join("")=="" ){
   			alert("이름을 입력해 주십시오.")
   			name_obj.val("");
   			name_obj.focus();
   			return;
   		}
   	    //이름 유효성검사
   	    if(getName.test(name_val)==false){
   			alert("이름형식에 맞게 입력해주세요")
   			name_obj.val("");
   			name_obj.focus();
   			return;
   	    }
   	    

   	    //---------------------------------------
   	    //이메일 공백 확인
   		var email_obj = $("[name='email']");
   		var email_val = email_obj.val();
   			if( typeof(email_val)!="string" ) { email_val = ""; }
   		if ( email_val.split(" ").join("")=="" ){
   			alert("이메일을 입력해 주십시오.")
   			email_obj.val("");
   			email_obj.focus();
   			return;
   		}
   		
   		
   	    //이메일 유효성검사
   	    if(getMail.test(email_val)==false){
   	      alert("이메일형식에 맞게 입력해주세요")
   	      email_obj.val("");
   	      email_obj.focus();
   	      return ;
   	    }
   	    
   	    //---------------------------------------
   	    //전화번호 공백 확인
   		var phone_obj = $("[name='phone']");
   		var phone_val = phone_obj.val();
   			if( typeof(phone_val)!="string" ) { phone_val = ""; }
   		if ( phone_val.split(" ").join("")=="" ){
   			alert("전화번호를 입력해 주십시오.")
   			phone_obj.val("");
   			phone_obj.focus();
   			return;
   		}
   		

   	    if(getNum.test(phone_val)==false){
   	      alert("전화번호형식에 맞게 입력해주세요")
   	      phone_obj.val("");
   	      phone_obj.focus();
   	      return ;
   	    }
    alert('성공!');
    document.location.href = "http://127.0.0.1:5500/%EB%A1%9C%EA%B7%B8%EC%9D%B8%EA%B4%80%EB%A0%A8/loginFindEmailSuccess.html"
         // DB연결로 해야 함 
  }

</script>
</head>



<body>
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
	
	<form name="loginFindEmailForm" method ="post" action="/loginFindEmailForm.do">    
	<center>
		<table class="card-body">
			<tr>
				<input type="text" name="name" placeholder="이름" ><br>
				
				<input type="email" name="email" placeholder="이메일"><br>
				
				<input type="text" name="phone"placeholder="전화번호:ex)01012345678" >
				
				<input type="button" onclick="goPhoneNumCheck();" value="전화번호 인증"><br>
				<input type="button" onclick="goLoginFindEmail();" value="이메일찾기"  class="emailBtn">
				
				<td class="links">
				<span style="cursor:pointer" class="findPwd">비밀번호 찾기</span> | 
				<span style="cursor:pointer" class="login">로그인</span> | 
	            <span style="cursor:pointer" class="join">회원가입</span>
				</td> 
				
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