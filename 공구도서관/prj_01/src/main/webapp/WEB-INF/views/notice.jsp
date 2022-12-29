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
<title>공지사항</title>

<script>
    $( function(){
    	
    		$("#notice").text("[공지사항]");
    		
    	
    	
    	
    	//조회수/등록일 문자  처리
    	$("#noticeSortHeader").text("조회수");
    	$("#noticeSortHeader2").text("등록일");
    	
    	var val = $("#noticeSortHeader").text();
    	var val2 = $("#noticeSortHeader2").text();
    	var order = $("#sort").val();

     //조회수
    	if( val=="조회수" && order == "readCount asc"){
    		val = $("#noticeSortHeader").text("조회수▲");
    	}
    	else if(val=="조회수" && order == "readCount desc"){
    		val = $("#noticeSortHeader").text("조회수▼");

    	}else if(val=="조회수" && order == ""){
    		val = $("#noticeSortHeader").text("조회수");
    	}
    	else if( val2=="등록일" && order == "regDate asc"){
    		val2 = $("#noticeSortHeader2").text("등록일▲");
    	}
    	else if(val2=="등록일" && order == "regDate desc"){
    		val2 = $("#noticeSortHeader2").text("등록일▼");

    	}else if(val2=="등록일" && order == ""){
    		val2 = $("#noticeSortHeader2").text("등록일");
    	}
  
     
    })

    function init(text){
    // text = S 조회수
    // text = W 등록일
    		var order = $("#sort").val();
    		if(text=="S"){
    		if(text=="S"&& order == ""){
    			$("#sort").val("readCount asc");
    		}
    		else if(text=="S" && order == "readCount asc"){
    			$("#sort").val("readCount desc");
    		}
    		else if(text=="S" && order == "readCount desc"){
    			$("#sort").val("");
			}else{
				
				$("#sort").val("");
			}
    	}else {
    		if(text=="W"&& order == ""){
    			$("#sort").val("regDate asc");
    		}
    		else if(text=="W" && order == "regDate asc"){
    			$("#sort").val("regDate desc");
    		}
    		else if(text=="W" && order == "regDate desc"){
    			$("#sort").val("");
    		}else{
				$("#sort").val("");
			}
		}	
    		//$(".NoticeSearchBtn").click();	
    		document.noticeForm.submit();
    }
    
  function NoticeSearch(){
   			var keyword1 = $("[name='keyword']").val();
   			if(typeof(keyword1)!="string"){
   				keyword1 = " ";
   			}
   			keyword1 = $.trim(keyword1);
   			$("[name='keyword']").val(keyword1);
   			
   			document.noticeForm.submit();
   		}
   		function goNoticeDetail(no){
   			
   			var formObj = $("[name=noticeDetailForm]");
   			formObj.find("[name=no]").val(no);
   			
   			document.noticeDetailForm.submit();

   		}

   		function pageNoBtn( pageNo ){
   			$(".selectPageNo").val( pageNo );
   			NoticeSearch( );
   		}

   		function noticewrite(){
   			document.noticeWriteForm.submit();
   		}
   		
   		</script>

<style>

    *{
    font-family: 'PT Sans Narrow';
    }
    img { border: 0; }
    ul { list-style: none; }


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
 
    .SearchBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(200, 193, 166);
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
    .tableTitle th{
        background-color: rgb(210, 203, 176);
    }
    .title span{
        background-color:  rgb(245, 236, 207);
    }
    .title span:hover{
        background-color:  rgb(225, 216, 188);
    }


    .nextBtn:hover{
      color: rgb(199, 187, 172) ;
    }

    .writeBtn{
  		 position:relative;
  		 top:20px;
        width: 110px;
        height: 25px;
        border: none;
        font-weight: bolder;
        background-color:rgb(225, 215, 185) ;
    }

    .writeBtn:hover{
        background-color:rgb(214, 202, 166) ;
    }
    
    td{
    height:60px;
    width:150px;
    }
