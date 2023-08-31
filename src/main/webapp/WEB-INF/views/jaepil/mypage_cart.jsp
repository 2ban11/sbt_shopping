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
<script>
	var isLoggedIn =
<%=session.getAttribute("loginMember") != null%>
	;
</script>
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
							<input type="hidden" name="c_product" value="${c.c_product }">
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
						<div class="mypage-info-data-cart-name"
							onclick="location.href='detail.product?p_no=${c.p_no}'">${c.p_name }</div>
						<div class="mypage-info-data-cart-cnt">
							<form action="updatecart" onsubmit="updatecart()">
								<input type="number" name="c_cnt" value="${c.c_cnt }" min="1"
									max="99">
								<button name="c_no" value="${c.c_no }">수정</button>
							</form>
						</div>
						<div class="mypage-info-data-cart-sale">${c.p_sale * c.c_cnt}원</div>
						<input type="hidden" name="p_sale" value="${c.p_sale * c.c_cnt}">
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
		<div id="kakao-div">
		
		</div>
			<input type="hidden" name="total" id="kakaoTotal" value="">
	</form>
</body>
<script type="text/javascript">
	$(function() {

		checkOrder();
		setTotal();

	});

	function setTotal() {
		let totalAmount = 0;
		$("input[name='chk']").click(function() {
			let checked = $(this).is(':checked');
			let totalPrice = $("#total-price").text();
			targetPrice = parseInt($(this).closest('.mypage-info-data')
			.find('.mypage-info-data-cart-sale').text()
			.replace('원'));
			
		
			
			if (checked) {
				totalAmount += targetPrice
			} else {
				totalAmount -= targetPrice
			}
				console.log(totalAmount);
				$("#total-price").text(totalAmount + '원')
		});

		$('#cbx_chkAll').click(function() {
			totalAmount = 0;
			let chk = $(this).is(':checked');
			let totalPrice = $("#total-price").text();
			if (chk) {

				$('.mypage-info-data-cart-sale').each(function(i, e) {
					let saleText = $(this).text();
					let targetPrice = parseInt(saleText.replace('원', ''));
					totalAmount += targetPrice
					console.log(totalAmount);
				})

			} else {
				totalAmount = 0;
			}
			$("#total-price").text(totalAmount + '원')
		});
			 $("input[name='total']").val(totalAmount);
	}

	function checkOrder() {
		$('#kakao-btn').click(function(e) {
			console.log("kakao clicked!")
			let chkCnt = 0;
			
			
           
            
			let cNoInput = $("<input hidden>");
			let cProductInput = $("<input hidden>");
			let pSaleInput = $("<input hidden>");
			let cCntInput = $("<input hidden>");
			$(cNoInput).attr('name', 'c_no');
			$(cProductInput).attr('name', 'c_product');
			$(pSaleInput).attr('name', 'p_sale');
			$(cCntInput).attr('name', 'c_cnt');
			
			
			$("input[name='chk']").each(function(i, e) {
				 let c_product = $(this).closest('.mypage-info-data').find('input[name="c_product"]').val();
		         let p_sale = $(this).closest('.mypage-info-data').find('input[name="p_sale"]').val();
		         let c_cnt = $(this).closest('.mypage-info-data').find('input[name="c_cnt"]').val();
				if (($(this).is(':checked'))) {
					let cNoCloneEl = $(cNoInput).clone();
					let cProductCloneEl = $(cProductInput).clone();
					let pSaleCloneEl = $(pSaleInput).clone();
					let cCntCloneEl = $(cCntInput).clone();
					$("#kakao-div").append(cNoCloneEl);
					$("#kakao-div").append(cProductCloneEl);
					$("#kakao-div").append(pSaleCloneEl);
					$("#kakao-div").append(cCntCloneEl);
					$(cNoCloneEl).attr('value', $(this).val());
					$(cProductCloneEl).attr('value', c_product);
					$(pSaleCloneEl).attr('value', p_sale);
					$(cCntCloneEl).attr('value', c_cnt);
					
					
					
					
				} else {
					chkCnt += 1;
				}
				
			})
			if (chkCnt == $("input[name='chk']").length) {
				alert('상품을 선택하세요');
				return false;
			} else {
				let setTotalValue = parseInt($("#total-price").text().replace('원'));
				$("input[name='total']").val(setTotalValue);
				$("#kakao-form").submit();
			}

		})
	}
</script>
</html>