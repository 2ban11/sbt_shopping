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
<link rel="stylesheet" href="resources/css/kimoon/boardDetail.css">
</head>
<body>
	<div class="board-detail__wrapper">
		<div class="board-detail__header">${board.n_title }</div>

		<div class="board-detail__header-detail">
			<div>조회 ${board.n_view }</div>
			<div>댓글</div>
			<div>
				작성일
				<fmt:formatDate value="${board.n_date }" pattern="yyyy-MM-dd HH:mm" />
			</div>
			<div>작성자 ${board.a_nickname } (${board.n_id })</div>
		</div>

		<div class="board-detail__text">${board.n_txt }</div>

		<div class="board-del-upd__wrapper">
			<div>
				<form action="go.notice.update">
					<button name="n_no" value="${board.n_no }">수정</button>
					<input type="hidden" name="type" value="1">
				</form>
			</div>
			<div>
				<form action="do.notice.delete">
					<button name="n_no" value="${board.n_no }">삭제</button>
					<input type="hidden" name="type" value="1">
				</form>
			</div>
		</div>
	</div>

	<div></div>
</body>
</html>