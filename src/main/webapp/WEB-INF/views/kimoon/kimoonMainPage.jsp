<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="resources/css/kimoon/MainPage.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="resources/js/kimoon/mainPage.js"></script>
</head>
<body>
	<div class="bxslider">
		<div>
			<img src="resources/img/MainPageBanner.png" />
		</div>
		<div>
			<img src="resources/img/MainPageBanner.png" />
		</div>
		<div>
			<img src="resources/img/MainPageBanner.png" />
		</div>
		<div>
			<img src="resources/img/MainPageBanner.png" />
		</div>
	</div>
	<nav class="main-page__tab">
		<div>기타</div>
		<div>앰프</div>
		<div>이펙터</div>
		<div>주변용품</div>
	</nav>
	<div class="main-page-contents__wrapper">
		<div class="main-page-content">
		<div class="main-page-content__thumbnail-wrapper">
			<img class="main-page-content__thumbnail"
				src="resources/img/RedGuitar.jpg" />
				</div>
			<div class="main-page-content__info">
				<div class="main-page-content__desc-wrapper">
					<div class="main-page-content__title">Fender Japan Made in
						Japan Hybrid II Stratocaster</div>
					<div style="display: flex;">
						<div class="main-page-content__type">기타 타입</div>
						<div class="main-page-content__company">회사 이름</div>
					</div>
				</div>
				<div class="main-page-content__price">
					<div>
						<p class="main-page-content__original-price">
							정상가: <span style="opacity: 0.5; text-decoration: line-through;">₩56,000</span>
						</p>
						<p class="main-page-content__sale-price">판매가: <span style="font-weight: bold">₩51,000</span></p>
					</div>
					<div class="main-page-content__sale-percent">10%</div>
				</div>
				<div class="main-page-content__addtocart-bar">
					<img class="addtocart__company-logo" src="resources/img/Fender_Logo_White.png">
					<button class="fa-solid fa-cart-shopping addtocart__company--btn">&nbsp;장바구니</button>
				</div>
			</div>
		</div>
		
		
	</div>
</body>
</html>