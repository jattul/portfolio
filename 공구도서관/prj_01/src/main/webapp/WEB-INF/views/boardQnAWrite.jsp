<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--====================================================================-->
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
<title>문의게시판 글쓰기</title>
<script>
$(function(){ 
	$("#community").text("[게시판]");
	
	
});
	function QnaListBtn(){
		document.boardQnAForm.submit();
	}
	
	 function QnaRegBtn(){
	       var text = $("#title").val();	       
	    	if(text.trim() == ""){
	    		alert("제목을 입력해 주세요.");
	    		return;
	    	}
	    	 if(text.length > 50){
	    		 alert("제목은 50자 이상은 입력 할 수 없습니다.");
	     		return;
	    	 }	 
	    	if($("#content").val() == ""){
	    		alert("내용을 입력해 주세요.");
	    		return;
	    	}	
	   	 if($("#content").val().length > 250){
			 alert("내용은 250자 이상은 입력 할 수 없습니다.");
	 		return;
		 }
	   	if( confirm("작성 완료하시겠습니까?")== false){ 		
			return;
   		}
	    	document.boardQnAWriteForm.submit();
	    }
	    	
	
</script>

<style>
    body{
        font-family: 'PT Sans Narrow';
    }

    .tableTitle{
        background-color: rgb(210, 203, 176);
    }

    .text{
        opacity:
    }

    .qnABtn{
        position: relative;
        top: 2px;
        bottom: 5px;
        width: 90px;
        height: 25px;
        border: none;
        font-weight: bolder;
        background-color:rgb(202, 188, 145) ;
    }

    .qnABtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(166, 155, 121) ;
    }
    .selectBox{
        background-color:  rgb(227, 223, 209);
        width: 100px;
        height: 22px;
    }
    .tooltable{
    position:relative;
    }
</style>
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
  <form name="boardQnAWriteForm" action="/boardQnASave.do" method="post">
	<center>
        <input type="hidden" name="email" value="<%= session.getAttribute("email") %>" >
        <center>
        <table border="1" cellpadding="5" style="border-collapse:collapse" align="center" class="tooltable"> 
            <tr>
                <th class="tableTitle">문 의</th>
                <td>
            		<select name="headerno"  class="selectBox" >
                        <option value="">--문의내용--
		                <option value="0">계정 문의
		                <option value="1">공구 문의
		                <option value="2">서비스 문의
		                <option value="3">기타
            		</select> 
             	</td>
         	</tr>
            <tr>
                <th class="tableTitle">제 목</th>
                <td>
                <input type="text" name="title"  id="title" class="text" size="40" maxlength="30">
                </td>
            </tr>
            <tr>
                <th class="tableTitle">내 용</th>
                <td>
                <textarea name="content"  id="content" class="text" rows="13" cols="40"  maxlength="300"></textarea>
                </td>
            </tr>
    </table>
    </center>
    <div style="height:15px;"></div>		
    <input type="button" value="등록" class="qnABtn" onclick="QnaRegBtn();">
    <input type="button" value="목록보기" class="qnABtn"  onclick="QnaListBtn();">
    </form>
	</center>

	<!-- boardQnA 로 이동을 위한 폼 -->
    <form name="boardQnAForm" action="/boardQnA.do" method="post" ></form>

<%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
<style>

.notice{font-size: 15px;color: white;}
	.community{font-size: 22px;color: white;}
	.record{font-size: 15px;color: white;}
	.book{font-size: 15px;color: white;}

</style>
</html>