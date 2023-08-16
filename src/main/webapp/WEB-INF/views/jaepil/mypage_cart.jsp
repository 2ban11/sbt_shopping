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
		<h1>마이페이지</h1>
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
				<a href="mypage.cart">장바구니</a>
			</div>
			<div>
				<a href="mypage.editaccount">정보수정</a>
			</div>
			<div>
				<a href="mypage.signout">회원탈퇴</a>
			</div>
		</div>
		<div class="mypage-info-datas">
			<div class="mypage-info-data">
				<div class="mypage-info-data-cart-select">
					<input type="checkbox" id="cbx_chkAll">
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
							<input type="checkbox" name="chk">
						</div>
						<div class="mypage-info-data-cart-category">${c.p_big_category }</div>
						<div class="mypage-info-data-cart-img">
							<img alt="" src="${c.p_img1 }">
						</div>
						<div class="mypage-info-data-cart-name">${c.p_name }</div>
						<div class="mypage-info-data-cart-cnt">
							<input type="text" value="${c.c_cnt }" name="c_cnt">
							<button>수정</button>
						</div>
						<div class="mypage-info-data-cart-sale">${c.p_sale }원<button class="delete-btn" onclick="deleteCart(${c.c_no })">삭제</button>
						</div>
					</div>
					<c:set var="total" value="${total + c.p_sale }" />
				</c:forEach>
				<div class="mypage-cart-total">
				<div>합계</div>
				<div>${total}원</div>
			</div>
			</c:if>
			<div class="mypage-btn-delete">
				<button class="selectDelete-btn">선택삭제</button>
			</div>
			<div class="mypage-cart-order">
				<button>주문하기</button>
			</div>
		</div>
	</div>
	</div>
</body>
</html>