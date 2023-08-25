<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/kimoon/kakaoPaySuccess.css" />
<body>
	<div class="kp-title">
		<h1>카카오페이 결제가 정상적으로 완료되었습니다.</h1>
	</div>
	<table class="kp-table">
		<tr>
			<td class="kp-table-top" colspan="2" style="padding: 10px 0 10px;">주문 정보</td>
		</tr>
		<tr>
			<td>결제일시</td>
			<td>
			<fmt:formatDate value="${info.approved_at}" pattern="yyyy-MM-dd HH:mm"/>
			</td>
		</tr>
		<tr>
			<td>주문번호</td>
			<td>${info.approved_at}</td>
		</tr>
		<tr>
			<td>구매자</td>
			<td>${info.partner_user_id}</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>${info.item_name}</td>
		</tr>
		<tr>
			<td>결제금액</td>
			<td>${info.amount.total}</td>
		</tr>
	</table>

	<div class="kp-gohome">
		<button onclick="location.href='/shopping'">홈으로</button>
	</div>
	<h2>${info}</h2>
</body>
</html>