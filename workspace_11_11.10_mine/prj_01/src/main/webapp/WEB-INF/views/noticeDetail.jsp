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
<title>공지사항 상세보기</title>
    
<script>
$(function(){ 
	$("#notice").text("[공지사항]");
	
	
});
    function goNotice(){
        document.noticeForm.submit();
        }
    // 수정,삭제
    function goNoticeUpDelForm(){
        document.noticeUpDelForm.submit();
    }
    function goNoticeDelete(){
        if(confirm("삭제 하시겠습니까?")==false){
            return;
        }
        document.noticeDeleteForm.submit();
    }
    
</script>
<style>

    *{
    font-family: 'PT Sans Narrow';
    }
    img { border: 0; }
    ul { list-style: none; }

    .noticePage{
        position: relative;
        left: 140px;
        border: 1px solid rgb(147, 128, 72);
        width: 1000px;
        height: 350px;
    }

    .noticeSearch th{
        background-color:  rgb(195, 186, 154);
    }
    .selectBox{
        background-color:  rgb(227, 223, 209);
        width: 60px;
        height: 22px;
    }

    .SearchBtn {
        background-color:rgb(210, 203, 176);
        width: 80px;
        height: 22px;
        border: none;
        font-weight: bolder;
    }

    .searchTxt{
    width: 200px;
    height: 20px;
    font-size: 12px;
    border: 0;
    border-radius: 5px;
    /* outline: none; */
    padding-left: 10px;
    background-color: rgb(227, 223, 209);
    opacity: 0.8;
    }
    .tableTitle{
        background-color: rgb(210, 203, 176);
    }
    
    .tablesub td{
        background-color: rgb(221, 216, 196);
    }

    .tableBtn{
        background-color: rgb(224, 211, 174);
    }
    .tableBtn span{
        background-color: rgb(224, 211, 174);
    }



    .Btn{
        position: relative;
        left: 280px;
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

    .writeBtn{
        position: relative;
        left:380px;
        top: 2px;
        bottom: 5px;
        width: 110px;
        height: 25px;
        border: none;
        font-weight: bolder;
        background-color:rgb(225, 215, 185) ;
    }

    .writeBtn:hover{
        background-color:rgb(214, 202, 166) ;
    }
    
    .reportTable{
    position:relative;
    left:250px;
    width:500px;
    }


</style>

    
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
      <form name="noticeDetailForm" action="/noticeDetail.do" method="post" >
        <section class="noticePage"><br><br>
            <center><div style="font-size:20pt; font-weight: bold;">공지사항</div></center><br>
                <table class="reportTable" border="1px" cellpadding="5" cellspacing="0" style="border-collapse:collapse" align="center" width="600px">
                    <tr>
                        <td colspan="3"  style="font-weight:bold">${requestScope.boardNoticeInfo.title}</td>
                    </tr>
                    <tr>
                        <td class="tableTitle" style="font-weight:bold">${requestScope.boardNoticeInfo.email}</td>
                        <td class="tableBtn"><span style="cursor:pointer" onclick="">${requestScope.boardNoticeInfo.readCount}</span></td>
                        <td class="tableBtn"><span style="cursor:pointer" onclick=""></span>${requestScope.boardNoticeInfo.regDate}</td>
                    </tr>
                    <tr>
                        <td class="tableTitle" style="font-weight:bold">내용</td>
                        <td colspan="2">
                            <div>
                                ${boardNoticeInfo.content}<br><br><br><br>
                            </div>
                        </td>
                    </tr>
                </table>

                <div style="height: 10px;"></div>
                <input class="Btn" type="button" value="목록으로" onclick="goNotice();">
                <c:if test="${email == 'system'}">     
                <td align="right"><input class="writeBtn" type="button" value="수정"  onclick="goNoticeUpDelForm();">
             						<input class="writeBtn" type="button" value="삭제"  onclick="goNoticeDelete();">
             </td>
             </c:if>
        </section>
        </form>
        <form name="noticeForm" action="/notice.do" method="post" ></form>
        <form name="noticeUpDelForm" action="/noticeUpDel.do" method="post" >
           <input type="hidden" name="no" class="no" value="${boardNoticeInfo.no}">
       </form>  
        <form name="noticeDeleteForm" action="/noticeDelete.do" method="post" >
           <input type="hidden" name="no" class="no" value="${boardNoticeInfo.no}">
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