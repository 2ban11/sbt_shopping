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
		<div class="board-detail__header">${board.f_title }</div>

		<div class="board-detail__header-detail">
			<div>조회 : ${board.f_view }</div>
			<div>댓글 : ${freeReplyCount }</div>
			<div>
				작성일 : 
				<fmt:formatDate value="${board.f_date }" pattern="yyyy-MM-dd HH:mm" />
			</div>
			<div>작성자 : ${board.a_nickname } (${board.f_id })</div>
		</div>

		<div class="board-detail__text">${board.f_txt }</div>
		
		<div class="board-del-upd__wrapper">
			<div>
				<form action="go.free.update">
					<button name="f_no" value="${board.f_no }">수정</button>
					<input type="hidden" name="type" value="2">
				</form>
			</div>
			<div>
				<form action="do.free.delete" onsubmit="return deleteAlert()">
					<button name="f_no" value="${board.f_no }">삭제</button>
					<input type="hidden" name="type" value="2">
				</form>
			</div>
		</div>
	</div>
	
	<div class="board-reply__wrapper">
		<div class="board-reply__header">댓글 (${freeReplyCount }건)</div>
		
		<c:forEach var="reply" items="${reply }">
		<form action="free.reply.delete" method="post" onsubmit="return deleteAlert()">
		<div class="board-reply__content">
			<div class="board-reply__nick-date-wrapper">
				<div class="board-reply__nick">${reply.a_nickname}</div>
				<div class="board-reply__date"><fmt:formatDate value="${reply.fr_date}" pattern="yyyy-MM-dd HH:mm" /></div>
			</div>
			<div class="board-reply__txt-delete-wrapper">
				<div class="board-reply__txt">${reply.fr_text}</div>
				<div class="board-reply__delete">
				<button name="fr_no" value="${reply.fr_no}">삭제</button>
				<input type="hidden" name="fr_free" value="${reply.fr_free }">
				<input type="hidden" name="type" value="2">
				</div>
			</div>
		</div>
		</form>
		</c:forEach>
		
		
		<form action="free.reply.write">
			<div class="board-reply__write-header">댓글 작성</div>
			<div class="board-reply__write-wrapper">
				<input type="hidden" name="fr_free" value="${board.f_no }">
				<input type="hidden" name="fr_id" value="jp@gmail.com">
				<input type="hidden" name="type" value="2">
				<div class="board-reply__write"> <textarea name="fr_text" maxlength="1000"></textarea> </div>
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