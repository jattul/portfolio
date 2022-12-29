<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>공지사항 글 수정</title>
<script>
	//취소
	$(function(){ 
		$("#notice").text("[공지사항]");
		
		
	});
	
		function noticeDetail(){
    	document.goForm.action="/noticeDetail.do";
  		document.goForm.submit();
  	}  	
	//수정완료
	function nociteDetailUp(){
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
  		document.goForm.action="/noticeSave.do"
  	  	document.goForm.submit();
	}
	
</script>

<style>
    body{
        font-family: 'PT Sans Narrow';
    }
    img { border: 0; }
    ul { list-style: none; }

    .text{
        opacity: 0.3;
    }
	.title{
		background-color: rgb(212, 188, 148);
	}

    .updateBtn{
        position: relative;
        top: 2px;
        bottom: 5px;
        width: 90px;
        height: 25px;
        border: none;
        font-weight: bolder;
        background-color:rgb(202, 188, 145) ;
    }

    .updateBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(166, 155, 121) ;
    }
</style>
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="goForm" method="post">

<input type="hidden" name="no" class="no" value="${boardNoticeInfo.no}">
	<center>
    <form class="noticeUpDelForm" action="/noticeUpDel.do">
         <table border="1" cellpadding="5" style="border-collapse:collapse" align="center"> 
            <tr>
                <th class="title">제 목</th>
                <td>
                <input class="text" type="text" name="title"  id="title" class="" size="40" maxlength="30"value ="${boardNoticeInfo.title}">
                </td>
            </tr>
            <tr>
                <th class="title">내 용</th>
                <td>
                <textarea class="text" name="content"  id="content"  rows="13" cols="40"  maxlength="300">${boardNoticeInfo.content}</textarea>
                </td>
            </tr>
    	</table>
    	<div style="height:15px;"></div>
    	
        <input class="updateBtn" type="button" value="수정완료" class="noticeBtnDetailUp" onclick="nociteDetailUp();">
        <input class="updateBtn" type="button" value="취소" class="noticeDetailBtn" onclick="noticeDetail();">
      </center>
    </form>

   
        <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
<style>

.notice{font-size: 22px;color: white;}
	.community{font-size: 15px;color: white;}
	.record{font-size: 15px;color: white;}
	.book{font-size: 15px;color: white;}

</style>
</html>