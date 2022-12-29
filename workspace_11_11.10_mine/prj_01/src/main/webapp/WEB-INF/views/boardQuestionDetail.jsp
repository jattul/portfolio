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
<title>자주 묻는 질문 상세보기</title>
<script>
$(function(){ 
	$("#community").text("[게시판]");
	
	
});
	function QuestionList(){
		document.boardQuestionForm.submit();
	}
	// 수정,삭제
	function QuestionUpDelForm(){
		document.questionUpDelForm.submit();
	}
	function QuestionDelete(){
		if(confirm("삭제 하시겠습니까?")==false){
			return;
		}
		document.questionDeleteForm.submit();
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
        bottom: 250px;
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
</style>
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
    <center>
        <form name="boardQuestionDetailForm" action="" method="">
            <table class="" border="1" cellpadding="5" cellspacing="0" style="border-collapse:collapse" align="center"
                width="600px">
                <tr class="tableTitle">
                    <th width="350" >${requestScope.boardQuestionInfo.title}</th>             
                    <td>${requestScope.boardQuestionInfo.email}</td>
                    <td>${requestScope.boardQuestionInfo.readCount}</td>
                    <td>${requestScope.boardQuestionInfo.regDate}</td>
                </tr>
                <tr nowrap height="100">
                    <td colspan="4" style=" vertical-align: top; text-align: left;">
                        ${boardQuestionInfo.content}
                    </td>
                </tr>
            </table>

            <table class="" border="0" cellpadding="5" cellspacing="0" align="center" width="600px">
                <tr>
                 <td align="left"><input type="button" value="목록으로" class="QuestionBtn" onclick="QuestionList();"></td>
                 <c:if test="${email == 'system'}">     
                 <td align="right"><input class="QuestionBtn" type="button" value="수정"  onclick="QuestionUpDelForm();">
                                         <input class="QuestionBtn" type="button" value="삭제"  onclick="QuestionDelete();">
                 </td>
                 </c:if>
                 </tr>
            </form>
            
        <form name="boardQuestionForm" action="/boardQuestion.do" method="post" ></form>
          <form name="questionUpDelForm" action="/boardQuestionUpDel.do" method="post" >
            <input type="hidden" name="no" class="no" value="${boardQuestionInfo.no}">
        </form>  
         <form name="questionDeleteForm" action="/boardQuestionDelete.do" method="post" >
            <input type="hidden" name="no" class="no" value="${boardQuestionInfo.no}">
        </form> 
        
            <%@include file="/WEB-INF/views/commonFooter.jsp" %>
        </center>
    </body>
    <style>

.notice{font-size: 15px;color: white;}
	.community{font-size: 22px;color: white;}
	.record{font-size: 15px;color: white;}
	.book{font-size: 15px;color: white;}

</style>
    </html>