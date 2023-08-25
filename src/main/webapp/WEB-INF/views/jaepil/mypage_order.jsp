<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<h1>주문내역</h1>
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
		<div class="mypage-info-date">
			<div class="mypage-info-date-item">조회기간</div>
			<div class="mypage-info-date-item">
				<button class="btn-select-date" id="1week">1주일</button>
				<button class="btn-select-date" id="1month">1개월</button>
				<button class="btn-select-date" id="3month">3개월</button>
				<button class="btn-select-date" id="6month">6개월</button>
				<button class="btn-select-date" id="1year">1년</button>
			</div>
				<div class="mypage-info-date-item">
			<form action="mypage.orderdate">
					<input type="text" class="datepick" id="sartdate" name="startdate">
					~ <input type="text" class="datepick" id="enddate" name="enddate">
				</div>
				<div>
					<button class="btn-search-date">조회</button>
				</form>
			</div>
		</div>
		<div class="mypage-info-des">
			※ 운영시간: 월~목 10:00~17:00 (점심시간: 12:30~14:00) / 금 10:00~12:00 / 토, 일,
			공휴일 휴무 <br> <br> ※ 운영시간 외에 문의하신 사항은 홈페이지, 전화, 메일의 대응이 모두
			불가하며, 영업일 기준 다음 운영시간에 순차적으로 처리됩니다.<br> <br> ※ 문의 사항의 내용과
			고객센터 사정에 따라 응답이 다소 지연될 수 있습니다.
		</div>
		<div class="mypage-info-datas">
			<div class="mypage-info-data-nav">
				<div class="mypage-info-data-order-no">주문번호</div>
				<div class="mypage-info-data-order-name">상품명</div>
				<div class="mypage-info-data-order-pay">수량</div>
				<div class="mypage-info-data-order-sale">가격</div>
				<div class="mypage-info-data-order-date">주문날짜</div>
				<div class="mypage-info-data-order-state">주문상태</div>
				<div class="mypage-info-data-order-other">주문환불</div>
			</div>
			<c:if test="${not empty orders}">
				<c:forEach var="o" items="${orders }">
					<div class="mypage-info-data">
						<div class="mypage-info-data-order-no">${o.od_no }</div>
						<div class="mypage-info-data-order-name">${o.p_name }</div>
						<div class="mypage-info-data-order-pay">${o.od_cnt }</div>
						<div class="mypage-info-data-order-sale">${o.od_price }</div>						
						<div class="mypage-info-data-order-date"><fmt:formatDate value="${o.od_date }" dateStyle="long"/></div>
						<div class="mypage-info-data-order-state">${o.od_state }</div>
						<div class="mypage-info-data-order-other">
						<c:choose>
						<c:when test="${o.od_state eq '주문완료' }">						
							<button onclick="refund(${o.od_no})">환불</button>
						</c:when>
						<c:when test="${o.od_state eq '환불요청' }">						
							<button onclick="refundCancel(${o.od_no})">환불취소</button>
						</c:when>
						</c:choose>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>