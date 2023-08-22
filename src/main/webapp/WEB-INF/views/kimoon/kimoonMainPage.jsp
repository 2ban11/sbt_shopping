<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>MainPage</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="resources/css/kimoon/main-page.css" />
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
	<div class="main-page__tab-wrapper">
		<ul class="main-page__tab">
			<li><a href="#main-tab-guitar">기타</a></li>
			<li><a href="#main-tab-amp">앰프</a></li>
			<li><a href="#main-tab-effector">이펙터</a></li>
			<li><a href="#main-tab-accessory">주변용품</a></li>
		</ul>
	</div>
	<div class="main-page-contents__wrapper">
		<c:forEach var="mainProducts" items="${mainProducts }">
			<c:choose>
				<c:when test="${mainProducts.p_big_category eq '기타'}">
					<div class="main-page-content" id="main-tab-guitar">
				</c:when>
				<c:when test="${mainProducts.p_big_category eq '앰프'}">
					<div class="main-page-content" id="main-tab-amp">
				</c:when>
				<c:when test="${mainProducts.p_big_category eq '이펙터'}">
					<div class="main-page-content" id="main-tab-effector">
				</c:when>
				<c:when test="${mainProducts.p_big_category eq '주변용품'}">
					<div class="main-page-content" id="main-tab-accessory">
				</c:when>
			</c:choose>
			<div
				class="main-page-content__thumbnail-wrapper ${mainProducts.p_cnt eq 0 ? 'out-of-stock' : ''}">
				<c:if test="${mainProducts.p_cnt eq 0}">
					<h1>-일시품절-</h1>
				</c:if>
				<c:choose>
					<c:when test="${mainProducts.p_big_category eq '기타'}">
						<img class="main-page-content__thumbnail"
							src="resources/img/Guitar/${mainProducts.p_img1 }" />
					</c:when>

					<c:when test="${mainProducts.p_big_category eq '앰프'}">
						<img class="main-page-content__thumbnail"
							src="resources/img/Amp/${mainProducts.p_img1 }" />
					</c:when>
					<c:when test="${mainProducts.p_big_category eq '이펙터'}">
						<img class="main-page-content__thumbnail"
							src="resources/img/Effector/${mainProducts.p_img1 }" />
					</c:when>
					<c:when test="${mainProducts.p_big_category eq '주변용품'}">
						<img class="main-page-content__thumbnail"
							src="resources/img/Accessory/${mainProducts.p_img1 }" />
					</c:when>
				</c:choose>
			</div>
			<div class="main-page-content__info">
				<div class="main-page-content__desc-wrapper">
					<div class="main-page-content__title">${mainProducts.p_name}
					</div>
					<div style="display: flex">

						<c:if test="${not empty mainProducts.p_small_category}">
							<div class="main-page-content__type">${mainProducts.p_small_category}</div>
						</c:if>
						<c:if test="${not empty mainProducts.p_maker}">
							<div class="main-page-content__company">${mainProducts.p_maker}</div>
						</c:if>
					</div>
				</div>
				<div class="main-page-content__price">
					<div>
						<c:if test="${mainProducts.p_price ne mainProducts.p_sale }">
							<p class="main-page-content__original-price">
								정상가: <span style="opacity: 0.5; text-decoration: line-through">

									<fmt:formatNumber value="${mainProducts.p_price }"
										type="currency" />
								</span>
							</p>
						</c:if>
						<c:if test="${mainProducts.p_price eq mainProducts.p_sale }">
							<p class="main-page-content__original-price">&nbsp;</p>
						</c:if>
						<p class="main-page-content__sale-price">
							판매가: <span style="font-weight: bold"> <fmt:formatNumber
									value="${mainProducts.p_sale }" type="currency" />
							</span>
						</p>
					</div>
					<c:if test="${mainProducts.p_price ne mainProducts.p_sale }">
						<div class="main-page-content__sale-percent">
							<fmt:formatNumber
								value="${((mainProducts.p_price - mainProducts.p_sale) / mainProducts.p_price) * 100}"
								type="number" pattern="#0'%'" />
						</div>
					</c:if>
				</div>
				<div class="main-page-content__addtocart-bar">
					<c:if test="${not empty mainProducts.p_maker }">
						<img class="addtocart__company-logo"
							src="resources/img/MakerLogo/${mainProducts.p_maker }_Logo_White.png" />
					</c:if>
					<form action="do.insert.cart" id="main-add-to-cart-form">
						<button class="fa-solid fa-cart-shopping addtocart__company--btn"
							name="c_product" value="${mainProducts.p_no }">&nbsp;장바구니</button>
						<input type="hidden" name="c_id" value="jp@gmail.com">
					</form>
				</div>
			</div>
	</div>
	</c:forEach>
	</div>





	<!-- 모달창 -->
	<div id="mainModal" class="main-cart__modal">
		<div class="main-cart__modal-wrapper">
			<div class="main-cart__modal-header">
				<div style="font-weight: bold">장바구니</div>
				<div>
					<button class="main-cart__modal--close">&times;</button>
				</div>
			</div>
			<div
				style="padding: 2.5em 1em; border-bottom: 1px solid rgba(255, 255, 255, 0.2);">장바구니에
				추가되었습니다.</div>
			<div class="main-how-to-cart">
				<div>
					<button id="main-continue-shopping">계속 쇼핑하기</button>
				</div>
				<div>
					<button id="main-go-to-cart">장바구니로 이동하기</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>