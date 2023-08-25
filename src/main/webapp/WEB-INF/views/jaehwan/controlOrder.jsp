<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jh/listPage.css" />
<link rel="stylesheet" href="resources/css/jh/chkColors.css" />
<link rel="stylesheet" href="resources/css/jh/regProduct.css" />
<link rel="stylesheet" href="resources/css/jaepil/mypage.css">
<script type="text/javascript" src="resources/js/jh/isNotElec.js"></script>
</head>
<body>
<div class="mypage-info-datas">
			<div class="mypage-info-data-nav">
				<div class="mypage-info-data-order-no">주문번호</div>
				<div class="mypage-info-data-order-name">상품명</div>
				<div class="mypage-info-data-order-pay">수량</div>
				<div class="mypage-info-data-order-sale">가격</div>
				<div class="mypage-info-data-order-state">결제상태</div>
				<div class="mypage-info-data-order-other">비고</div>
			</div>
				<c:forEach var="o" items="${orders }">
					<div class="mypage-info-data">
						<div class="mypage-info-data-order-no">${o.od_no }</div>
						<div class="mypage-info-data-order-name">${o.p_name }</div>
						<div class="mypage-info-data-order-pay">${o.od_cnt }</div>
						<div class="mypage-info-data-order-sale">${o.p_sale }</div>						
						<div class="mypage-info-data-order-state"><fmt:formatDate value="${o.od_date }" dateStyle="long"/></div>
						<div class="mypage-info-data-order-other">
							<button>상세보기</button>
						</div>
					</div>
				</c:forEach>
		</div>
</body>
</html>