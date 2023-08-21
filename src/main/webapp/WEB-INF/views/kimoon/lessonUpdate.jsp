<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
<script type="text/javascript" src="resources/js/kimoon/boardWrite.js"></script>
<link rel="stylesheet" href="resources/css/kimoon/noticeWrite.css" />
</head>
<body>
	<form action="do.lesson.update" onsubmit="return validLessonFee()">
	<hr>
			<div class="board-write__input-group">
				<div class="board-write__input-title">주소</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="l_addr"
					placeholder="100자 제한" maxlength="100" value="${board.l_addr }" required>
				</div>
			</div>
			<div class="board-write__input-group">
				<div class="board-write__input-title">전화번호</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="l_phone"
						placeholder="예) 01012345678" maxlength="11" value="${board.l_phone }" required>
				</div>
			</div>
			<div class="board-write__input-group">
				<div class="board-write__input-title">수강료</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="l_pay"
						placeholder="원 단위로 쉼표없이 적어주세요. 예) 10만원->100000" maxlength="10" value="${board.l_pay }" required>
				</div>
			</div>
	
		<hr>
		<div class="board-write__textarea">
			<div class="board-write__input-group">
				<div class="board-write__input-title">제목</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="l_title"
						value="${board.l_title }" maxlength="100" required> <input
						type="hidden" name="l_id" value="ddd@naver.com"> <input
						type="hidden" name="l_no" value="${board.l_no }">

				</div>
			</div>

			<div class="summernote__wrapper">
				<textarea class="summernote" name="l_txt" required>${board.l_txt }</textarea>
			</div>
			<div style="display: flex; justify-content: space-between;">
				<div>
					<button class="board-write__go-back" type="button"
						onclick="history.back()">취소</button>
				</div>
				<div>
					<button class="board-write__do-write" name="type" value="3">등록</button>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
	function validLessonFee() {
		var boardLessonFee = document.querySelector("input[name='l_pay']");
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