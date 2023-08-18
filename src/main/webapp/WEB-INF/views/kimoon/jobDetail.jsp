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
		<div class="board-detail__header">${board.j_title }</div>

		<div class="board-detail__header-detail">
			<div>조회 : ${board.j_view }</div>
			<div>댓글</div>
			<div>
				작성일 : 
				<fmt:formatDate value="${board.j_date }" pattern="yyyy-MM-dd HH:mm" />
			</div>
			<div>작성자 : ${board.a_nickname } (${board.j_id })</div>
		</div>

		<div class="board-detail__header-extra">
			<div class="board-detail__header-extra--div">
				<div>구인/구직</div>
				<div>${board.j_category }</div>
			</div>
			<div class="board-detail__header-extra--div">
				<div>주소</div>
				<div>${board.j_addr }</div>
			</div>
			<div class="board-detail__header-extra--div">
				<div>전화번호</div>
				<div>${board.j_phone }</div>
			</div>
		</div>

		<div class="board-detail__text">${board.j_txt }</div>
		
		<div class="board-del-upd__wrapper">
			<div>
				<form action="go.job.update">
					<button name="j_no" value="${board.j_no }">수정</button>
					<input type="hidden" name="type" value="4">
				</form>
			</div>
			<div>
				<form action="do.job.delete" onsubmit="return deleteAlert()">
					<button name="j_no" value="${board.j_no }">삭제</button>
					<input type="hidden" name="type" value="4">
				</form>
			</div>
		</div>
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
	</script>

</body>
</html>