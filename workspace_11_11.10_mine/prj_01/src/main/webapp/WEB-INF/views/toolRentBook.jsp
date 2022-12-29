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


    $(function(){ init();});
    
    function init(){
    	$("#book").text("[대여 예약하기]");
        $("[name=bookDate]").change(function(){
            
            var data1 = $("[name=bookDate]").val();
            $("[name=bookDate]").val();	
            } );
        
    }

    function goCheck(){
    	sample();
  
        }  
    
    function sample(){
           	 
        var toolNo=$("[name=no]").val();
        var jijumNo=$("[name=jijumno]").val();
        var selectedDate=$("[name=bookDate]").val();
        var toolName=$("[name=toolname]").val();
    	
        if(confirm("예약 하시겠습니까?")){    
        $.ajax({
                    url:"/upToolStatusProc.do"
                    ,type:"post"
                    ,data:$("[name='toolRentBookForm']").serialize() 
                        //, "selectedDate",selectedDate, "toolName",toolName}
                        
                    ,success:function(idCnt){         	
                        if(idCnt==2){
                            alert("예약 완료됐습니다");
                            document.toolRentMainForm.submit();
                        }else{
                            alert("예약 실패했습니다");
                            document.toolRentMainForm.submit();
                        }
                        
                    }
                    ,error:function( ){
                        alert("웹서버 접속 실패");
                    }
                }
            );
        
        }
        
        
    }
    
    
    function goToolMain(){
    	document.toolRentMainForm.submit();
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
    position: relative;
    top: 20px;
    width: 140px;
	height: 30px;
	color:rgb(0, 0, 0);
	background-color:rgb(179, 171, 147) ;
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

.checkTxt{
    background-color:rgb(219, 210, 184) ;
}

.reserveTxt{
    background-color:rgb(205, 197, 171) ;
}
</style>
    
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
    <center>
        <form name="toolRentBookForm" action="/toolRentBook.do" method="post">
        <table class="" border="1px" cellpadding="5" cellspacing="0" style="border-collapse:collapse" align="center" width="600px">
        <input type="hidden" name="no" value="${requestScope.tools.NO}">
        <input type="hidden" name="jijumno" value="${requestScope.tools.JIJUMNO}">
        <input type="hidden" name="bookDate">
        <input type="hidden" name="toolname" value="${requestScope.tools.NAME}">
            <tr>
                <td colspan="4" style="background-color: rgb(209, 203, 193); font-weight: bold; "><b>공구 예약</b></td>
            </tr>
            <tr>
                <td rowspan="5" width="35%"><img src="resources/img/${requestScope.tools.NO}.jpg" width="180" height="180"></td>
                <td colspan="2">공구명 : ${requestScope.tools.NAME}</td>
                <td>브랜드 : ${requestScope.tools.BRAND}</td>
            </tr>
            <tr>
                <td colspan="3">지점명 : ${requestScope.tools.JIJUMNAME}</td>
            </tr>
            <tr>
                <td colspan="3">주소 : ${requestScope.jijums.ADDR }</td>
            </tr>
        </table>
        <div style="height:20px;"></div>
        <table class="" border="1px" cellpadding="5" cellspacing="0"  style="border-collapse:collapse" align="center" width="600px">
            <tr>
                <td class="checkTxt" colspan="4" align="center"><b>예약 정보를 확인해주세요</b></td>
            </tr>
            <tr>
                <th class="reserveTxt">예약자 이름</th>
                <td>${memberInfo.get(0).get('NAME')}</td>
            </tr>
            <tr>
                <th class="reserveTxt">예약자 전화번호</th>
                <td>${memberInfo.get(0).get('PHONE')}</td>
            </tr>
            <tr>
                <th class="reserveTxt">예약 날짜 선택</th>
                <td><input type="date" name="bookDate" min="sysdate" max="2025-12-31"/></td>
            </tr>
            <tr>
                <th class="checkTxt"  align="center" colspan="4">예약한 공구는 해당 대여소 방문 수령만 가능합니다.</th>
            </tr>
        </table>
        <input type="button" class="Btn" value="확인" onclick="goCheck();">
        <input type="button" class="Btn" value="취소" onclick="goToolMain();">
    </center>
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