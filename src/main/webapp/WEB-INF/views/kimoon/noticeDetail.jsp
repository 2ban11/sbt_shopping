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
			<div>조회 : ${board.n_view }</div>
			<div>댓글</div>
			<div>
				작성일 : 
				<fmt:formatDate value="${board.n_date }" pattern="yyyy-MM-dd HH:mm" />
			</div>
			<div>작성자 : ${board.a_nickname } (${board.n_id })</div>
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
				<form action="do.notice.delete" onsubmit="return deleteAlert()">
					<button name="n_no" value="${board.n_no }">삭제</button>
					<input type="hidden" name="type" value="1">
				</form>
			</div>
		</div>
	</div>


	<div class="board-reply__wrapper">
		<div class="board-reply__header">댓글 (??건)</div>
		
		<c:forEach var="reply" items="${reply }">
		<div class="board-reply__content">
			<div class="board-reply__nick-date-wrapper">
				<div class="board-reply__nick">${reply.nr_id}</div>
				<div class="board-reply__date">${reply.nr_date}</div>
			</div>
			<div class="board-reply__txt-delete-wrapper">
				<div class="board-reply__txt">${reply.nr_text}</div>
				<div class="board-reply__delete">
				<button>삭제</button>
				</div>
			</div>
		</div>
		</c:forEach>
		
		
		<form action="notice.reply.write">
			<div class="board-reply__write-header">댓글 작성</div>
			<div class="board-reply__write-wrapper">
				<input type="hidden" name="nr_notice" value="${board.n_no }">
				<input type="hidden" name="nr_id" value="jp@gmail.com">
				<input type="hidden" name="type" value="1">
				<div class="board-reply__write"> <textarea name="nr_text"></textarea> </div>
				<div class="board-reply__write--btn"><button>등록</button></div>
			</div>
		</form>
		
	</div>
	
	<script type="text/javascript">
	function deleteAlert() {
		 var confirmDelete = confirm("정말 삭제하시겠습니까?");
		    
		    if (confirmDelete) {
		        return true; // '네'를 클릭하면 폼 제출 실행
		    } else {
		        return false; // '아니오'를 클릭하면 폼 제출 취소
		    }
	}
	
	$('.board-detail__text').find('img').css('max-width', '100%');
	</script>
	
</body>
</html>