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
			<div>댓글 : ${jobReplyCount }</div>
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

		<c:if test="${sessionScope.loginMember.a_id eq board.j_id }">
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
		</c:if>
	</div>

	<div class="board-reply__wrapper">
		<div class="board-reply__header">댓글 (${jobReplyCount }건)</div>

		<c:forEach var="reply" items="${reply }">
			<form action="job.reply.delete" method="post"
				onsubmit="return deleteAlert()">
				<div class="board-reply__content">
					<div class="board-reply__nick-date-wrapper">
						<div class="board-reply__nick">${reply.a_nickname}</div>
						<div class="board-reply__date">
							<fmt:formatDate value="${reply.jr_date}"
								pattern="yyyy-MM-dd HH:mm" />
						</div>
					</div>
					<div class="board-reply__txt-delete-wrapper">
						<div class="board-reply__txt">${reply.jr_text}</div>
						<c:if test="${sessionScope.loginMember.a_id eq reply.jr_id }">
							<div class="board-reply__delete">
								<button name="jr_no" value="${reply.jr_no}">삭제</button>
								<input type="hidden" name="jr_job" value="${reply.jr_job }">
								<input type="hidden" name="type" value="4">
							</div>
						</c:if>
					</div>
				</div>
			</form>
		</c:forEach>

		<c:if test="${not empty sessionScope.loginMember.a_id}">
		<form action="job.reply.write">
			<div class="board-reply__write-header">댓글 작성</div>
			<div class="board-reply__write-wrapper">
				<input type="hidden" name="jr_job" value="${board.j_no }"> <input
					type="hidden" name="jr_id" value="${sessionScope.loginMember.a_id}"> <input
					type="hidden" name="type" value="4">
				<div class="board-reply__write">
					<textarea name="jr_text" maxlength="1000"></textarea>
				</div>
				<div class="board-reply__write--btn">
					<button>등록</button>
				</div>
			</div>
		</form>
		</c:if>
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