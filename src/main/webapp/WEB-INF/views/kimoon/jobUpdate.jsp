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
	<form action="do.job.update">
	<hr>
			<div class="board-write__input-group">
				<div class="board-write__input-title">주소</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="j_addr"
					placeholder="100자 제한" maxlength="100" value="${board.j_addr }" required>
				</div>
			</div>
			<div class="board-write__input-group">
				<div class="board-write__input-title">전화번호</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="j_phone"
						placeholder="예) 01012345678" maxlength="11" value="${board.j_phone }" required>
				</div>
			</div>
			<div class="board-write__input-group">
				<div class="board-write__input-title">구인/구직</div>
				<div class="board-write__input-div">
					<select class="board-write__job-select" name="j_category">
						<option value="구인">구인</option>
						<option value="구직">구직</option>
					</select>
				</div>
			</div>
	
		<hr>
		
		<div class="board-write__textarea">
			<div class="board-write__input-group">
				<div class="board-write__input-title">제목</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="j_title"
						value="${board.j_title }" maxlength="100" required> <input
						type="hidden" name="j_id" value="ddd@naver.com"> <input
						type="hidden" name="j_no" value="${board.j_no }">

				</div>
			</div>

			<div class="summernote__wrapper">
				<textarea class="summernote" name="j_txt" required>${board.j_txt }</textarea>
			</div>
			<div style="display: flex; justify-content: space-between;">
				<div>
					<button class="board-write__go-back" type="button"
						onclick="history.back()">취소</button>
				</div>
				<div>
					<button class="board-write__do-write" name="type" value="4">등록</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>