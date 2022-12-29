<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--====================================================================-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--====================================================================-->
<!--====================================================================-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src = "/js/jquery-1.11.0.min.js"></script>
<script>
    $( function(){
    	
    		$("#community").text("[게시판]");
    		
    	
    	
    	
       //조회수/등록일 문자  처리
           $("#freeSortHeader").text("조회수");
           $("#freeSortHeader2").text("등록일");
           
           var val = $("#freeSortHeader").text();
           var val2 = $("#freeSortHeader2").text();
           var order = $("#sort").val();
   
        //조회수
           if( val=="조회수" && order == "readCount asc"){
               val = $("#freeSortHeader").text("조회수▲");
           }
           else if(val=="조회수" && order == "readCount desc"){
               val = $("#freeSortHeader").text("조회수▼");
   
           }else if(val=="조회수" && order == ""){
               val = $("#freeSortHeader").text("조회수");
           }
           else if( val2=="등록일" && order == "regDate asc"){
               val2 = $("#freeSortHeader2").text("등록일▲");
           }
           else if(val2=="등록일" && order == "regDate desc"){
               val2 = $("#freeSortHeader2").text("등록일▼");
   
           }else if(val2=="등록일" && order == ""){
               val2 = $("#freeSortHeader2").text("등록일");
           }
           
        $(".qnABtn").bind("click",function(){
               document.boardQnAForm.submit();
           });
        $(".questionBtn").bind("click",function(){
               document.boardQuestionForm.submit();
           });
       
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
           }else{
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
           //$(".FreeSearchBtn").click();	
           document.boardFreeForm.submit();
   }
    
   
    function FreeSearch(){
        var keyword1 = $("[name='keyword']").val();
        if(typeof(keyword1)!="string"){
            keyword1 = " ";
        }
        keyword1 = $.trim(keyword1);
        $("[name='keyword']").val(keyword1);
        
        document.boardFreeForm.submit();
    }
   
    function goFreeDetail(no){
        var formObj = $("[name=boardFreeDetailForm]");
        formObj.find("[name=no]").val(no);
        document.boardFreeDetailForm.submit();
    }
   
    function pageNoBtn( pageNo ){
        $(".selectPageNo").val( pageNo );
        FreeSearch( );
    }
   
    function freewrite(){
        document.boardFreeWriteForm.submit();
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
        background-color:  rgb(195, 186, 154);
    }

    .selectBox{
        background-color:  rgb(227, 223, 209);
        width: 80px;
        height: 22px;
    }

    .SearchBtn input{
        background-color:rgb(210, 203, 176);
        width: 80px;
        height: 22px;
        border: none;
        font-weight: bolder;
    }

    .SearchBtn input:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(200, 193, 166);
    }

    .writeBtn{
        width: 200px;
        height: 30px;
        border: none;
        font-weight: bolder;
        background-color:rgb(200, 193, 166); 
    }

    .writeBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(181, 174, 148);
    }

    .tableTitle{
        background-color: rgb(210, 203, 176);
    }
    .tableSub{
        border: 1px solid #444444;
        padding: 20px ;
        background-color: rgb(227, 223, 209);
    }
    .write{
        position: relative;
        left: 250px;
        width: 120px;
        height: 30px;
        background-color: rgb(188, 180, 152);
        border: none;
    }
    .write:hover{
        background-color: rgb(199, 193, 168);
    }

    .look{
        width: 80px;
    }
    .look:hover{
        background-color: rgb(199, 193, 168);
    }
    .updateDay{
        width: 80px;
    }
    .updateDay:hover{
        background-color: rgb(199, 193, 168);
    }
    .nextBtn{
        font-size: 15px;
        background-color: rgb(188, 182, 163);
        border: none;
    }
    .nextBtn:hover{
        background-color: rgb(160, 155, 139);
    }

</style>
</head>

