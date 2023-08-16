<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="resources/summernote/summernote-lite.js"></script>
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="resources/summernote/summernote-lite.css">

<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/kimoon/noticeWrite.css" />
<script type="text/javascript" src="resources/js/kimoon/boardWrite.js"></script>
</head>
<body>
	<div class="board-write__wrapper">
		<div class="board-write__header">
			<div class="board-write__header-title">글 작성하기</div>
			<div class="board-write__header-where">
				Home > 게시판 >
			<c:if test="${type eq 1}">
			공지
			</c:if>
				<c:if test="${type eq 2}">
			자유
			</c:if>
				<c:if test="${type eq 3}">
			개인레슨
			</c:if>
				<c:if test="${type eq 4}">
			구인/구직
			</c:if>
			</div>
		</div>
		<c:if test="${type eq 3 || type eq 4}">
		<div class="board-write__input-group">
			<div class="board-write__input-title">주소</div>
			<div class="board-write__input-div">
				<input class="board-write__input--input">
			</div>
		</div>
		<div class="board-write__input-group">
			<div class="board-write__input-title">전화번호</div>
			<div class="board-write__input-div">
				<input class="board-write__input--input"
					placeholder="예) 01012345678">
			</div>
		</div>
		</c:if>
		<c:if test="${type eq 3}">
		<div class="board-write__input-group">
			<div class="board-write__input-title">수강료</div>
			<div class="board-write__input-div">
				<input class="board-write__input--input"
					placeholder="원 단위로 쉼표없이 적어주세요. 예) 10만원->100000">
			</div>
		</div>
		</c:if>
		<c:if test="${type eq 3}">
		<div class="board-write__input-group">
			<div class="board-write__input-title">구인/구직</div>
			<div class="board-write__input-div">
				<select class="board-write__job-select">
					<option>구인</option>
					<option>구직</option>
				</select>
			</div>
		</div>
		</c:if>

		<hr>

		<form action="testInsert">

			<div class="board-write__textarea">
				<div class="board-write__input-group">
					<div class="board-write__input-title">제목</div>
					<div class="board-write__input-div">
						<input class="board-write__input--input" name="testTitle">
						<input type="hidden" name="n_id" value="asdtest">
					</div>
				</div>

				<div class="summernote__wrapper">
					<textarea class="summernote" name="editorarea"></textarea>
				</div>
				<div style="display: flex; justify-content: space-between;">
					<div>
						<button class="board-write__go-back" onclick="history.back()">취소</button>
					</div>
					<div>
						<button class="board-write__do-write">등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>