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
<link rel="stylesheet" href="resources/css/jh/chkColors.css" />
<link rel="stylesheet" href="resources/css/jh/regProduct.css" />
<link rel="stylesheet" href="resources/css/jh/controlOrder.css">
<script type="text/javascript" src="resources/js/jh/isNotElec.js"></script>
<script type="text/javascript" src="resources/js/jaepil/mypage.js"></script>
</head>
<body>
	<div class="mypage-info-datas">
		<div class="mypage-info-data-nav">
			<div class="refund-info-data-order-no">주문번호</div>
			<div class="refund-info-data-order-name">상품명</div>
			<div class="refund-info-data-order-pay">수량</div>
			<div class="refund-info-data-order-sale">가격</div>
			<div class="refund-info-data-order-date">주문날짜</div>
			<div class="refund-info-data-order-state">주문상태</div>
			<div class="refund-info-data-order-other">환불상태</div>
		</div>
		<c:if test="${not empty orders}">
			<c:forEach var="o" items="${orders }">
				<div class="mypage-info-data">
					<div class="refund-info-data-order-no">${o.od_no }</div>
					<div class="refund-info-data-order-name">${o.p_name }</div>
					<div class="refund-info-data-order-pay">${o.od_cnt }</div>
					<div class="refund-info-data-order-sale">${o.od_price }</div>
					<div class="refund-info-data-order-date">
						<fmt:formatDate value="${o.od_date }" dateStyle="long" />
					</div>
					<div class="refund-info-data-order-state">${o.od_state }</div>
					<div class="refund-info-data-order-other">
						<c:if test="${o.od_state eq '환불요청' }">
							<button onclick="refundAccept(${o.od_no})" class="refund-btn">환불완료</button>
							<button onclick="refundCancel2(${o.od_no})" class="refund-cancel-btn">환불취소</button>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>