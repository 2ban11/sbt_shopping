<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var isLoggedIn =
<%=session.getAttribute("loginMember") != null%>
	;
</script>
<script>
	var isLoggedIn =
<%=session.getAttribute("loginMember") != null%>
	;
</script>
<script type="text/javascript" src="resources/js/jaepil/mypage.js"></script>
<link rel="stylesheet" href="resources/css/jaepil/mypage.css">
</head>
<body>
	<div class="mypage-main">
		<h1>문의내역</h1>
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
			※ 고객센터 운영시간: 월~목 10:00~17:00 (점심시간: 12:30~14:00) / 금 10:00~12:00 / 토,
			일, 공휴일 휴무 <br> <br> ※ 운영시간 외에 문의하신 사항은 홈페이지, 전화, 메일의 대응이 모두
			불가하며, 영업일 기준 다음 운영시간에 순차적으로 처리됩니다. <br> <br> ※ 문의 사항의 내용과
			고객센터 사정에 따라 응답이 다소 지연될 수 있습니다.
		</div>
		<div>
			<div class="mypage-info-datas">
				<div class="mypage-info-data-nav">
					<div class="mypage-info-data-qna-no">번호</div>
					<div class="mypage-info-data-qna-title">제목</div>
					<div class="mypage-info-data-qna-date">작성일자</div>
				</div>
				<c:if test="${not empty qnas}">
					<c:forEach var="q" items="${qnas }">
						<details>
							<summary>
								<div class="mypage-info-data">
									<div class="mypage-info-data-qna-no">${q.rn }</div>
									<div class="mypage-info-data-qna-title">${q.q_title }</div>
									<div class="mypage-info-data-qna-date">
										<fmt:formatDate value="${q.q_date }" dateStyle="long" />
									</div>
								</div>
							</summary>
							<div class="mypage-info-data detail">
								<div class="mypage-info-data-qna-content">${q.q_content }</div>
								<div class="mypage-info-data-qna-content" style="padding-left: 20px;"><img src="resources/img/Left2.png" style="width: 30px;">&nbsp;&nbsp; ${q.q_ans.a_ans }</div>
							</div>
						</details>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<%-- <details>
				<summary>
								<div class="mypage-info-data">
									<div class="mypage-info-data-qna-no">${q.rn }</div>
									<div class="mypage-info-data-qna-title">${q.q_title }</div>
									<div class="mypage-info-data-qna-date">
										<fmt:formatDate value="${q.q_date }" dateStyle="long" />
									</div>
								</div>
							</summary>
							<div class="mypage-info-data">
								<div class="mypage-info-data-qna-content">${q.q_content }</div>
							</div>
						</details> --%>
</body>
</html>