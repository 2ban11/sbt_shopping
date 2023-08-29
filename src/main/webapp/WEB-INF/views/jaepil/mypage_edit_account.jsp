<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jaepil/mypage.css">
<script>
    var isLoggedIn = <%= session.getAttribute("loginMember") != null %>;
</script>
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
		<div class="mypage-info-des">
			※ 이메일 주소, 닉네임은 변경이 불가합니다. <br> <br> ※ 간편로그인 이용자는 정보수정이
			불가합니다.

		</div>
		<c:set var="text" value="${account.a_id}" />
		<c:if test="${!fn:contains(text, '@null')}">
			<form action="accountedit" method="post">
				<div class="mypage-info-accounts">
					<div class="mypage-info-accounts-items">
						<div class="mypage-info-account">
							<div class="mypage-info-account-des">아이디</div>
							<div class="mypage-info-account-value">${account.a_id }</div>
						</div>
						<div class="mypage-info-account">
							<div class="mypage-info-account-des">이메일</div>
							<div class="mypage-info-account-value">${account.a_email }</div>
						</div>
						<div class="mypage-info-account">
							<div class="mypage-info-account-des">비밀번호</div>
							<div class="mypage-info-account-value">
								<input type="password" name="a_password" id="pw" minlength="8"
									maxlength="16" pattern="[a-z\d$!%*?&]{8,16}" required>
								소문자, 숫자, 특수문자(@제외)를 포함하여 8자 이상, 16자 이하
							</div>
						</div>
						<div class="mypage-info-account">
							<div class="mypage-info-account-des">비밀번호확인</div>
							<div class="mypage-info-account-value">
								<input type="password" id="PWConfirm" minlength="8"
									maxlength="16" pattern="[a-z\d$!%*?&]{8,16}" required>
								소문자, 숫자, 특수문자(@제외)를 포함하여 8자 이상, 16자 이하
							</div>
						</div>
						<div class="mypage-info-account">
							<div class="mypage-info-account-des">닉네임</div>
							<div class="mypage-info-account-value">${account.a_nickname }</div>
						</div>
						<div class="mypage-info-account">
							<div class="mypage-info-account-des">이름</div>
							<div class="mypage-info-account-value">${account.a_name }</div>
						</div>
						<div class="mypage-btn-account">
							<div>
								<button class="mypage-btn-account-btn"
									onclick="validatePassword()">정보 수정</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</c:if>
	</div>
</body>
<script type="text/javascript" src="resources/js/jaepil/mypage.js"></script>
</html>