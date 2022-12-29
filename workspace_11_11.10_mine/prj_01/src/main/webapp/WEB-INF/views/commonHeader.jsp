<!DOCTYPE html>
  <head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8"> 
	<meta
	name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
	/>
	<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="stylesheet" href="/resources/css/animate.min.css">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
	 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<script src="/js/jquery-1.11.0.min.js"></script>
	<script>
	
	
		function gologout(){
		var checkFlag = confirm("로그아웃 하시겠습니까?");
		if(checkFlag){
			gologin();
		}
	}
	//=====================================================================
	function gologin(){
		document.headerForm.action="/loginPageForm.do";
		document.headerForm.method="post";
		document.headerForm.submit();
		
	}
	//======================================================================
	function goMyPage_header(){
		document.headerForm.action="/myPageInfo.do";
		document.headerForm.method="post";
		document.headerForm.submit();
	}
	//======================================================================
	function goNotice_header(){
		document.headerForm.action="/notice.do";
		document.headerForm.submit();}
	//======================================================================
	function goBooking_header(){
		document.headerForm.action="/toolRentMainForm.do";
		document.headerForm.submit();}
	//======================================================================
	function goBookiList_header(){
		document.headerForm.action="/myPageBookList.do";
		document.headerForm.method="post";
		document.headerForm.submit();
		}
	//======================================================================
	function goList_header(){document.headerForm.action="/boardQuestion.do"; document.headerForm.submit();}
	function goAdmin(){
		document.headerForm.action="/adminStatsForm.do";
		document.headerForm.method="post";
		document.headerForm.submit();
		
	}
	
	
	// 헤더 고정
/*
$(document).ready(function(){
  $(".main_Box").mouseover(function(){
      $(this).children(".main_Box").stop().slideDown(380);
  });
  $(".main_Box").mouseleave(function(){
      $(this).children(".main_Box").stop().slideUp(300);
  });
  // speed: 2500
});
	
$(document).ready(function(){
	  $(".swiper").mouseover(function(){
	      $(this).children(".swiper").stop().slideDown(380);
	  });
	  $(".swiper").mouseleave(function(){
	      $(this).children(".swiper").stop().slideUp(300);
	  });
	  // speed: 2500
	});*/	


	
</script>

<style>


a { text-decoration: none !important; color: black;}
img { border: 0; }
ul { list-style: none; }

body{
    margin: 0;
    font-family: 'PT Sans Narrow';
    font-size: 1rem;
    background-color: rgb(255, 255, 255);
}
*{
	margin: 0; padding: 0;
	font-family: 'PT Sans Narrow';
}
/*
.main_Box{position: fixed; left: 0; top: 0; width: 100%;}

@keyframes dropHeader {
  0% {
    top: -5rem;
  }
  100% {
    top: 0;
  }
}*/

	.headerLogin{
		position: relative;
	}
	.headerLogin .login_Btn{
		position: relative;
		float: right;
		top: 8px;
		right: 20px;
		color: rgb(34, 34, 33);
		font-weight: bolder;
	}
	.main_Box{
		position: relative;
		top: 30px;
		height: 100px;
		width: 100%;
		background-color: rgb(44, 38, 14);
		opacity: 0.9;
		z-index: 2; 
	}
	.main_Title img{
		position: relative;
        width: 200px;
		left: 15px;
		top: 18px;
	}
	.main_Title i{
		position: relative;
		font-size: 40px;
		color: white;
		left: 20px;
	}

	


	.header_Menu span{
    position: relative;
	font-weight: bold;
    padding: 10px 10px 10px 10px;
	bottom: 40px;
    
	/* left: 450px; */
    font-family: 'Ubuntu', sans-serif;
    }
	.header_Menu span:hover{
        border:1px #dedede solid;;
		opacity: 0.8;
	}
	.notice{font-size: 15px;color: white;}
	.community{font-size: 15px;color: white;}
	.record{font-size: 15px;color: white;}
	.book{font-size: 15px;color: white;}


	.headerLogin .login_Btn span:hover{
        color: rgb(153, 150, 150);
	}

	/*헤어 슬라이드 css*/
	.swiper {
    position: relative;
	width: 100%;
	height: 400px;
	bottom: 68px;
	}

	

	.swiper-slide {
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
	}

	.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
	}
	
	
    </style>
  </head>

<body>
<form name="headerForm">
<div class="header">
	<div class="headerLogin">
		<div class="login_Btn">
		<%
			String email = (String)session.getAttribute("email");
			if(email==null){	%>
				<span style="cursor:pointer" onClick="gologin();">로그인 <i class="fas fa-user"></i></span>
			<%}else if(email.equals("system")){%>
				<span style="cursor:pointer" onClick="goAdmin();">관리자페이지</span>&emsp;
				<span style="cursor:pointer" onClick="gologout();">로그아웃 <i class="fas fa-sign-in-alt"></i></span>&emsp;
				<span style="cursor:pointer" onClick="goMyPage_header();">마이페이지</span>
			<%}else if(email!="system"){%>
				<span style="cursor:pointer" onClick="gologout();">로그아웃 <i class="fas fa-sign-in-alt"></i></span>&emsp;
				<span style="cursor:pointer" onClick="goMyPage_header();">마이페이지</span>
			<%}
		%>
		</div>
	</div>
	<div class="main_Box">
		<div class="main_Title" style="font-size:50pt;">
			<img src="/resources/img/titleimg.png"  >
			<i class="fas fa-tools"></i>
		</div>
		<div class="header_Menu">
			<center>
				<span id="notice" class="notice" style="cursor:pointer" onClick="goNotice_header();">공지사항</span>&emsp;&emsp;&emsp;&emsp;
				<span id="book" class="book" style="cursor:pointer" onClick="goBooking_header();">대여 예약하기</span>&emsp;&emsp;&emsp;&emsp;
				<span id="record" class="record" style="cursor:pointer" onClick="goBookiList_header();">예약 조회</span>&emsp;&emsp;&emsp;&emsp;
				<span id="community" class="community" style="cursor:pointer" onClick="goList_header();">게시판</span>
			</center>
		</div>
	</div>
		<!-- Swiper -->
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide slide1">
				<img src="/resources/img/toolImg1.jpeg" alt="헤더슬라이드">
				</div>
				<div class="swiper-slide slide2">
				<img src="/resources/img/toolImg2.jpeg" alt="헤더슬라이드">
				</div>
				<div class="swiper-slide slide3">
				<img src="/resources/img/toolImg3.jpg" alt="헤더슬라이드">
				</div>
			</div>
		</div>
</div>
</form>
</body>	
	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
		loop:true,	//반복 재생 여부
		ousewheel: false,
		keyboard: false,
		slidesPerView: 1,
		autoplay: {
		delay: 3000,
		},
		speed: 3000,
		effect : 'fade'
      });
    </script>
</html>