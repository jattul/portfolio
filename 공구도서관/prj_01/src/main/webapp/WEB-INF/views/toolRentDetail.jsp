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
<title>Document</title>

    <script>
    $(function(){   init(); });
    
    function init(){
    	
    	$("#book").text("[대여 예약하기]");
		var formToolNo = ${requestScope.tools.NO};
		var formJijumNo = ${requestScope.jijums.NO};
    	$("[name=no]").val(formToolNo);
    	$("[name=jijumno]").val(formJijumNo);
    	
    	
    }
    
    function goToolMain(){ document.toolRentMainForm.submit();}
    function goToolBook(){
    	if("${tools.NOWSTATUS}"!=0){alert("예약이 불가능합니다"); return;}
    	

		var formToolNo = ${requestScope.tools.NO};
		var formJijumNo = ${requestScope.jijums.NO};
		
    	$("[name=no]").val(formToolNo);
    	$("[name=jijumno]").val(formJijumNo);
    	
    	document.toolRentBookForm.submit();
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
    .Btn{
    width: 80px;
	height: 30px;
	color:rgb(0, 0, 0);
	background-color:rgb(179, 171, 147) ;
	border: none;
	font-size:12px;
	transition: all 0.2s ease ;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	-o-transition: all 0.2s ease;
    outline:none;
}
.Btn:hover{
	background-color:rgb(166, 155, 121) ;
}
.Btn{
    position: left;
    left: 680px
}
.rentTable{
    background-color: rgb(228, 226, 212);
}
</style>
    
    
    
    
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
        <!--===============================================================-->
        <form name="toolRentDetailForm" action="/toolRentDetail.do" method="post">
        <center>
        <table class="rentTable" border="1px" cellpadding="5" cellspacing="0" style="border-collapse:collapse"width="600px">
            <tr>
                <td rowspan="6" width="40px" ><img src="resources/img/${requestScope.tools.NO}.jpg" width="180" height="180"></td>
                <td >공구명 : ${requestScope.tools.NAME}</td>
            </tr>
            <tr>
                <td>브랜드 : ${requestScope.tools.BRAND}</td>
            </tr>
            
            <tr>
                <td>현재 상태 : ${tools.NOWSTATUS==0? '예약가능':'예약불가능' }</td>
            </tr>
            
            <tr>
                <td>지점명 : ${requestScope.jijums.NAME}</td>
                
            </tr>
            
            <tr>
                <td>운영시간 : ${requestScope.jijums.TIME}</td>
            </tr>
            
            <tr>
                <td >주소 : ${requestScope.jijums.ADDR}</td>
            </tr>
            
        </table>
        </center>
        <div style="height: 10px;"></div>
        <center>
        <!--===============================================================-->
        <table class="tableBtn" border="1px" cellpadding="5" cellspacing="0" style="border-collapse:collapse" width="600px">
            <tr>
                <input class="Btn" type="button" value="목록으로" onclick="goToolMain();">&nbsp;&nbsp;
                <input class="Btn" type="button" value="예약" onclick="goToolBook();">
            </tr>
        </table>
        </center>
    </form>
    
	<form name="toolRentBookForm" action="/toolRentBook.do" method="post">
	<input type="hidden" name="no" >
	<input type="hidden" name="jijumno" >
	</form>
	
	
	<form name="toolRentMainForm" action="/toolRentMainForm.do" method="post">
	</form>
	
    <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
<style>

.notice{font-size: 15px;color: white;}
	.community{font-size: 15px;color: white;}
	.record{font-size: 15px;color: white;}
	.book{font-size: 22px;color: white;}

</style>
</html>