<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html >

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src = "/js/jquery-1.11.0.min.js"></script>
<title>자유게시판 신고하기</title>
    
<script>
$(function(){ 
	$("#community").text("[게시판]");
	
	
});
    function goBoardFree(partno){
      
      
      if(partno =="1"){
          document.boardFreeDetailForm.action="/boardFreeDetail.do";
      }else{
          document.boardFreeDetailForm.action="/boardQnADetail.do";
      }
      document.boardFreeDetailForm.submit();  
    }
    
    function goCheck(){

        var form = document.boardReportForm;

        if($("#reportreason").val() == ""){
                alert("신고 유형을 입력해 주세요.");
                return;
        }
        if($("#reportContent").val() == ""){
               alert("신고 내용을 입력해 주세요.");
               return;
          }
          
        if(form.reportContent.value.length > 199){
              alert("200자 이상 등록 할 수 없습니다.");
                return;
        }
        if( confirm("작성 완료하시겠습니까?")== false){ 		
			return;
   		}
      document.boardReportForm.submit();  
      
        }
    
</script>

<style>
    body{
        font-family: 'PT Sans Narrow';
    }
    img { border: 0; }
    ul { list-style: none; }

    /* .boardDetailReport{
	border: 1px solid rgb(147, 128, 72);
	width: 500px;
	height: 370px;
    } */

    .section{
        border: 1px solid rgb(147, 128, 72);
        width: 500px;
        height: 370px;
    }

    .boardDetailReport{
        background-color:rgb(219, 216, 205); 
    }

    /* .ReportForm{
        border: 1px solid rgb(147, 128, 72);
        height: 25px;
        width: 200px;
    } */

    .reportClearBtn{
        width: 150px;
        height: 30px;
        border: none;
        font-weight: bolder;
        background-color:rgb(200, 193, 166); 
    } 
    .reportCancelBtn{
        width: 150px;
        height: 30px;
        border: none;
        font-weight: bolder;
        background-color:rgb(200, 193, 166); 
    }

    .reportCancelBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(181, 174, 148);
    }

    .reportClearBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(181, 174, 148);
    }
    .reportContent{
        opacity:
    }
    
</style>
    
</head>

<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="boardReportForm" action="/boardReportSave.do" method="post">
    <input type="hidden" name="no" class="no" value="${no}">
    <input type="hidden" name="partno" class="partno" value="${partno}">	
    <input type="hidden" name="writerEmail" class="writerEmail" value="${writerEmail}">	
    	<center>
        <section class="section">
            <br>
            <h3>게시글 신고</h3><br>
                <select class="boardDetailReport" name="reportreason" id="reportreason">
                    <option value="" selected>신고 사유를 선택해주세요</option>
                    <option value="상업적 게시글">상업적 게시글</option>
                    <option value="음란성 게시글">음란성 게시글</option>
                    <option value="무단전재">무단전재</option>
                    <option value="욕설">욕설</option>
                    <option value="기타">기타</option>
                </select>
                <div style="height: 20px;"></div>
                신고 내용 작성 (200자 이내)<br>
                <textarea name="reportContent" class="reportContent" rows="6" cols="40" maxlength="200"></textarea><br><br>
                <input type="button" value="등록" class="reportClearBtn" onclick="goCheck();">
                <input type="button" value="취소" class="reportCancelBtn" onclick="goBoardFree('${partno}');">
                <br><br><br><br>
            </section>
        </center>
    </form>
    <form name="boardFreeDetailForm" action="/boardFreeDetail.do" method="post" >
        <input type="hidden" name="no" class="no" value="${no}">
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