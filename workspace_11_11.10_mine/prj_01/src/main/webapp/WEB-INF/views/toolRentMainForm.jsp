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
<title>대여 예약하기</title>
<script>
$(function(){ 
	$("#book").text("[대여 예약하기]");
	
	
});
	function searchAll(){
		$("[name=jijumname]").val("");
		$("[name=keywordtype]").val("");
		$("[name=smallsortno]").val("");
		$("[name=keyword]").val("");
		document.toolRentMainForm.submit();
	}


	function toolSearch(){	
	    var keyword1 = $("[name='keyword']").val();
	    
	    if(typeof(keyword1)!="string"){
	        keyword1 = "";
	    }

	    $("[name='keyword']").val(keyword1);

	    
	    document.toolRentMainForm.submit();
	}
	
	function goToolDetail(no,jijumno){
		var formObj = $("[name=toolRentDetailForm]");
		$("[name=no]").val(no);
		$("[name=jijumno]").val(jijumno);
	    document.toolRentDetailForm.submit();
	}
  	
	function pageNoBtn( pageNo ){
	    $(".selectPageNo").val( pageNo );
	    toolSearch( );
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

    .boardSearch{
        background-color: rgb(249, 245, 224);
        border: 2px;
        height: 20px;
    }

    .selectBox{

        background-color:  rgb(233, 222, 200);
        width: 120px;
        height: 22px;
    }

    .SearchBtn{
        background-color:rgb(210, 203, 176);
        width: 80px;
        height: 22px;
        border: none;
        font-weight: bolder;
    }

    .SearchBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(200, 193, 166);
    }

    .reserBtn{
        width: 100px;
        height: 30px;
        border: none;
        font-weight: bolder;
        background-color:rgb(200, 193, 166); 
    }

    .reserBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(181, 174, 148);
    }

    .section{
        width: 600px;
        margin: 0 auto;
        background-color: rgb(208, 202, 190);
    }

.box-list-item {  margin-top: 20px;  position: relative;  border: 1px solid #d9d9d9;}

.box-list-item:first-child {margin-top: 0;}
.box-thumbnail-item { _width: calc(33.33% - 16px); margin: 0 20px 20px 0; border: 1px solid #000000; float: left; position: relative; height: 380px; width: 293px;}
.box-thumbnail-blog { width: calc(33.33% - 22px); margin: 0 0 20px 20px; border: 1px solid #000000; float: left; position: relative; height: 380px;  _width:293px;}
.box-thumbnail-item:nth-child(3n) {margin-right: 0;}
.box-thumbnail-link {display: block; width: 100%; height: 100%;}
.box-thumbnail-link:hover .boxmodel2-thumbnail-cover {display: block; z-index: 3;}
.box-thumbnail-box .imgbox { width: 100%; vertical-align: top; border-bottom: 1px solid #dfdfdf;}

   
</style>



</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="toolRentMainForm" action="/toolRentMainForm.do" method="post">
	<center>
	<table align="center" style="border-radius:10px; background-color:rgb(199, 193, 168); width:900px; height:35px; " >
	 <tr>
       <th class="toolSearchtype">
           <select class="selectBox" name="keywordtype">
               <option value="" >전체</option>
               <option value="0" ${toolDTO.keywordtype == '0' ? 'selected="selected"' : '' }>예약 가능만</option>
               <option value="1" ${toolDTO.keywordtype == '1' ? 'selected="selected"' : '' }>예약 불가능만</option>
           </select>
       <th>
       		<select class="selectBox" name="jijumname">
       		 <option value="" selected>지점 선택</option>
       		 <c:forEach var="jijumList" items="${requestScope.jijumList}" varStatus="loopTagStatus">
       		   <option value="${jijumList.jijumno}" ${toolDTO.jijumname == jijumList.jijumno ? 'selected="selected"' : '' }>${jijumList.jijumname}</option>
       		 </c:forEach>
       		</select>
       </th>    
       <th class="">
           <select class="selectBox" name="smallsortno">
               <option value="" selected>공구 분류</option>
              <c:forEach var="smallList" items="${requestScope.smallList}" varStatus="loopTagStatus">
              	 <option value="${smallList.sno}" ${toolDTO.smallsortno == smallList.sno ? 'selected="selected"' : '' }>${smallList.sname} </option>              
               </c:forEach>
           </select>  
       </th>
          <th>
           <input class="searchTxt" type="text" name="keyword"  placeholder="검색어를 입력해주세요." value="${toolDTO.keyword}" maxlength="30">
		  </th>
       <input type="hidden" name="sort" id="sort"  class="sort" value="${toolDTO.sort}">
       
       <input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
   	   <input type="hidden" name="pageNoCnt_perPage" class="pageNoCnt_perPage" value="10">
       <th>
           <input type="button" class="SearchBtn" value="검색" onClick="toolSearch();">
       </th>
       <th>
           <input type="button" class="SearchBtn" value="모두 검색" onClick="searchAll();">
       </th>
   </tr>
	
	</table>
	
	<div align="center" style="padding-left: 80px;padding-top: 40px;height:1000px;width:1000px">
		<ul>
		<c:forEach var="toolList" items="${requestScope.toolList}" varStatus="loopTagStatus">
			<li class="box-thumbnail-item"  onClick="goToolDetail(${toolList.no},${toolList.jijumno});" style="cursor:pointer">
			<img src="resources/img/${toolList.no}.jpg" width="290" height="220">
			<div style="height:30px; background-color:rgb(199, 193, 168); padding-bottom: 1px;"><span style= font-size:22px;"><b>${toolList.name}</b></span> </div>
			<table style="border-top : 1px solid #000000; width: 290px;">
				<tr>
					<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;text-align: center;"><b>브랜드</b></td>
					<td style="border-bottom:1px solid #000000;">${toolList.brand}</td>
				</tr>
				<tr>
					<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;text-align: center;"><b>지점명</b></td>
					<td style="border-bottom:1px solid #000000;">${toolList.jijumname}</td>
				</tr>
				<tr>
					<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;text-align: center;"><b>현재 상태</b></td>
					<td style="border-bottom:1px solid #000000;">${toolList.nowstatus==0? '예약가능':'예약불가능' }</td>
				</tr>
			</table>

			</li>
			</c:forEach>
		</ul>
	</div>
	
 		
	</center>
</form>		
<br><br><br><br><br><br><br><br><br><br>
<div style="height:15px;"></div>
<div style="text-align: center;">

    <c:if test="${requestScope.toolTotCnt>0}">
        <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(1);">처음</span>
      <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(${requestScope.pagingMap.selectPageNo}-1);">이전</span>
    <c:forEach  var="no"  begin="${requestScope.pagingMap.begin_pageNo_perPage}"  
                              end="${requestScope.pagingMap.end_pageNo_perPage}" step="1">      
             <c:if test="${requestScope.pagingMap.selectPageNo!=no}">                 
                <span style="cursor:pointer" onclick="pageNoBtn(${no});">[${no}]</span>&nbsp;
             </c:if>
             <c:if test="${requestScope.pagingMap.selectPageNo==no}">${no}&nbsp;</c:if>
       </c:forEach>
       <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(${requestScope.pagingMap.selectPageNo}+1);">다음</span>
       <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(${requestScope.pagingMap.last_pageNo});">마지막</span>
    </c:if>

	</div>  
	
	<form name=toolRentDetailForm action="/toolRentDetail.do" method="post" >
         <input type="hidden" name="no" class="no" value="">
         <input type="hidden" name="jijumno" class="jijumno" value="">     
         <input type="hidden" name="jijumname" class="jijumname" value="">
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