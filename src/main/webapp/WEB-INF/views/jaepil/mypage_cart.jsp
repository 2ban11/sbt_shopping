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
			<div class="mypage-info-data-nav">
				<div class="mypage-info-data-cart-select">
					<input type="checkbox" id="cbx_chkAll">
				</div>
				<div class="mypage-info-data-cart-category">분류</div>
				<div class="mypage-info-data-cart-img">이미지</div>
				<div class="mypage-info-data-cart-name">상품명</div>
				<div class="mypage-info-data-cart-cnt">수량</div>
				<div class="mypage-info-data-cart-sale-top">가격</div>
			</div>
			<c:if test="${not empty carts}">
				<c:forEach items="${carts}" var="c">
					<div class="mypage-info-data">
						<div class="mypage-info-data-cart-select">
							<input type="checkbox" name="chk" value="${c.c_no }">
						</div>
						<div class="mypage-info-data-cart-category">${c.p_big_category }</div>
						<div class="mypage-info-data-cart-img">
							<img alt="" src="${c.p_img1 }">
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
				<div id="total-price"></div>
			</div>
		</div>
	</div>
	<form method="post" action="kakaoPay" id="kakao-form">
		<div class="mypage-cart-order">
			<button id="kakao-btn" type="button">주문하기</button>
		</div>
		<c:forEach items="${carts}" var="c">
			<input type="hidden" name="c_no" value="${c.c_no }">
			<input type="hidden" name="p_name" value="${c.p_name }">
			<%-- <input type="hidden" name="p_big_category" value="${carts.p_big_category }">
		<input type="hidden" name="c_cnt" value="${carts.c_cnt }">
		<input type="hidden" name="p_sale" value="${carts.p_sale }"> --%>
		</c:forEach>
		<input type="hidden" name="total" value="${total }">
	</form>
</body>
<script type="text/javascript">
	$(function() {

		checkOrder();
		setTotal();

	});

	function setTotal() {
		let totalAmount = 0;
		$("input[name='chk']").click(
				function() {
					let checked = $(this).is(':checked');
					let totalPrice = $("#total-price").text();
					//console.log(totalPrice);
					targetPrice = parseInt($(this).closest('.mypage-info-data')
							.find('.mypage-info-data-cart-sale').text()
							.replace('원'));
					if (checked) {
						totalAmount += targetPrice
					} else {
						totalAmount -= targetPrice
					}
					console.log(totalAmount);
					$("#total-price").text(totalAmount+'원')
				});
				
		$('#cbx_chkAll').click(function() {
			let chk = $(this).is(':checked');
			let totalPrice = $("#total-price").text();
			targetPrice = parseInt($(this).closest('.mypage-info-data')
					.find('.mypage-info-data-cart-sale').text()
					.replace('원'));
			if(chk){
				
				
			$('.mypage-info-data-cart-sale').each(function(i,e) {
				totalAmount += $(this).text();
			})
				
				
			}else{
				totalAmount += 0;
// 				0원
			}
			$("#total-price").text(totalAmount+'원')
		});

	}

	function checkOrder() {
		$('#kakao-btn').click(function() {
			let allFalse;
			$("input[name='chk']").each(function(i, e) {

				if (!($(this).is(':checked'))) {
					allFalse = true;
				} else {
					allFalse = false;
					return false;
				}
			})
			if (allFalse) {
				alert('상품을 선택하세요')
			} else {

			}

		})
	}
</script>
</html>