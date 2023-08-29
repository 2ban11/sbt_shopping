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
</head>
<body>
	<div class="mypage-info-datas">
		<div class="mypage-info-data-nav">
			<div class="mypage-info-data-order-no">주문번호</div>
			<div class="mypage-info-data-order-name">상품명</div>
			<div class="mypage-info-data-order-pay">수량</div>
			<div class="mypage-info-data-order-sale">가격</div>
			<div class="mypage-info-data-order-date">주문날짜</div>
			<div class="mypage-info-data-order-state">주문상태</div>
		</div>
		</div>
		<div id="data-container"></div> 
		
	<div id="pagination"></div>
	
	<script>
	let jsonData = [];
	
	<c:forEach var="o" items="${orders}">
		var item = {
			od_no: '${o.od_no}',
			p_name: '${o.p_name}',
			od_cnt: '${o.od_cnt}',
			od_price: '${o.od_price}',
			od_date: '<fmt:formatDate value="${o.od_date}" dateStyle="long" />',
			od_state: '${o.od_state}'
		};
		jsonData.push(item);
	</c:forEach>

	function paging() {
		console.log('paging called ---------');
		let container = $('#pagination');
		container.pagination({
			dataSource: jsonData,
			pageSize: 10,
			callback: function (data, pagination) {
				var dataHtml = '<ul style="color:white;">';
				$.each(data, function (index, item) {
					dataHtml += '<div class="mypage-info-data">';
					dataHtml += '<div class="mypage-info-data-order-no">' + item.od_no + '</div>';
					dataHtml += '<div class="mypage-info-data-order-name">' + item.p_name + '</div>';
					dataHtml += '<div class="mypage-info-data-order-pay">' + item.od_cnt + '</div>';
					dataHtml += '<div class="mypage-info-data-order-sale">' + item.od_price + '</div>';
					dataHtml += '<div class="mypage-info-data-order-date">' + item.od_date + '</div>';
					dataHtml += '<div class="mypage-info-data-order-state">' + item.od_state + '</div>';
					dataHtml += '</div>';
				});
				dataHtml += '</ul>';
				$("#data-container").html(dataHtml);
			}
		});
	}

	$(function () {
		paging(); // 페이지 로드 시 paging 함수 호출
	});
	</script>
</body>
</html>