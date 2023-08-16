<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jaepil/mypage.css">
</head>
<body>
	<h1>마이페이지</h1>
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
			※ 다이렉트 게임즈 고객센터 운영시간: 월~목 10:00~17:00 (점심시간: 12:30~14:00) / 금
			10:00~12:00 / 토, 일, 공휴일 휴무 <br> ※ 운영시간 외에 문의하신 사항은 홈페이지, 전화, 메일의
			대응이 모두 불가하며, 영업일 기준 다음 운영시간에 순차적으로 처리됩니다. <br> ※ 문의 사항의 내용과 고객센터
			사정에 따라 응답이 다소 지연될 수 있습니다.
		</div>
		<div>
			<div class="mypage-info-datas">
				<div class="mypage-info-data">
					<div class="mypage-info-data-qna-no">번호</div>
					<div class="mypage-info-data-qna-title">제목</div>
					<div class="mypage-info-data-qna-date">작성일자</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>