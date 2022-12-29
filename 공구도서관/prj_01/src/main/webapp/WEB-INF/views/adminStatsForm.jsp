<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--====================================================================-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--====================================================================-->
 
<script src="/js/jquery-1.11.0.min.js"></script>


<!DOCTYPE html>
  <head>
	<html>
	<meta charset="UTF-8"> 
	<meta
	name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
	/>
	<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
	/>
	<script src="/js/jquery-1.11.0.min.js"></script>
<title>Insert title here</title>
<script>
	
	function goAdminReportForm(){
			document.adminReportForm.submit();
	}
	function goAdminBook(){
		document.adminReportForm.action="/adminBookForm.do";
		document.adminReportForm.submit();
		
		
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

.reportTable {
      background-color: rgb(187, 181, 160);
  }

.statsTable{
      background-color:  rgb(187, 181, 160);
}
.reportTable:hover {
      background-color: rgb(154, 149, 131);
  }

.statsTable:hover{
      background-color:  rgb(154, 149, 131);
}
</style>



</head>
<body style="background-color: rgb(234, 230, 219);">

<%@include file="/WEB-INF/views/commonHeader.jsp" %>



	<form name="adminStatsForm" method="post" action="/adminStatsForm.do">
    <center>
       <table id="" class="adminTable" border=1 cellspacing=0 width=660px height="40px" cellpadding=5>
            <head>
                <tr>
                    <td width="220px" class="" style="cursor:pointer" onClick="goAdminReportForm();"><center><b>신고 게시판</b></center></td>
                    
                    <td width="220px" class="statsTable"><center><b>[통계화면]</b></center></td> 
                    <td width="220px" align="center" style="cursor:pointer" onclick="goAdminBook();"><b>대여/반납 관리</b></td>
                </tr>
                
		</table>
		<br>
		<table border=1 cellspacing=0 width=900px; cellpadding=5> 
			<tr align="center" height="30px" style="background-color: rgb(199, 197, 193); font-weight:bold;">
				<td>현재 회원수</td> 
				<td>등록된 지점수</td> 
				<td>등록된 공구수</td> 
				<td>현재 대여중인 공구 갯수</td> 
				<td>현재 예약중인 공구 갯수</td>
			</tr>
			<tr align="center" height="25px" style="background-color: rgb(221, 217, 207); font-weight:bold;">
				<td>${requestScope.totMember}</td> 
				<td>${requestScope.totJijum}</td> 
				<td>${requestScope.totTool}</td> 
				<td>${requestScope.totOnRental}</td> 
				<td>${requestScope.totOnBooking}</td>
			</tr>
           
		</table> 

           <div>
           
           
           
           
           
<!--MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM그래프MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-->   
           
           
<table border=0 cellspacing=0 width=1200px >    
<tr>
<td  width=600px > 
<div>
  <br><br><br><canvas id="myChart" width="400px" height="250px"></canvas><br><br><br>
</div>

<td  width=600px > 
<div>
  <canvas id="jijumChart" width="400px" height="250px"></canvas>
</div>

</table>    
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['현재 회원수', '등록된 지점수'],
      datasets: [{
        label: '사용자 통계 그래프',
        data: [${requestScope.totMember}, ${requestScope.totJijum}],
        borderColor: [
        	'rgba(255, 99, 132, 0.2)',
        	'rgba(54, 162, 235, 0.2)'
        ],
        backgroundColor: [
        	'rgba(255, 99, 132, 0.2)',
        	'rgba(54, 162, 235, 0.2)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });




  const tool = document.getElementById('jijumChart');

  new Chart(tool, {
    type: 'bar',
    data: {
      labels: ['등록된 공구수','현재 대여중인 공구 갯수', '현재 예약중인 공구 갯수'],
      datasets: [{
        label: '공구 통계 그래프',
        data: [${requestScope.totTool}, ${requestScope.totOnRental}, ${requestScope.totOnBooking}],
        borderColor: [
        	
        	'rgba(255, 206, 86, 0.2)',
        	'rgba(75, 192, 192, 0.2)',
        	'rgba(255, 159, 64, 0.2)'
        ],
        backgroundColor: [
        	
        	'rgba(255, 206, 86, 0.2)',
        	'rgba(75, 192, 192, 0.2)',
        	'rgba(255, 159, 64, 0.2)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>

<!--MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM그래프MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-->   





           
            </body>
        </table>
    </center>
    </form>
    

	<form name="adminReportForm" method="post" action="/adminReportForm.do"></form>
    
    
    
    <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
</html>