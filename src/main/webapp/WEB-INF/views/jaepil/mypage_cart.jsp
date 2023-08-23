<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jaepil/mypage.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="resources/js/jaepil/mypage.js"></script>
</head>
<body>
	<div class="mypage-main">
		<h1>장바구니</h1>
	</div>
	<div class="mypage">
		<div class="mypage-nav">
			<div>
				<a href="mypage.order">주문내역</a>
			</div>
			<div>
				<a href="mypage.qna">문의내역</a>
			</div>
			<div>
				<a href="mypage.cart?c_id=mk">장바구니</a>
			</div>
			<div>
				<a href="mypage.editaccount">정보수정</a>
			</div>
			<div>
				<a href="mypage.signout">회원탈퇴</a>
			</div>
		</div>
		<div class="mypage-info-datas">
			<div class="mypage-info-data-nav">
				<div class="mypage-info-data-cart-select">
					<input type="checkbox" id="cbx_chkAll">
					<input type="hidden" name="a_id" value="mk">
				</div>
				<div class="mypage-info-data-cart-category">분류</div>
				<div class="mypage-info-data-cart-img">이미지</div>
				<div class="mypage-info-data-cart-name">상품명</div>
				<div class="mypage-info-data-cart-cnt">수량</div>
				<div class="mypage-info-data-cart-sale">가격</div>
			</div>
			<c:if test="${not empty carts}">
				<c:forEach items="${carts}" var="c">
					<div class="mypage-info-data">
						<div class="mypage-info-data-cart-select">
							<input type="checkbox" name="chk" value="${c.c_no }">
						</div>
						<div class="mypage-info-data-cart-category">${c.p_big_category }</div>
						<div class="mypage-info-data-cart-img">
							<c:choose>
								<c:when test="${ '기타' eq c.p_big_category}">
									<img alt="" src="resources/img/Guitar/${c.p_img1 }">
								</c:when>
								<c:when test="${ '앰프' eq c.p_big_category}">
									<img alt="" src="resources/img/Amp/${c.p_img1 }">
								</c:when>
								<c:when test="${ '이펙터' eq c.p_big_category}">
									<img alt="" src="resources/img/Effector/${c.p_img1 }">
								</c:when>
								<c:when test="${ '주변용품' eq c.p_big_category}">
									<img alt="" src="resources/img/Accessory/${c.p_img1 }">
								</c:when>
							</c:choose>
						</div>
						<div class="mypage-info-data-cart-name">${c.p_name }</div>
						<div class="mypage-info-data-cart-cnt">
							<form action="updatecart" onsubmit="updatecart()">
								<input type="number" name="c_cnt" value="${c.c_cnt }" min="1"
									max="99">
								<button name="c_no" value="${c.c_no }">수정</button>
							</form>
						</div>
						<div class="mypage-info-data-cart-sale">${c.p_sale}원</div>
					</div>
					<c:set var="total" value="${total + c.p_sale }" />
				</c:forEach>
			</c:if>
			<div class="mypage-btn-delete">
				<button class="selectDelete-btn">선택삭제</button>
			</div>
			<div class="mypage-cart-total">
				<div>합계</div>
				<div>${total}원</div>
				<input type="hidden" name="total" value="${total}">
			</div>
		</div>
	</div>
	<div class="mypage-cart-order">
		<button>주문하기</button>
	</div>
</body>
</html>