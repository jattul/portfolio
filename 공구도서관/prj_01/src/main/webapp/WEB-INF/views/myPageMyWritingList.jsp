<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>마이페이지</title>


<script>
    $(function (){init();});
    
    function init(){
        var formObj1 = $("[name=mypage]");
        
        
        
    }
    
    function goMyPageInfo(){
        document.goMyPageInfoForm.submit();
        
    }
    function goBookList(){
        document.goBookListForm.submit();
        
        
    }
    function goMyWriting(){
        document.goMyWritingForm.submit();
        
    }
    function goPwChange(){
        document.goPwChangeForm.submit();
        
    }
    function goPhoneChange(){
        document.goPhoneChangeForm.submit();
        
    }
    
	function goWriterListDetail(type, no){
		if(type==2){
			 location.href="boardQnADetail.do?no=" + no;
		}else{
			 location.href="boardFreeDetail.do?no=" + no;
			
		}

	}
    
    
    
</script>
    
<style>
    body{
        font-family: 'PT Sans Narrow';
    }
    img { border: 0; }
    ul { list-style: none; }

    .myPageTitle .myInfo:hover:hover{
        background-color: rgb(199, 193, 168);
    }

    .myPageTitle .checkRent:hover:hover{
        background-color: rgb(199, 193, 168);
    }

    
    .tableTitle{
        background-color: rgb(210, 203, 176);
    }

    .tableblank{
        background-color: rgb(227, 223, 209);
    }
</style>

</head>

<body style="background-color: rgb(234, 230, 219);">

<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="goMyPageInfoForm" method="post" action="/myPageInfo.do"></form>
<form name="goBookListForm" method="post" action="/myPageBookList.do" ></form>
<form name=boardFreeDetailForm action="/boardFreeDetail.do" method="post" >
         <input type="hidden" name="no" class="no" value="">
   </form>
<center>

<form name="myPageMyWritingList" method="post"  action="/myPageMyWritingList.do" >
  
       <table  style="width:800px; height:80px;  "  id="bookTable" class="bookTable" border=1 cellspacing=0   cellpadding=5>
                <tr class="myPageTitle" style="background-color: rgb(202, 188, 145) ;">
                    <td class="myInfo" colspan="2" style="background-color:rgb(234, 230, 219);  cursor:pointer" onClick="goMyPageInfo();"><center><b>내 정보</b></center></td>
                    
                    <td style="background-color:rgb(234, 230, 219);cursor:pointer; " class="checkRent" onclick="goBookList();" colspan="2"><center><b>대여 조회</b></center></td>
                    
                    <td class="writeMyself" colspan="2" style="background-color:; cursor:pointer" onClick="goMyWriting();"><center><b>[내가 쓴 글]</b></center></td> 
                </tr>     
        </table><br><br>
            <!-- 내 정보-->
           
           <!-- 대여 조회-->
            <!--내가 쓴 글-->
        
       
     <table class="tableSub" border="1px" cellpadding="12" cellspacing="2" style="border-collapse:collapse" align="center"
            width="600px">
                <tr class="tableTitle" style="height:40px;">
                  <th class="Title">카테고리</th>
                    <th class="Title">제목</th>
                    <th class="Writer">등록일</th>
                </tr>
               
                 <c:forEach var="myWriterList" items="${requestScope.myWriterList}" varStatus="loopTagStatus">
                  <tr height="60px;" align="center" onClick="goWriterListDetail('${myWriterList.type}' ,'${myWriterList.no}' );">
                   <td style="cursor:pointer">${myWriterList.typetitle} </td>
                    <td style="cursor:pointer">${myWriterList.title} </td>
                    <td style="cursor:pointer">${myWriterList.regDate}</td>
                </tr>
              </c:forEach>
                
            </table>
            
            

    
</form>
</center>
     <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
</html>
