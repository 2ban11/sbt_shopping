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
	<c:if test="${type eq 1}">
		<form action="do.notice.write">
	</c:if>
	<c:if test="${type eq 2}">
		<form action="do.free.write">
	</c:if>
	<c:if test="${type eq 3}">
		<form action="do.lesson.write" onsubmit="return validLessonFee()">
	</c:if>
	<c:if test="${type eq 4}">
		<form action="do.job.write">
	</c:if>
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
					<input class="board-write__input--input" name="boardAdress"
					placeholder="100자 제한" maxlength="100" required>
				</div>
			</div>
			<div class="board-write__input-group">
				<div class="board-write__input-title">전화번호</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="boardPhone"
						placeholder="예) 01012345678" maxlength="11" required>
				</div>
			</div>
		</c:if>
		<c:if test="${type eq 3}">
			<div class="board-write__input-group">
				<div class="board-write__input-title">수강료</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="boardLessonFee"
						placeholder="원 단위로 쉼표없이 적어주세요. 예) 10만원->100000" maxlength="10" required>
				</div>
			</div>
		</c:if>
		<c:if test="${type eq 4}">
			<div class="board-write__input-group">
				<div class="board-write__input-title">구인/구직</div>
				<div class="board-write__input-div">
					<select class="board-write__job-select" name="boardJob">
						<option value="구인">구인</option>
						<option value="구직">구직</option>
					</select>
				</div>
			</div>
		</c:if>

		<hr>

		<div class="board-write__textarea">
			<div class="board-write__input-group">
				<div class="board-write__input-title">제목</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="boardTitle" placeholder="100자 제한" maxlength="100" required>
					<c:if test="${type eq 1}">
					<input type="hidden" name="n_id" value="ddd@naver.com">
					</c:if>
					<c:if test="${type eq 2}">
					<input type="hidden" name="f_id" value="ddd@naver.com">
					</c:if>
					<c:if test="${type eq 3}">
					<input type="hidden" name="l_id" value="ddd@naver.com">
					</c:if>
					<c:if test="${type eq 4}">
					<input type="hidden" name="j_id" value="ddd@naver.com">
					</c:if>
				</div>
			</div>

			<div class="summernote__wrapper">
				<textarea class="summernote" name="editorarea" required></textarea>
			</div>
			<div style="display: flex; justify-content: space-between;">
				<div>
					<button class="board-write__go-back" type="button" onclick="history.back()">취소</button>
				</div>
				<div>
					<button class="board-write__do-write" name="type" value="${type}">등록</button>
				</div>
			</div>
		</div>
	</div>
	</form>
	<script type="text/javascript">
	function validLessonFee() {
		var boardLessonFee = document.querySelector("input[name='boardLessonFee']");
		var boardLessonFeeValue = boardLessonFee.value;
		
		if (isNaN(boardLessonFeeValue)) {
            alert("수강료는 숫자로 입력해주세요.");
            boardLessonFee.focus();
            return false;
        }
	}
	</script>
</body>
</html>