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
		<div class="board-detail__header">${board.l_title }</div>

		<div class="board-detail__header-detail">
			<div>조회 : ${board.l_view }</div>
			<div>댓글</div>
			<div>
				작성일 : 
				<fmt:formatDate value="${board.l_date }" pattern="yyyy-MM-dd HH:mm" />
			</div>
			<div>작성자 : ${board.a_nickname } (${board.l_id })</div>
		</div>

		<div class="board-detail__header-extra">
			<div class="board-detail__header-extra--div">
				<div>수강료</div>
				<div>${board.l_pay }</div>
			</div>
			<div class="board-detail__header-extra--div">
				<div>주소</div>
				<div>${board.l_addr }</div>
			</div>
			<div class="board-detail__header-extra--div">
				<div>전화번호</div>
				<div>${board.l_phone }</div>
			</div>
		</div>

		<div class="board-detail__text">${board.l_txt }</div>
		
		<div class="board-del-upd__wrapper">
			<div>
				<form action="go.lesson.update">
					<button name="l_no" value="${board.l_no }">수정</button>
					<input type="hidden" name="type" value="3">
				</form>
			</div>
			<div>
				<form action="do.lesson.delete">
					<button name="l_no" value="${board.l_no }">삭제</button>
					<input type="hidden" name="type" value="3">
				</form>
			</div>
		</div>
	</div>


</body>
</html>