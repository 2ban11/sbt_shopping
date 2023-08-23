<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet" href="resources/css/kimoon/boardWrite.css" />
</head>
<body>

	<form action="do.notice.update">
	
		<hr>

		<div class="board-write__textarea">
			<div class="board-write__input-group">
				<div class="board-write__input-title">제목</div>
				<div class="board-write__input-div">
					<input class="board-write__input--input" name="n_title"
						value="${board.n_title }" maxlength="100" required>
						 <input	type="hidden" name="n_id" value="ddd@naver.com">
						 <input	type="hidden" name="n_no" value="${param.n_no }">
				</div>
			</div>

			<div class="summernote__wrapper">
				<textarea class="summernote" name="n_txt" required>${board.n_txt }</textarea>
			</div>
			<div style="display: flex; justify-content: space-between;">
				<div>
					<button class="board-write__go-back" type="button"
						onclick="history.back()">취소</button>
				</div>
				<div>
					<button class="board-write__do-write" name="type" value="1">등록</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>