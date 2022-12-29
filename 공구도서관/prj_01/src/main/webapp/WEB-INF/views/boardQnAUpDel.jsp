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
<title>문의게시판 글 수정</title>
<script>
	//취소
	
	$(function(){ 
    		$("#community").text("[게시판]");
    		
    		
    	});
		function qnADetail(){
    	document.goForm.action="/boardQnADetail.do";
  		document.goForm.submit();
  	}  	
	//수정완료
	function qnABtnDetailUp(){
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
  		document.goForm.action="/boardQnASave.do"
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
	.select{
		background-color: rgb(219, 213, 189);
		opacity: 0.8;
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

<input type="hidden" name="no" class="no" value="${boardQnaInfo.no}">
	<center>
    <form class="boardQnAUpDelForm" action="/board"> 
    
         <table border="1" cellpadding="5" style="border-collapse:collapse" align="center"> 
            <tr>
                <th style="background-color: rgb(218, 203, 174);">문 의</th>
                <td>
          		<select class="select" name="headerno" class="headerno" >
            		<option  value="" >--문의내용--
		                <option value="0" ${boardQnaInfo.headerno == '0' ? 'selected="selected"' : '' }>계정 문의
		                <option value="1" ${boardQnaInfo.headerno == '1' ? 'selected="selected"' : '' }>공구 문의
		                <option value="2" ${boardQnaInfo.headerno == '2' ? 'selected="selected"' : '' }>서비스 문의
		                <option value="3" ${boardQnaInfo.headerno == '3' ? 'selected="selected"' : '' }>기타
            		</select> 
             </td>
         </tr>
            <tr>
                <th style="background-color: rgb(218, 203, 174);">제 목</th>
                <td>
                <input class="text" type="text" name="title"  id="title" class="" size="40" maxlength="30"value ="${boardQnaInfo.title}">
                </td>
            </tr>
            <tr>
                <th style="background-color: rgb(218, 203, 174);">내 용</th>
                <td>
                <textarea class="text" name="content"  id="content"  rows="13" cols="40"  maxlength="300">${boardQnaInfo.content}</textarea>
                </td>
            </tr>
    	</table>
    	<div style="height:15px;"></div>
    	
        <input type="button" class="updateBtn" value="수정완료" class="qnABtnDetailUp" onclick="qnABtnDetailUp();">
        <input type="button" class="updateBtn" value="취소" class="qnADetailBtn" onclick="qnADetail();">
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