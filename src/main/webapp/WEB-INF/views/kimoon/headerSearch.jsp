<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jh/listPage.css" />
</head>
<body>

	<div id="data-container">
		<c:forEach var="product" items="${searchProducts }">

			<div class="listPage_item1">
				<div class="ul-div product-img">
					<img
						src="resources/img/Guitar/Original Collection Les Paul Standard 60s Faded.jpg"
						class="productImg">
				</div>
				<div class="ul-div product-logo">
					<img src="resources/img/MakerLogo/Gibson_Logo_White.png"
						class="LogoImg">
				</div>
				<div class="ul-div productColor">${product.p_color }</div>
				<div class="ul-div productSmallCategory">${product.p_small_category }</div>
				<div class="ul-div productTitle">${product.p_name }</div>
				<div class="aaa">
					<div class="productPrice"
						style="text-decoration: line-through; color: gray;">${product.p_price }</div>
					<div class="productSale" style="font-size: 20px;">${product.p_sale }</div>
				</div>
				<div class="productDifference">
					<fmt:formatNumber
						value="${((product.p_price - product.p_sale) / product.p_price) * 100}"
						type="number" pattern="#0'%'" />
				</div>
				<button class="fa-solid fa-cart-shopping intoTheCart--btn"></button>
			</div>

		</c:forEach>
	</div>
</body>
</html>