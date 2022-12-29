<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tool Library</title>
<script src="/js/jquery-1.11.0.min.js"></script>
<script>
	
	$(function(){
		$(".loginBnt").bind("click",function(){
			goLoginPageForm();
		});
			
	});
	
///////////////////////////////////////////////////////////////////////////////////

	// 로그인을 눌렀을 때
	function goLoginPageForm(){
		
		document.loginPageForm.submit();
		
	}
	
///////////////////////////////////////////////////////////////////////////////////

	// 대여하기 버튼을 눌렀을 때
	function goToolRentMainForm(){
		
		document.toolRentMainForm.submit();
		
	}
	
///////////////////////////////////////////////////////////////////////////////////

	// 예약조회 버튼을 눌렀을 때
	function goBookCheckForm(){
		document.bookCheckForm.action="/myPageBookList.do"
		document.bookCheckForm.submit();
		
	}

///////////////////////////////////////////////////////////////////////////////////
</script>

<style>
*{
	font-family: 'PT Sans Narrow';
}
img { border: 0; }
ul { list-style: none; }

body{
    margin: 0;
    background-color: rgb(255, 255, 255);
}
/*헤더로그인*/
	.headerLogin{
		position: relative;
	}
	.headerLogin .loginBtn{
		position: relative;
		float: right;
		right: 20px;
	}
	.headerLogin{
		position: relative;
	}
	.headerLogin .loginBtn{
		position: relative;
		float: right;
		top: 8px;
		right: 20px;
		color: rgb(34, 34, 33);
		font-weight: bolder;
	}
	.headerLogin .loginBtn span:hover{
        color: rgb(153, 150, 150);
	}
	


/*검정색 커버배경*/
	.backImg{
	position: absolute;
	top: 33px;
	z-index: 2;
	opacity: 0.5;
	}

	.backImg img{
	 width: 1536px;
	 height: 650px;
	}

	/*푸터*/
	.footerTxt{
		position: absolute;
		z-index: 3;
		top: 200px;
	}

	.footerTxt p{
		color: aliceblue;
		font-weight: bold;
	}
	.footerTxt .titleP{
		font-size: 30px;
	}
	.footerTxt .subp{
		font-size: 20px;
	}

/*공구도서관 타이핑*/

.titleP{
	position: relative;
	left: 30px;
	font-size: 30px;
	color: rgb(255, 255, 255);
    text-shadow: 0 0 3px rgb(238, 207, 30), 0 0 3px rgb(238, 207, 30)
}

.wrapper {
  /*This part is important for centering*/
  position: absolute;
  left: 20px;
  display: grid;
  place-items: center;
}


.typingDemo {
  width: 68ch;
  animation: typing 2s steps(22), blink .5s step-end infinite alternate;
  white-space: nowrap;
  overflow: hidden;
  border-right: 3px solid;
  font-size: 22px;
  font-weight: bold;
  color: rgb(255, 255, 255);
  text-shadow: 0 0 5px rgb(238, 207, 30), 0 0 5px rgb(238, 207, 30)
}

@keyframes typing {
  from {
    width: 0
  }
}
    
@keyframes blink {
  50% {
    border-color: transparent
  }
}
/*버튼 css*/

.buttonTable{
	position: absolute;
	left: 950px;
	position: fixed;
	opacity: 0.8;
	top: 320px;
}


.button{
	font-size: 20px;
	position:relative;
	left:1050px;
	border-bottom-right-radius: 5px;    
	margin-left:-3px;
	border: none;
    display: inline-block;
    padding: 25px 40px ;
    border-radius: 15px;
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.button2{
	font-size: 20px;
	position:relative;
	left:1100px;
	border-bottom-right-radius: 5px;    
	margin-left:-3px;
	border: none;
    display: inline-block;
    padding: 25px 40px ;
    border-radius: 15px;
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.button:hover{
	color:white;
	background-color: rgb(231, 215, 148);
}
.button2:hover{
	color:white;
	background-color: rgb(149, 139, 80);
}
 



	
	/*헤어 슬라이드 css*/

	.swiper {
    position: relative;
	width: 100%;
	height: 650px;
	top: 10px;
	z-index: 1;
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

<form name="mainForm" action="/mainForm.do" method="post">
	<div class="headerLogin">
		<div class="loginBtn">
			<span style="cursor:pointer" class="loginBnt" onClick="gologin();">로그인 <i class="fas fa-user"></i></span>
		</div>
	</div> 
	<table class="footerTxt">
		<tr>
			<td>
				<p class="titleP">공구 도서관</p><br>
				<div class="wrapper">
					<div class="typingDemo">
						" 공유 촉진을 위해 공구대여소, 장난감 도서관 등의 분야별 공유 자원 현황,<br>
						공유 뉴스, 정책 및 홍보 자료 등을 제공하는 서울특별시 운영 인터넷 사이트입니다. "
					</div>
				</div>
				<input class="button" type='button' value='대여하기' onclick='goToolRentMainForm()'/>&emsp;&emsp;
			    <input class="button2" type='button' value='예약조회' onclick='goBookCheckForm()'/>
			</td>
			<td class="buttonTable">
			</td>
		</tr>
	</table> 
	<!-- <table>
		<input class="button" type='button' value='대여하기' onclick='goToolRentMainForm()'/>
		<input class="button" type='button' value='예약조회' onclick='goBookCheckForm()'/>
	</table> -->
	
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
	<div class="backImg">
		<img src="/resources/img/blackBack.jpg" alt="커버사진">
	</div>
</form>

	<form name="loginPageForm" action="/loginPageForm.do" method="post">
	</form>

	<form name="toolRentMainForm" action="/toolRentMainForm.do" method="post">
	</form>

	<form name="bookCheckForm" action="/bookCheckForm.do" method="post">
	</form>

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
    

	
</body>
</html>