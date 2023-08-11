<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/kimoon/notice.css" />
</head>
<body>
	<div class="board-title">
		<h1>공지</h1>
	</div>
	<div class="notice-wrapper">
		<table class="notice-table">
			<tr>
				<th class="notice-no">번호</th>
				<th class="notice-title">제목</th>
				<th class="notice-writer">작성자</th>
				<th class="notice-date">작성일</th>
				<th class="notice-view-count">조회</th>
			</tr>
			<c:forEach var="n" items="${nPost}">
				<tr>
					<td style="text-align: center">${n.rn}</td>
					<td><a href="#">${n.n_title }</a></td>
					<td>${n.a_nickname }</td>
					<td style="text-align: center"><fmt:formatDate
							value="${n.n_date}" pattern="yyyy-MM-dd" /></td>
					<td style="text-align: center">${n.n_view }</td>
				</tr>
			</c:forEach>
		</table>
	</div>


	<div style="background-color: orange; color: white;">
		<c:if test="${curPage != 1 }">
			<a href="notice.page.change?p=${curPage - 1 }">&lt;</a>
		</c:if>
		<c:forEach var="i" begin="1" end="${pageCount }">
			<a href="notice.page.change?p=${i }">${i }</a>
		</c:forEach>
		<c:if test="${curPage != pageCount }">
			<a href="notice.page.change?p=${curPage + 1 }">&gt;</a>
		</c:if>
	</div>

	<div>
		<form action="">
			<button>글쓰기</button>
		</form>
	</div>
</body>
</html>