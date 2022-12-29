<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--====================================================================-->
<%@include file="/WEB-INF/views/common.jsp" %>
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
<title>자주 묻는 질문 글 수정</title>
<script>
	//취소
	$(function(){ 
    		$("#community").text("[게시판]");
    		
    		
    	});
		function questionDetail(){
    	document.goForm.action="/boardQuestionDetail.do";
  		document.goForm.submit();
  	}  	
	//수정완료
	function questionDetailUp(){
		if($("#title").val() == ""){
    		alert("제목을 입력해 주세요.");
    		return;
    	}
    	if($("#content").val() == ""){
    		alert("내용을 입력해 주세요.");
    		return;
    	}	
  		if( confirm("수정하시겠습니까?")== false){ 		
  			return;
  		}		
  		document.goForm.action="/boardQuestionSave.do"
  	  	document.goForm.submit();
	}
	
</script>

<style>
    body{
        font-family: 'PT Sans Narrow';
    }
    img { border: 0; }
    ul { list-style: none; }

    .tableTitle{
        background-color: rgb(210, 203, 176);
    }

    .QuestionBtn{
        position: relative;
        top: 2px;
        bottom: 5px;
        width: 90px;
        height: 25px;
        border: none;
        font-weight: bolder;
        background-color:rgb(202, 188, 145) ;
    }

    .QuestionBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(166, 155, 121) ;
    }

	.text{
        opacity: 0.3;
    }

</style>
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="goForm" method="post">

<input type="hidden" name="no" class="no" value="${boardQuestionInfo.no}">
	<center>
    <form class="questionUpDelForm" action="/boardQuestionUpDel.do">
         <table border="1" cellpadding="5" style="border-collapse:collapse" align="center"> 
            <tr>
                <th style="background-color: rgb(218, 203, 174);">제 목</th>
                <td>
                <input class="text" type="text" name="title"  id="title" class="" size="40" maxlength="30"value ="${boardQuestionInfo.title}">
                </td>
            </tr>
            <tr>
                <th style="background-color: rgb(218, 203, 174);">내 용</th>
                <td>
                <textarea class="text" name="content"  id="content"  rows="13" cols="40"  maxlength="300">${boardQuestionInfo.content}</textarea>
                </td>
            </tr>
    	</table>
    	<div style="height:15px;"></div>
    	
        <input class="QuestionBtn" type="button" value="수정완료" class="questionBtnDetailUp" onclick="questionDetailUp();">
        <input class="QuestionBtn" type="button" value="취소" class="questionDetailBtn" onclick="questionDetail();">
      </center>
    </form>

   
        <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
<style>

.notice{font-size: 15px;color: white;}
	.community{font-size: 22px;color: white;}
	.record{font-size: 15px;color: white;}
	.book{font-size: 15px;color: white;}

</style>
</html>