</style>
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>

    <form name="noticeForm" action="/notice.do" method="post" style="margin-top: -30px;">
        <section class="noticePage"><br><br>
            <!--===============================================================-->
            <center>
                   <center><div style="font-size:20pt; font-weight: bold;">공지사항</div></center><br>
            <div style="padding-bottom: 10px;">
              <tr class="noticeSearch">        
                        <select name="keywordtype" class="selectBox">
                            <option value="title" ${requestScope.boardSearchDTO.keywordtype == 'title' ? 'selected="selected"' : '' }>제목</option>
                            <option value="content" ${requestScope.boardSearchDTO.keywordtype == 'content' ? 'selected="selected"' : '' }>내용</option>
                            <option value="email" ${requestScope.boardSearchDTO.keywordtype == 'email' ? 'selected="selected"' : '' }>작성자</option>
                        </select>
                    </th>
                    
                    <th class="">
                        <input class="searchTxt" type="text" name="keyword" placeholder="검색어를 입력해주세요." value="${requestScope.boardSearchDTO.keyword}" maxlength="30">
                    </th>
                    <input type="hidden" name="sort" id="sort"  class="sort" value="${requestScope.boardSearchDTO.sort}">
                    

                    <input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
                    <input type="hidden" name="pageNoCnt_perPage" class="pageNoCnt_perPage" value="10">
                    <th class="">
                        <input type="button" class="SearchBtn" value="검색" onclick="NoticeSearch();">
                        
                        
                    </th>  
                
                        <c:if test="${email == 'system'}"> 
					    <div style='margin-left: 850px;'>
					      <input class="writeBtn" type="button"  value="글쓰기" onclick="noticewrite();">
					    </div>
				      </c:if>
				 
                </tr>
                
                  <br>
      
                
             </div>   
                
            <table class="" border="1px" cellpadding="5" cellspacing="0" style="border-collapse:collapse;width:90%; border-radius: 12px;" align="center" >
             
       
                <tr class="tableTitle" align="center">
                    <th style="width:55%;height:30px;">제목</th>
                    <th style="width:15%;height:30px;">작성자</th>
                    <th style="width:5%;height:30px;"><span style="cursor:pointer" class="noticeSortHeader"  id="noticeSortHeader" onClick="init('S');"></span></th>
                    <th style="width:10%;height:30px;"><span style="cursor:pointer" class="noticeSortHeader"  id="noticeSortHeader2" onClick="init('W');">등록일</span></th>
                </tr>
                <c:forEach var="Noticeboard" items="${requestScope.boardList}" varStatus="loopTagStatus">
                    <tr align="center" class="noticeList" onClick="goNoticeDetail(${Noticeboard.no})" style="height:30px;" >
                      <td style="cursor:pointer;height:30px;" >${Noticeboard.title} </td>
                      <td style="cursor:pointer;text-align: center;height:35px;" >${Noticeboard.email}</td>
                      <td style="cursor:pointer;text-align: center;height:35px;" >${Noticeboard.readCount}</td>
                      <td style="cursor:pointer;text-align: center;height:35px;">${Noticeboard.regDate}</td>
                  </tr>
                </c:forEach>
              
          </table></center>
              <div style="height:15px;"></div>
      </form>
      
      <div class="pageBtn">
        <center>
        <c:if  test="${requestScope.boardTotCnt>0}">
            <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(1);">처음</span>
          <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(${requestScope.pagingMap.selectPageNo}-1);">이전</span>
        <c:forEach  var="no"  begin="${requestScope.pagingMap.begin_pageNo_perPage}"  
                                  end="${requestScope.pagingMap.end_pageNo_perPage}" step="1">      
                 <c:if test="${requestScope.pagingMap.selectPageNo!=no}">                 
                    <span style="cursor:pointer" onclick="pageNoBtn(${no});">[${no}]</span>&nbsp;
                 </c:if>
                 <c:if test="${requestScope.pagingMap.selectPageNo==no}">                 
                    ${no}&nbsp; 
                 </c:if>
           </c:forEach>
           <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(${requestScope.pagingMap.selectPageNo}+1);">다음</span>
           <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(${requestScope.pagingMap.last_pageNo});">마지막</span>
        </c:if>
    </center>

      </div>    
        </center>
         <form name="noticeDetailForm" action="/noticeDetail.do" method="post" >
              <input type="hidden" name="no" class="no" value="">
      </form>
       <form name=noticeWriteForm action="/noticeWrite.do" method="post" ></form>
       
      <%@include file="/WEB-INF/views/commonFooter.jsp" %>
  </body>
  <style>

.notice{font-size: 22px;color: white;}
	.community{font-size: 15px;color: white;}
	.record{font-size: 15px;color: white;}
	.book{font-size: 15px;color: white;}

</style>
  </html>