<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mypage-main"><h1>마이페이지</h1></div>	
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
			※ 회원탈퇴 전, 아래의 내용을 다시 한 번 확인 후 신중하게 진행해주시기 바랍니다.<br> - 회원탈퇴 즉시
			회원정보가 삭제되며, 주문 내역과 제공 콘텐츠 정보 제공이 불가합니다.
		</div>
		<form action="accountSignOut">
			<div class="mypage-info-accounts">
				<div class="mypage-info-accounts-items">
					<div class="mypage-info-account">
						<div class="mypage-info-account-des">아이디</div>
						<div class="mypage-info-account-value">아이디</div>
					</div>
					<div class="mypage-btn-account">
						<div>
							<button class="mypage-btn-account-btn-signout">회원탈퇴</button>
							<button type="button" class="mypage-btn-account-btn">돌아가기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>