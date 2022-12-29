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
<title>문의게시판 상세보기</title>
<script>
$(function(){ 
	$("#community").text("[게시판]");
	
	
});
	function goBoardQna(){
		document.boardQnAForm.submit();
	}
	// 신고
	function goBoardReportForm(){
		document.boardReportForm.submit();
	}
	// 수정,삭제
	function goBoardQnaUpDelForm(){
		
		if("<%= session.getAttribute("email") %>"!="${requestScope.boardQnaInfo.email}"){
			alert("작성자만 가능합니다");
			return;
		}
		document.boardQnAUpDelForm.submit();
	}
	
	
	
	
	
	
	
	
	
	
	
	function goBoardQnaDelete(){
	    if( "<%= session.getAttribute("email") %>" == "system"){
	        if( confirm("삭제 하시겠습니까?")== false){ 		
	            return;
	        }	
	      document.boardQnADeleteForm.submit();
	    } 
	    else if( "<%= session.getAttribute("email") %>" != "${requestScope.boardQnaInfo.email}"){
	        alert("작성자만 가능합니다");
	        return;
	    } 
	    else {
	        if( confirm("삭제 하시겠습니까?")== false){ return; }
	        document.boardQnADeleteForm.submit();
      }
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
</style>
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
	<center>
        <form name="boardQnADetailForm">
            <table class="" border="1" cellpadding="5" cellspacing="0" style="border-collapse:collapse" align="center"
                width="600px">
                <tr style="background-color: rgb(211, 200, 173);">
                    <th width="350">${requestScope.boardQnaInfo.title}</th>
                    <td>${requestScope.boardQnaInfo.email}</td>
                    <td>${requestScope.boardQnaInfo.readCount}</td>
                    <td>${requestScope.boardQnaInfo.regDate}</td>
                </tr>
                <tr nowrap height="100" >
                    <td colspan="4" style=" vertical-align: top; text-align: left;" style="background-color: rgb(218, 203, 174);">
                        ${boardQnaInfo.content}
                    </td>
                </tr>
            </table>
            <table class="" border="0" cellpadding="5" cellspacing="0" align="center" width="600px">
                <tr>
                    <td align="left"><input type="button" value="목록" class="qnABtn" onclick="goBoardQna();"></td>
                    <td align="right"><input type="button" value="신고" class="qnABtn" onclick="goBoardReportForm();" >
                    <input type="button" value="수정" class="qnABtn" onclick="goBoardQnaUpDelForm();" > 
                        <input type="button" value="삭제"  class="qnABtn" onclick="goBoardQnaDelete();">
                    </td>
                </tr>
            </table>
        </form>
    </center>
    
    <form name="boardQnAForm" action="/boardQnA.do" method="post" ></form>
    <form name="boardReportForm" action="/boardReport.do" method="post" >
    	<input type="hidden" name="no" class="no" value="${boardQnaInfo.no}">
    	<input type="hidden" name="partno" class="partno" value="${boardQnaInfo.partno}">
    	<input type="hidden" name="writerEmail" class="writerEmail" value="${boardQnaInfo.email}">
    	
    </form>
    <form name="boardQnAUpDelForm" action="/boardQnAUpDel.do" method="post" >
    	<input type="hidden" name="no" class="no" value="${boardQnaInfo.no}">
    </form>
    <form name="boardQnADeleteForm" action="/boardQnADelete.do" method="post" >
    	<input type="hidden" name="no" class="no" value="${boardQnaInfo.no}">
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