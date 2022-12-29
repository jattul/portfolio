<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"  content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
<script src="/js/jquery-1.11.0.min.js"></script>
<title>자유게시판 글쓰기</title>
 <script> 
 $(function(){ 
		$("#community").text("[게시판]");
		
		
	});
    function goBoardFree(){
		document.boardFreeForm.submit();
	}
    
    function goBoardSave(){
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
   	 if($("#content").val() .length > 250){
		 alert("내용은 250자 이상은 입력 할 수 없습니다.");
 		return;
	 }
   		if( confirm("작성 완료하시겠습니까?")== false){ 		
			return;
   		}
    	document.boardFreeWriteForm.submit();
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
    .text{
        opacity:
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
    .content{
       opacity:
    }
</style>
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="boardFreeWriteForm" id="boardFreeWriteForm"  method="post" action="/boardFreeSave.do" >
    <center>
        <p><b>자유게시판 글쓰기</b></p>
        <table border="1" cellpadding="5" style="border-collapse:collapse" align="center"> 
           
            <tr>
                <th class="tableTitle">제 목</th>
                <td>
                <input type="text" name="title"  id="title" class="content" size="40" maxlength="30">
                </td>
            </tr>
            <tr>
                <th class="tableTitle">내 용</th>
                <td>
                <textarea name="content"  id = "content"  class="content" rows="13" cols="40"  maxlength="300"></textarea>
                </td>
            </tr>
    </table>
    <div style="height:15px;"></div>

    <input type="button" value="등록" class="updateBtn" onClick="goBoardSave();">
    <input type="button" value="목록보기" class="updateBtn" onClick="goBoardFree();">
    </form>
    </center>
	<form name="boardFreeForm" method="post" action="/boardFree.do"></form>
	<%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
<style>

.notice{font-size: 15px;color: white;}
	.community{font-size: 22px;color: white;}
	.record{font-size: 15px;color: white;}
	.book{font-size: 15px;color: white;}

</style>
</html>