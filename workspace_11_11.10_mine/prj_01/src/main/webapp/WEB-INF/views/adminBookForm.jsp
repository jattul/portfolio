<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--====================================================================-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--====================================================================-->
 
<script src="/js/jquery-1.11.0.min.js"></script>
<!--====================================================================-->
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
	function goAdminStatsForm(){
			document.adminStatsForm.submit();
	}

	// 자유게시판 게시글 제목 누르면 글 상세보기로 이동
	function goFreeBoardDetailForm( postNo ){
		$("[name='boardFreeDetail']").find("[name='no']").val( postNo );
		document.boardFreeDetail.submit();
	}	
	

	
	
	

	// 자유게시판 게시글 제목 누르면 글 상세보기로 이동
	function goQnABoardDetailForm( postNo ){
		$("[name='boardQnADetail']").find("[name='no']").val( postNo );
		document.boardQnADetail.submit();
	}	
	
	
	
	 function pageNoBtn( pageNo ){
		 	$(".selectPageNo").val( pageNo );
		 	FreeSearch( );
	}
	function goUpBook(no){
		$("[name=upBookNo]").val(no);
		if(confirm("대여로 바꾸시겠습니까?")){
			$.ajax({
            url:"/upBook.do"
            ,type:"post"
            ,data:$("[name=upBookForm]").serialize() 
                //, "selectedDate",selectedDate, "toolName",toolName}
                
            ,success:function(idCnt){         	
                alert("성공")
                
            }
            ,error:function( ){
                alert("웹서버 접속 실패");
            }
        }
    );
			
		}
		
		rere();
		
		
	
	
	}
	
	function goUpRental(no){
		
		
		$("[name=upRentalNo]").val(no);
		if(confirm("반납완료로 바꾸시겠습니까?")){
			$.ajax({
            url:"/upRental.do"
            ,type:"post"
            ,data:$("[name=upBookForm]").serialize() 
                //, "selectedDate",selectedDate, "toolName",toolName}
                
            ,success:function(idCnt){         	
                alert("성공")
                
            }
            ,error:function( ){
                alert("웹서버 접속 실패");
            }
        }
    );
			
		}
		
		rere();
		
		
	
	
	}
	
	
	
	
	
	
	
	function goAdminReport(){
		document.adminStatsForm.action="/adminReportForm.do";
		document.adminStatsForm.submit();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	function rere(){
		document.upBookForm.action="/adminBookForm.do";
		document.upBookForm.submit();
		
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
<form name="upBookForm"><input name="upBookNo" type="hidden"><input name="upRentalNo" type="hidden"> </form>


	<form name="adminReportForm" method="post" action="/adminReportForm.do">
    <center>
        <table id="" class="adminTable" border=1 cellspacing=0 width=660px height="40px" cellpadding=5>
            <head>
                <tr>
                    <td width="220px" style="cursor:pointer" onClick="goAdminReport();" ><center><b>신고 게시판</b></center></td>
                    
                    <td width="220px" style="cursor:pointer" onClick="goAdminStatsForm();"><center><b>통계화면</b></center></td> 
               		<td class="reportTable"  width="220px" align="center" style="cursor:pointer" onclick="goAdminBook"><b>[대여/반납 관리]</b></td>
                </tr>
                
        </table>
        <br>
        <table border=1 cellspacing=0 cellpadding=5  width="800px" style="background-color: rgb(226, 223, 217);"> 
           <tr height="50px" align="center">
           <td width="15%" style="background-color: rgb(199, 197, 193);"><b>현재 상태</b></td> 
		   <td width="15%" style="background-color: rgb(199, 197, 193);"><b>이용자</b></td>
            <td width="15%" style="background-color:  rgb(199, 197, 193);"><b>공구명</b></td>
			<td width="30%" style="background-color:  rgb(199, 197, 193);"><b>예약일/대여일</b></td> 
			<td width="25%" style="background-color: rgb(199, 197, 193);"><b>상태 변경하기</b></td>
           </tr>

<!--MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-->
			<c:forEach var="onBookList" items="${requestScope.onBookList}" varStatus="loopTagStatus">
		
							
							
				    
						<tr align="center"  style="cursor:pointer; height:40px;"  >
							<td>예약중
							<td>${onBookList.MEMBEREMAIL} 
							<td>${onBookList.TOOLNAME}     
							<td>${onBookList.BOOKDATE}  
							<td><input onclick="goUpBook(${onBookList.NO});" type="button" style="width:100px; height:30px; " value="[대여] 완료">
						</tr>
				
				
				</c:forEach> 
				<c:forEach var="onRentalList" items="${requestScope.onRentalList}" varStatus="loopTagStatus">
		
							
							
				    
						<tr align="center"  style="cursor:pointer; height:40px;"  >
							<td>대여중
							<td>${onRentalList.MEMBEREMAIL} 
							<td>${onRentalList.TOOLNAME}     
							<td>${onRentalList.RENTALDATE}  
							<td><input onclick="goUpRental(${onRentalList.NO});" type="button" style="width:100px; height:30px; " value="[반납] 완료">
						</tr>
				
				
				</c:forEach>
				
				
				


					
					
					
				<!-- 
				<c:if test="${reportList.partNo == 1}">	    
							<td OnClick="goFreeBoardDetailForm(${reportList.postNo});"  style="cursor:pointer">${reportList.title}
				</c:if>	
							
				<c:if test="${reportList.partNo == 2}">	    
							<td OnClick="goQnABoardDetailForm(${reportList.postNo});" style="cursor:pointer">${reportList.title}
				</c:if>						
				 -->
				
				

			
<!--MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-->
       

        </table>
    </center>
    </form>




	<form name="boardFreeDetail" method="post" action="/boardFreeDetail.do">
		<input type="hidden" name="no" value="">
	</form>



	<form name="boardQnADetail" method="post" action="/boardQnADetail.do">
		<input type="hidden" name="no" value="">
	</form>
	

    
	<form name="adminStatsForm" method="post" action="/adminStatsForm.do"></form>
    
    
    <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
</html>