<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="boardFreeForm"  action="/boardFree.do" method="post" style="margin-top: -90px;">
        <center>
            <table class="boardTitle"  border="1" cellpadding="5" cellspacing="0" align="center" height="60px" width="1000px" style="background-color: rgb(202, 188, 145) ;">
                <tr>
                   <th width="334px"><span style="cursor:pointer"  class="questionBtn" onclick="goQuestion();">자주 묻는 질문</span></th>
                    <th width="333px]"><span style="cursor:pointer" class="freeBtn" onclick="goFree();">[자유 게시판]</span></th>
                    <th width="333px"><span style="cursor:pointer" class="qnABtn" onclick="goQnA();">문의 게시판</span></th>
                </tr><br>
            </table>

            <br><br>
            <div style=" height:30px; font-size:80px; font-weight: bold;">자유 게시판</div><br><br><br><br><br>
			<table align="center" style="margin-top:50px;  border-radius:10px; background-color:rgb(199, 193, 168); width:600px; height:35px;">
      
                <tr>
                    <th class="boardSearch">
                        <select class="selectBox" name="keywordtype">
                            <option value="title" ${requestScope.boardSearchDTO.keywordtype == 'title' ? 'selected="selected"' : '' }>제목</option>
                            <option value="content" ${requestScope.boardSearchDTO.keywordtype == 'content' ? 'selected="selected"' : '' }>내용</option>
                            <option value="email" ${requestScope.boardSearchDTO.keywordtype == 'email' ? 'selected="selected"' : '' }>작성자</option>
                        </select>
                         </th>
                       <th>
                        <input class="searchTxt" type="text" name="keyword"  placeholder="검색어를 입력해주세요." value="${requestScope.boardSearchDTO.keyword}" maxlength="30">
            		</th>
                    <input type="hidden" name="sort" id="sort"  class="sort" value="${requestScope.boardSearchDTO.sort}">
                    
                    <input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
          		    <input type="hidden" name="pageNoCnt_perPage" class="pageNoCnt_perPage" value="10">
                    <th>
                        <input type="button" class="SearchBtn"value="검색" onClick="FreeSearch();">
                    </th>
                    <th><input   type="button" value="글쓰기" class="freewriteBtn" onclick="freewrite();">
                    
                    </th>
                   
                </tr>
            </table><br>
		
		<table class="tableSub" border="1px" cellpadding="5" cellspacing="2" style="border-collapse:collapse;width:800px;" align="center">      
                <tr align="center" height="50px" class="tableTitle">
                    <th class="Title" style="width:50%;height:30px;">제목</th>
                    <th class="Writer"style="width:15%;height:30px;"><span style="cursor:pointer">작성자</span></th>
                    <th class="look"style="width:10%;height:30px;"><span style="cursor:pointer"class="look"  id="freeSortHeader" onClick="init('S');"></span></th>
                    <th class="updateDay"style="width:10%;height:30px;"><span style="cursor:pointer"class="updateDay"  id="freeSortHeader2" onClick="init('W');"></span></th>
                </tr>
               
                 <c:forEach var="Freeboard" items="${requestScope.boardList}" varStatus="loopTagStatus">
                  <tr height="40px;" align="center" onClick="goFreeDetail(${Freeboard.no})">
                    <td style="cursor:pointer;height:30px;">${Freeboard.title} </td>
                    <td style="cursor:pointer;text-align: center;height:35px;">${Freeboard.email}</td>
                    <td style="cursor:pointer;text-align: center;height:35px;">${Freeboard.readCount}</td>
                    <td style="cursor:pointer;text-align: center;height:35px;">${Freeboard.regDate}</td>
                </tr>
              </c:forEach>
                
            </table>
            
            <div style="height:15px;"></div>
           
        </center>
    </form>
    <div>
        <center>
    <c:if test="${requestScope.boardTotCnt>0}">
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
    
    
        </center>
    </div>
      <!-- boardQnA 로 이동할 때 필요함 -->
  <form name="boardQnAForm" action="/boardQnA.do" method="post" ></form>
  <form name="boardQuestionForm" action="/boardQuestion.do" method="post" ></form>
   <form name=boardFreeDetailForm action="/boardFreeDetail.do" method="post" >
         <input type="hidden" name="no" class="no" value="">
   </form>
   <form name=boardFreeWriteForm action="/boardFreeWrite.do" method="post" ></form>
    
    <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
<style>

.notice{font-size: 15px;color: white;}
	.community{font-size: 22px;color: white;}
	.record{font-size: 15px;color: white;}
	.book{font-size: 15px;color: white;}

</style>
</html>