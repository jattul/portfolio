<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >

<head>
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"  content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
<script src="/js/jquery-1.11.0.min.js"></script>
<title>자유게시판</title>
<script>
$(function(){ 
	$("#community").text("[게시판]");
	
	
});
    function goBoardFree(){
        document.boardFreeForm.submit();
    }
    // 신고
    function goBoardReportForm(){
        document.boardReportForm.submit();
    }
    // 수정,삭제
    function goBoardFreeUpDelForm(){
        if("<%= session.getAttribute("email") %>"!="${requestScope.boardFreeInfo.email}"){
            alert("작성자만 가능합니다");
            return;
        }
        
        document.boardFreeUpDelForm.submit();
    }
    function goBoardFreeDelete(){
        if( "<%= session.getAttribute("email") %>" == "system"){
            if( confirm("삭제 하시겠습니까?")== false){ 		
                return;
            }	
          document.boardFreeDeleteForm.submit();
        } else if( "<%= session.getAttribute("email") %>" != "${requestScope.boardFreeInfo.email}"){
            alert("작성자만 가능합니다");
            return;
        }
	    else {
	        if( confirm("삭제 하시겠습니까?")== false){ return; }
	        document.boardFreeDeleteForm.submit();
      	}
    }	

</script>
<style>
    body{
        font-family: 'PT Sans Narrow';
    }
    img { border: 0; }
    ul { list-style: none; }

    .boardTitle span:hover{
        color: rgb(240, 227, 186);
            text-decoration: underline;
            text-underline-position: under;
            text-decoration-color: rgb(240, 227, 186);
            /* background-color: rgb(226, 211, 166); */
            /* border: solid 2px rgb(226, 211, 166); */
    }
    .tableTitle{
        background-color: rgb(210, 203, 176);
    }

    #boardBtn{
        width: 100px;
        height: 25px;
        background-color:rgb(200, 193, 166) ;
        border: solid 2px rgb(200, 193, 166) ;
        font-weight: bolder;
        /* background-color:rgb(200, 193, 166);  */
    }

    #boardBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(222, 213, 182);
    }

    .boardBtnList{
        position: relative;
        right: 30px;
    }
    .boardBtnMod{
        position: relative;
        left: 110px;
    } 
    .boardBtnDel{
        position: relative;
        left: 22px;
    } 
    .boardBtnWarn{
        position: relative;
        bottom: 25px;
        left: 295px;
    }

    .updateBtn{
        position: relative;
        bottom: 5px;
        width: 90px;
        height: 45px;
        border: none;
        font-weight: bolder;
        background-color:rgb(210, 203, 176);; 
    }

    .updateBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(181, 174, 148);
    }

    .modBtn{
        position: relative;
        bottom: 5px;
        width: 90px;
        height: 25px;
        border: none;
        font-weight: bolder;
        background-color:rgb(202, 188, 145) ;
    }
    .modBtn:hover{
	background-color:rgb(166, 155, 121) ;
    }  
    
    .delBtn{
        position: relative;
        top: 2px;
        bottom: 5px;
        width: 90px;
        height: 25px;
        border: none;
        font-weight: bolder;
        background-color:rgb(202, 188, 145) ;
    }
    .delBtn:hover{
	background-color:rgb(166, 155, 121) ;
    }  

    .content{
        background-color: rgb(231, 226, 212);;;
    }
    .comment{
        position: relative;
        width: 650px;
        border: solid 0.2px;
        border-color: rgb(196, 179, 159) ;
        bottom: 30px;
    }
    /* .updateBlock{
        position: relative;
        left: 20px;
    } */

    .Btn2{
        position:relative;
        bottom: 7px;
        left: 440px;
    } 
    .Btn1{
        position:relative;
        /* bottom: 5.4px; */
        left: 440px;
    } 
    .commenter{
        width: 20px;
    }
    
</style>
</head>

<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="goForm" method="post"></form>
    <center>
        <form name="boardFreeDetailForm" action="/boardFreeDetailForm.do" method="post">
            <h2>
                자유게시판
            </h2>

            <table class="" border="1" cellpadding="5" cellspacing="0" style="border-collapse:collapse" align="center"
                width="650px">
                <tr class="tableTitle">
                    <th width="350" >${requestScope.boardFreeInfo.title}</th>             
                    <td>${requestScope.boardFreeInfo.email}</td>
                    <td>${requestScope.boardFreeInfo.readCount}</td>
                    <td>${requestScope.boardFreeInfo.regDate}</td>
                </tr>
                <tr nowrap height="100">
                    <td class="content" colspan="4" style=" vertical-align: top; text-align: left;">
                        ${boardFreeInfo.content}
                    </td>
                </tr>
            </table>
            <table class="" border="0" cellpadding="5" cellspacing="0" align="center" width="600px">
                <tr>
                    <td align="left" >&nbsp;<input id="boardBtn" class="boardBtnList" type="button" value="목록" onclick="goBoardFree();"></td>
                    <td align="right" ><input  id="boardBtn" class="boardBtnMod" type="button" value="수정"  onclick="goBoardFreeUpDelForm();"></td>
                    <td align="right" ><input id="boardBtn" class="boardBtnDel" type="button" value="삭제" class="" onclick="goBoardFreeDelete();"></td>
                    <!-- <td align="right"><br><br><br><input class="boardBtn" type="button" value="신고" onclick="goBoardReportForm()"></td> -->
                </tr>
                <td align="left"><input id="boardBtn" class="boardBtnWarn" type="button" value="신고" onclick="goBoardReportForm()"></td>
            </table>
        </form>
        </center>
	<form name="boardFreeForm"action="/boardFree.do" method="post" ></form>
	<form name="boardReportForm"action="/boardReport.do" method="post" >
		<input type="hidden" name="no" class="no" value="${boardFreeInfo.no}">
		<input type="hidden" name="partno" class="partno" value="${boardFreeInfo.partno}">
    	<input type="hidden" name="writerEmail" class="writerEmail" value="${boardFreeInfo.email}">
	</form>
	<form name="boardFreeUpDelForm"action="/boardFreeUpDel.do" method="post" >
		 <input type="hidden" name="no" class="no" value="${boardFreeInfo.no}">
	</form>
	<form name="boardFreeDeleteForm"action="/boardFreeDelete.do" method="post" >
		 <input type="hidden" name="no" class="no" value="${boardFreeInfo.no}">
	</form>
	
	
	
	
    </center>
    <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
<style>

.notice{font-size: 15px;color: white;}
	.community{font-size: 22px;color: white;}
	.record{font-size: 15px;color: white;}
	.book{font-size: 15px;color: white;}

</style>