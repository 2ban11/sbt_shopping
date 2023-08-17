<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/kimoon/notice.css" />
</head>
<body>
	<div class="board-title">
		<c:if test="${type eq 1}">
			<h1>공지</h1>
		</c:if>
		<c:if test="${type eq 2}">
			<h1>자유</h1>
		</c:if>
		<c:if test="${type eq 3}">
			<h1>개인레슨</h1>
		</c:if>
		<c:if test="${type eq 4}">
			<h1>구인/구직</h1>
		</c:if>
	</div>
	<div class="notice-wrapper">
		<table class="notice-table">
			<tr>
				<th class="notice-no">번호</th>
				<c:if test="${type eq 4}">
					<th class="notice-job">타입</th>
				</c:if>
				<th class="notice-title">제목</th>
				<th class="notice-writer">작성자</th>
				<th class="notice-date">작성일</th>
				<th class="notice-view-count">조회</th>
			</tr>
			<c:forEach var="p" items="${posts}">
				<c:if test="${type eq 1}">
					<tr>
						<td style="text-align: center">${p.rn}</td>
						<td><a href="go.notice.detail?n_no=${p.n_no }&type=${type}">${p.n_title }</a></td>
						<td>${p.a_nickname }</td>
						<td style="text-align: center"><fmt:formatDate
								value="${p.n_date}" pattern="yyyy-MM-dd" /></td>
						<td style="text-align: center">${p.n_view }</td>
					</tr>
				</c:if>
				<c:if test="${type eq 2}">
					<tr>
						<td style="text-align: center">${p.rn}</td>
						<td><a href="go.free.detail?f_no=${p.f_no }&type=${type}">${p.f_title }</a></td>
						<td>${p.a_nickname }</td>
						<td style="text-align: center"><fmt:formatDate
								value="${p.f_date}" pattern="yyyy-MM-dd" /></td>
						<td style="text-align: center">${p.f_view }</td>
					</tr>
				</c:if>
				<c:if test="${type eq 3}">
					<tr>
						<td style="text-align: center">${p.rn}</td>
						<td><a href="go.lesson.detail?l_no=${p.l_no }&type=${type}">${p.l_title }</a></td>
						<td>${p.a_nickname }</td>
						<td style="text-align: center"><fmt:formatDate
								value="${p.l_date}" pattern="yyyy-MM-dd" /></td>
						<td style="text-align: center">${p.l_view }</td>
					</tr>
				</c:if>
				<c:if test="${type eq 4}">
					<tr>
						<td style="text-align: center">${p.rn}</td>
						<td style="text-align: center">${p.j_category}</td>
						<td><a href="go.job.detail?j_no=${p.j_no }&type=${type}">${p.j_title }</a></td>
						<td>${p.a_nickname }</td>
						<td style="text-align: center"><fmt:formatDate
								value="${p.j_date}" pattern="yyyy-MM-dd" /></td>
						<td style="text-align: center">${p.j_view }</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>


	<div class="board-paging">
		<c:if test="${curPage != 1 }">
			<div class="board-paging__arrow">
				<a href="board.page.change?type=${type }&p=${curPage - 1 }">&lt;</a>
			</div>
		</c:if>
		<c:forEach var="i" begin="1" end="${pageCount }">
			<div class="board-paging__num ${i == curPage ? 'active' : ''}">
				<a href="board.page.change?type=${type }&p=${i }">${i }</a>
			</div>
		</c:forEach>
		<c:if test="${curPage != pageCount }">
			<div class="board-paging__arrow">
				<a href="board.page.change?type=${type }&p=${curPage + 1 }">&gt;</a>
			</div>
		</c:if>
	</div>

	<div class="board-search__wrapper">
		<form action="" class="board-search--form">
			<input class="board-search--input" placeholder="제목/내용 검색어 입력">
			<button class="board-search--btn">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>
	</div>

	<div>
		<form action="go.board.write" class="board-write">
			<c:if test="${type eq 1}">
				<button class="board-write--btn" name="type" value="1">공지 글쓰기</button>
			</c:if>
			<c:if test="${type eq 2}">
				<button class="board-write--btn" name="type" value="2">자유 글쓰기</button>
			</c:if>
			<c:if test="${type eq 3}">
				<button class="board-write--btn" name="type" value="3">레슨 글쓰기</button>
			</c:if>
			<c:if test="${type eq 4}">
				<button class="board-write--btn" name="type" value="4">구인 글쓰기</button>
			</c:if>
		</form>
	</div>
</body>
</html>