<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!doctype html>
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


$(function (){ 
	$("#record").text("[예약조회]");
});


	function goMyPageInfo(){
		document.goMyPageInfoForm.submit();
		
	}
	function goMyWriting(){
		document.goMyWritingForm.submit();
		
	}
	function viewList(){
	} 
	
	function goCancle(no1,no2){
		$("[name=cancleNo]").val(no1);
		$("[name=cancleToolNo]").val(no2);
		if(confirm("예약을 취소하시겠습니까?")){
			
			$.ajax(
    				{
    					url:"/bookCancleProc.do"
    					,type:"post"
    					,data:$("[name=goForm]").serialize() 
    						
    					,success:function(idCnt){
    						if(idCnt==2){
    							alert("예약 취소 됐습니다.");
    							
			document.goForm.action="/myPageBookList.do"
			document.goForm.submit();
    							
    						}else{
    							alert("예약 취소에 실패했습니다");
    							return;
    						}
    						
    					}
    					,error:function( ){
    						alert("웹서버 접속 실패");
    					}
    				}
    			);
			
			
			
			
		}
			
			
		
		
	}
	
	
</script>
<style>
    body{
        font-family: 'PT Sans Narrow';
        
    }
    img { border: 0; }
    ul { list-style: none; }

    .myPageTitle .myInfo:hover{
        background-color: rgb(199, 193, 168);
    }

    .myPageTitle .writeMyself:hover:hover{
        background-color: rgb(199, 193, 168);
    }

   
    .myInfo{
        width: 63px;
    }
    .checkRent{
        width: 75px;
    }
    .writeMyself{
        width: 60px;
    }
    
    .bookTable{
     border:1px gray solid;
     background-color: rgb(199, 193, 168);
    }
</style>

</head>

<body style="background-color: rgb(234, 230, 219);" >
<form name="goForm" method="post"><input type="hidden" name="cancleNo"><input type="hidden" name="cancleToolNo"></form>
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="cancleForm" method="post"><input type="hidden" name="cancleNo" >   </form>
    <center>
    <form name="goMyPageInfoForm" method="post" action="/myPageInfo.do"></form>
    <form name="goMyWritingForm" method="post"  action="/myPageMyWritingList.do" ></form>

	<form name="ggg">
        <table  style="width:800px; height:80px;  "  id="bookTable" class="bookTable" border=1 cellspacing=0   cellpadding=5>
                <tr class="myPageTitle" style="background-color: rgb(202, 188, 145) ;">
                    <td class="myInfo" colspan="2" style="background-color:rgb(234, 230, 219);  cursor:pointer" onClick="goMyPageInfo();"><center><b>내 정보</b></center></td>
                    
                    <td style="background-color:" class="checkRent" colspan="2"><center><b>[대여 조회]</b></center></td>
                    
                    <td class="writeMyself" colspan="2" style="background-color:rgb(234, 230, 219); cursor:pointer" onClick="goMyWriting();"><center><b>내가 쓴 글</b></center></td> 
                </tr>     
        </table>
        <br><br>
        <table id="" class="" border=1 cellspacing=0 width=600px  cellpadding=5>
                <c:forEach var="onBooking" items="${requestScope.onBookingList}" varStatus="loopTagStatus">
                <c:forEach var="jijum" items="${requestScope.jijumList}" varStatus="loopTagStatus">
                    <c:if test="${onBooking.jijumNo == jijum.no}">	
                        <tr >
                            <td align="center" style="width:50%; height:320px;">
                            <img src="resources/img/${onBooking.toolNo}.jpg" width="100%" height="100%">
                            <td>제품명 : ${onBooking.toolName}
                                <br>예약일 : ${onBooking.bookDate}
                                <br>지점명 : ${jijum.name}   
                                <br>지점전화번호 : ${jijum.phone}     
                                <br>지점주소 : ${jijum.addr}
                                
                                <br>현재 상태 : 예약중
                                <br><span style="cursor:pointer" onclick="goCancle(${onBooking.no},${onBooking.toolNo});">[예약 취소]</span>
                        </tr>
                    </c:if>
                    
                </c:forEach> 
                </c:forEach> 
                
                
                <c:forEach var="book" items="${requestScope.myBookList}" varStatus="loopTagStatus">
                <c:forEach var="jijum" items="${requestScope.jijumList}" varStatus="loopTagStatus">
                    <c:if test="${book.jijumNo == jijum.no}">	
                        <tr>
                            <td style="width:50%; height:320px;" align="center"><img src="resources/img/${book.toolNo}.jpg" width="100%" height="100%">
                            <td >제품명 : ${book.toolName}
                                <br>대여일 : ${book.rentalDate}
                                <br>지점명 : ${jijum.name}   
                                <br>지점전화번호 : ${jijum.phone}     
                                <br>지점주소 : ${jijum.addr}
                                
                                <br>현재 상태 : 대여중
                        </tr>
                    </c:if>  
                </c:forEach> 
                </c:forEach> 
                <c:forEach var="return" items="${requestScope.returnList}" varStatus="loopTagStatus">
                <c:forEach var="jijum" items="${requestScope.jijumList}" varStatus="loopTagStatus">
                    <c:if test="${return.jijumNo == jijum.no}">	
                        <tr >
                            <td style="width:50%; height:320px;" align="center"><img src="resources/img/${return.toolNo}.jpg" width="100%" height="100%">
                            <td >제품명 : ${return.toolName}
                                <br>대여일 : ${return.rentalDate}
                                <br>지점명 : ${jijum.name}   
                                <br>지점전화번호 : ${jijum.phone}     
                                <br>지점주소 : ${jijum.addr}
                                
                                <br>현재 상태 : 반납완료
                            </td>

                        </tr>
                    </c:if>
                    
                </c:forEach> 
                </c:forEach> 			
             </table> 

    </form>
    </center>
    <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
<style>

.notice{font-size: 15px;color: white;}
	.community{font-size: 15px;color: white;}
	.record{font-size: 22px;color: white;}
	.book{font-size: 15px;color: white;}

</style>
</html>
