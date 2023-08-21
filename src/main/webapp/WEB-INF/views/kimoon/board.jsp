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
			<tr class="board-table__category">
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
						<td class="board-list__rn" style="text-align: center">${p.rn}</td>
						<td><a class="board-list__title"
							href="go.notice.detail?n_no=${p.n_no }&type=${type}">
								${p.n_title } <span style="color: #67c1f5">[${p.notice_reply_count }]</span>
						</a>
							<div class="board-list__mobile">
								<div>${p.a_nickname }</div>
								<div>
									<fmt:formatDate value="${p.n_date}" pattern="yyyy-MM-dd" />
								</div>
								<div>${p.n_view }</div>
							</div></td>
						<td class="board-list__nickname">${p.a_nickname }</td>
						<td class="board-list__date" style="text-align: center"><fmt:formatDate
								value="${p.n_date}" pattern="yyyy-MM-dd" /></td>
						<td class="board-list__view" style="text-align: center">${p.n_view }</td>
					</tr>
				</c:if>
				<c:if test="${type eq 2}">
					<tr>
						<td class="board-list__rn" style="text-align: center">${p.rn}</td>
						<td><a class="board-list__title"
							href="go.free.detail?f_no=${p.f_no }&type=${type}">${p.f_title }
								<span style="color: #67c1f5">[${p.free_reply_count }]</span>
						</a>
							<div class="board-list__mobile">
								<div>${p.a_nickname }</div>
								<div>
									<fmt:formatDate value="${p.f_date}" pattern="yyyy-MM-dd" />
								</div>
								<div>${p.f_view }</div>
							</div></td>
						<td class="board-list__nickname">${p.a_nickname }</td>
						<td class="board-list__date" style="text-align: center"><fmt:formatDate
								value="${p.f_date}" pattern="yyyy-MM-dd" /></td>
						<td class="board-list__view" style="text-align: center">${p.f_view }</td>
					</tr>
				</c:if>
				<c:if test="${type eq 3}">
					<tr>
						<td class="board-list__rn" style="text-align: center">${p.rn}</td>
						<td><a class="board-list__title"
							href="go.lesson.detail?l_no=${p.l_no }&type=${type}">${p.l_title }
								<span style="color: #67c1f5">[${p.lesson_reply_count }]</span>
						</a>
							<div class="board-list__mobile">
								<div>${p.a_nickname }</div>
								<div>
									<fmt:formatDate value="${p.l_date}" pattern="yyyy-MM-dd" />
								</div>
								<div>${p.l_view }</div>
							</div></td>
						<td class="board-list__nickname">${p.a_nickname }</td>
						<td class="board-list__date" style="text-align: center"><fmt:formatDate
								value="${p.l_date}" pattern="yyyy-MM-dd" /></td>
						<td class="board-list__view" style="text-align: center">${p.l_view }</td>
					</tr>
				</c:if>
				<c:if test="${type eq 4}">
					<tr>
						<td class="board-list__rn" style="text-align: center">${p.rn}</td>
						<td class="board-list__job-category" style="text-align: center">${p.j_category}</td>
						<td><a href="go.job.detail?j_no=${p.j_no }&type=${type}"
							class="board-list__title">${p.j_title } <span
								style="color: #67c1f5">[${p.job_reply_count }]</span></a>
							<div class="board-list__mobile">
								<div>${p.a_nickname }</div>
								<div>${p.j_category }</div>
								<div>
									<fmt:formatDate value="${p.j_date}" pattern="yyyy-MM-dd" />
								</div>
								<div>${p.j_view }</div>
							</div></td>
						<td class="board-list__nickname">${p.a_nickname }</td>
						<td class="board-list__date" style="text-align: center"><fmt:formatDate
								value="${p.j_date}" pattern="yyyy-MM-dd" /></td>
						<td class="board-list__view" style="text-align: center">${p.j_view }</td>
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
		<c:if test="${type eq 1}">
			<form action="notice.search" class="board-search--form"
				name="boardSearchForm">
				<input type="hidden" name="type" value="1">
		</c:if>
		<c:if test="${type eq 2}">
			<form action="free.search" class="board-search--form"
				name="boardSearchForm">
				<input type="hidden" name="type" value="2">
		</c:if>
		<c:if test="${type eq 3}">
			<form action="lesson.search" class="board-search--form"
				name="boardSearchForm">
				<input type="hidden" name="type" value="3">
		</c:if>
		<c:if test="${type eq 4}">
			<form action="job.search" class="board-search--form"
				name="boardSearchForm">
				<input type="hidden" name="type" value="4">
		</c:if>
		<input class="board-search--input" placeholder="제목/내용 검색어 입력"
			name="search" required>
		<button class="board-search--btn">
			<i class="fa-solid fa-magnifying-glass"></i>
		</button>
		</form>
	</div>

	<div>
		<form action="go.board.write" class="board-write">
			<c:if test="${type eq 1}">
				<button class="board-write--btn" name="type" value="1">글쓰기</button>
			</c:if>
			<c:if test="${type eq 2}">
				<button class="board-write--btn" name="type" value="2">글쓰기</button>
			</c:if>
			<c:if test="${type eq 3}">
				<button class="board-write--btn" name="type" value="3">글쓰기</button>
			</c:if>
			<c:if test="${type eq 4}">
				<button class="board-write--btn" name="type" value="4">글쓰기</button>
			</c:if>
		</form>
	</div>

</body>
</html>