<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src = "/js/jquery-1.11.0.min.js"></script>
<title>비밀번호 변경</title>

<script>
    $(function (){init();});
    
    function init(){
        var formObj1 = $("[name=mypage]");
        
        
        
    }
    
    function goBookList(){
        document.goBookListForm.submit();
        
        
    }
    function goMyWriting(){
        document.goMyWritingForm.submit();
        
    }
    function checkChange(){
    	// 기존 비밀번호가 맞는지 , 새 비밀번호가 유효성 통과했는지, 새 비밀번호확인이 잘 들어갔는지
    	
    	var confirmFlag = confirm("변경 하시겠습니까?");
    	if(confirmFlag){
    	$.ajax(
    			{
    				url:"/myPageInfoPwChangeProc.do"
    				,type:"post"
    				,data:$("[name=changeForm]").serialize() 
    					//, "selectedDate",selectedDate, "toolName",toolName}
    					
    				,success:function(idCnt){
    					if(idCnt==1){
    						alert("변경 완료됐습니다");
    						document.goMyPageInfoForm.submit();
    					}else{
    						alert("변경 실패했습니다");
    						document.goMyPageInfoForm.submit();
    					}
    					
    				}
    				
    				,error:function( ){
    					alert("웹서버 접속 실패");
    				}
    			}
    		);
    	
    	
    				}	
    	
    }
    function checkCancle(){
        var confirmFlag = confirm("취소 하시겠습니까?");
        if(confirmFlag){document.goMyPageInfoForm.submit();}
        
        
    }
    
</script>

<style>
*{
font-family: 'PT Sans Narrow';
}

img { border: 0; }
ul { list-style: none; }

.pwdChange{
    border: 1px solid rgb(147, 128, 72);
    width: 700px;
    height: 300px;
}
.numTxt{
  width: 200px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 5px;
  /* outline: none; */
  padding-left: 10px;
  background-color: rgb(222, 216, 204);
  opacity: 0.8;
}




.Btn{
    width: 140px;
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
.Btn:hover{
	background-color:rgb(166, 155, 121) ;
}

</style>

</head>
<body style="background-color: rgb(234, 230, 219);">

<%@include file="/WEB-INF/views/commonHeader.jsp" %>
    <form name="goMyPageInfoForm" method="post" action="/myPageInfo.do"></form>
    <form name="goBookListForm" method="post" action="/myPageBookList.do" ></form>
    <form name="goMyWritingForm" method="post"  action="/myPageMyWritingList.do" ></form>
    <form name="goPwChangeForm" method="post" action="/myPageInfoPwChange.do" ></form>
    <form name="goPhoneChangeForm" method="post" action="/myPageInfoPhoneChange.do" ></form>
    <center>
    <section class="pwdChange"><br>
        <p><b>비밀번호 변경</b></p><br>
        <form name="changeForm">
            <input type="text" class="numTxt"   name="pastPwd"  placeholder="현재 비밀번호"><br><br>
            <input type="text" class="numTxt"  name="newPwd"   placeholder="새 비밀번호"><br><br>
            
            <input type="button" class="Btn" value="확인" onClick="checkChange();" >
            <input type="button" class="Btn" value="취소" onClick="checkCancle();" ><br>
        </form>
    </section>


</center>
 <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
</html>