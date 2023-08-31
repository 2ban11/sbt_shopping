<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파이널</title>

<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<script src="resources/js/inhoo/IH_modal.js"></script>
<script src="resources/js/inhoo/IH_DetailDo.js"></script>
<script src="resources/js/inhoo/IH_ReviewT.js"></script>
<script src="resources/js/inhoo/IH_cart.js"></script>



<script>
	document.addEventListener("DOMContentLoaded", function() {
		const toggleFormBtn = document.getElementById("toggleFormBtn");
		const qnaForm = document.getElementById("qnaForm");
		const submitQuestionBtn = document.getElementById("submitQuestion");
		const cancelQuestionBtn = document.getElementById("cancelQuestion");

		toggleFormBtn.addEventListener("click", function() {
			qnaForm.style.display = "block";
		});

		submitQuestionBtn.addEventListener("click", function() {
			// 여기에 폼 데이터를 처리하는 코드 추가
			// 예: AJAX 요청을 사용하여 서버에 데이터 전송
		});

		cancelQuestionBtn.addEventListener("click", function() {
			qnaForm.style.display = "none";
		});
	});
</script>

<script type="text/javascript">
	function ReviewDelete(r_no, p_no) {
		if (confirm('정말 삭제하시겠습니까?')) {
			var xhr = new XMLHttpRequest();
			xhr.open("GET", 'review.delete.do?r_no=' + r_no + '&p_no=' + p_no,
					true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					alert("리뷰가 삭제되었습니다.");
					location.reload();
				}
			}
			xhr.send();
		}
	}

	function QnaDelete(q_no, p_no) {
		if (confirm('정말 삭제하시겠습니까?')) {
			location.href = 'qna.delete.do?q_no=' + q_no + '&p_no=' + p_no;
		}
	}

	function validateForm() {
		var r_rate = document.getElementById("starpoint").value;
		if (r_rate == null || r_rate == "") {
			alert("별점을 선택해주세요.");
			return false;
		}
	}
</script>


</head>
<body>
	<div class="t3-wrapper">
		<!-- Main Content -->
		<div class="wrap mainbody" style="margin-top: 40px">
			<div class="container-fluid">
				<div class="row equal-height">
					<div id="t3-content" class="t3-content col-md-12">
						<div class="productdetail-view productdetails">
							<div class="page-header d-none d-xl-block">
								<h1
									style="font-size: 20px; padding-left: 110px; display: inline-block; text-transform: initial;">
									<h2>
										<span>${product.p_name }</span>
									</h2>
									<br /> <span style="text-transform: none">${product.p_maker }</span>
								</h1>
							</div>


							<div class="row align-items-start">
								<!-- left -->
								<div class="left col-12 col-md-5 col-sm-12">
									<div class="row">
										<img id="mainImg" src="resources/img/${product.p_img2 }"
											class="img-fluid">
									</div>
								</div>
								<!-- right -->
								<div class="col-12 col-md-5 col-sm-12">
									<div class="card"
										style="background-color: #1b2838; color: white;">
										<img src="resources/img/Guitar/${product.p_img1}"
											class="card-img-top img-thumbnail rounded mx-auto d-block"
											alt="...">
										<div class="card-body">
											<h5 class="card-title">${product.p_big_category}>
												${product.p_middle_category} > ${product.p_small_category} >
												${product.p_content}</h5>
											<div class="product-price">
												<p class="card-text">
													<c:if test="${product.p_price ne product.p_sale}">
														<span class="text-muted">정상가: <s><fmt:formatNumber
																	value="${product.p_price}" type="currency" /></s>
														</span>
														<span class="badge badge-danger ml-2"
															style="font-size: 1.5em;"> <fmt:formatNumber
																value="${((product.p_price - product.p_sale) / product.p_price) * 100}"
																type="number" pattern="#0'%'" />
														</span>

													</c:if>
													<c:if test="${product.p_price eq product.p_sale}">
														<span>&nbsp;</span>
													</c:if>
												</p>
												<h3>
													<p class="card-text font-weight-bold text-warning">
														판매가:
														<fmt:formatNumber value="${product.p_sale}"
															type="currency" />
													</p>
												</h3>

											</div>
											<p class="card-text">
												출시일:
												<fmt:formatDate value="${product.p_date}"
													pattern="yyyy-MM-dd" />
											</p>
											<p class="card-text">
												퍼블리셔: <a href="game_thumb.html?search_publisher=93"
													class="text-white">${product.p_maker}</a>
											</p>

											<form action="do.insert.cart" id="main-add-to-cart-form">
												<c:if test="${product.p_cnt ne 0}">
													<button class="btn btn-warning btn-lg btn-block"
														id="btn_cart" data="50004203" data-assetid="3508"
														data-prodtp="1">장바구니</button>

												</c:if>
												<input type="hidden" name="c_id"
													value="${sessionScope.loginMember.a_id }"> <input
													type="hidden" name="p_no" value="${product.p_no}">
											</form>
										</div>
									</div>
								</div>









							</div>




							<div class="row justify-content-between mt-5">
								<div class="col-5 mb-3">
									<h2>구매 후기</h2>
								</div>
								<div class="col-1">
									<c:if test="${not empty loginMember }">
										<button type="button" class="btn btn-danger"
											data-toggle="modal" data-target="#exampleModalCenter">
											후기 쓰기</button>
									</c:if>
								</div>
							</div>



							<!-- 리뷰 뷰 -->
							<div class="row justify-content-center mt-3">
								<div class="col-12">
									<table id="table1" class="table table-dark">
										<thead>
											<tr>
												<th scope="col">별점</th>
												<th scope="col">닉네임</th>
												<th scope="col">제목</th>
												<th scope="col">작성일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="r" items="${reviews}">
												<tr class="clickable-row" data-toggle="collapse"
													data-target="#row${r.r_no}">
													<th><span class="star-rating"
														style="pointer-events: none;"> <c:choose>
																<c:when test="${r.r_rate == 5}">
																	<span style="color: gold;">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
																</c:when>
																<c:when test="${r.r_rate == 4}">
																	<span style="color: gold;">&#9733;&#9733;&#9733;&#9733;</span>&#9734;
            													</c:when>
																<c:when test="${r.r_rate == 3}">
																	<span style="color: gold;">&#9733;&#9733;&#9733;</span>&#9734;&#9734;
													            </c:when>
																<c:when test="${r.r_rate == 2}">
																	<span style="color: gold;">&#9733;&#9733;</span>&#9734;&#9734;&#9734;
            													</c:when>
																<c:otherwise>
																	<span style="color: gold;">&#9733;</span>&#9734;&#9734;&#9734;&#9734;
            													</c:otherwise>
															</c:choose>
													</span></th>

													<th>${r.a_nickname}</th>
													<th>${r.r_title}</th>
													<th><fmt:formatDate value="${r.r_date}" type="date"
															dateStyle="short" pattern="yyyy/MM/dd" /></th>
													<c:if test="${r.r_id == loginMember.a_id}">
														<th><button type="button" class="btn btn-danger"
																onclick="ReviewDelete('${r.r_no}', '${product.p_no}')">리뷰
																삭제</button></th>
													</c:if>
												</tr>
												<tr id="row${r.r_no}" class="collapse">
													<td colspan="2"><c:choose>
															<c:when test="${not empty r.r_img}">
																<img src="resources/img/${r.r_img}" alt="Review Image">
															</c:when>
															<c:otherwise>
																<td></td>
															</c:otherwise>
														</c:choose></td>
													<td>${r.r_content}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>







							<!-- 구매후기 페이징 -->
							<ul class="pagination pagination-sm justify-content-center">
								<c:choose>
									<c:when test="${reviewCurPage != 1}">
										<li class="page-item"><a class="page-link"
											href="detail.product?reviewPage=${reviewCurPage - 1}&qnaPage=${qnaCurPage}&p_no=${product.p_no}"
											id="snsL">&lt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach var="i" begin="1" end="${reviewPageCount}">
									<li
										class="page-item <c:if test="${i == reviewCurPage}">active</c:if>"><a
										class="page-link"
										href="detail.product?reviewPage=${i}&qnaPage=${qnaCurPage}&p_no=${product.p_no}">${i}</a></li>
								</c:forEach>

								<c:choose>
									<c:when test="${reviewCurPage != reviewPageCount}">
										<li class="page-item"><a class="page-link"
											href="detail.product?reviewPage=${reviewCurPage + 1}&qnaPage=${qnaCurPage}&p_no=${product.p_no}"
											id="snsR">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">&gt;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>













							<!-- QnA 등록 -->
							<div class="row justify-content-between mt-5">
								<div class="col-5 mb-3">
									<h2>Q & A</h2>
								</div>
								<div class="col-1">
									<c:if test="${not empty loginMember }">
										<button type="button" class="btn btn-danger"
											id="toggleFormBtn">상품 문의</button>
									</c:if>
								</div>
							</div>

							<div id="qnaForm" style="display: none;">
								<form action="regQnaDo" method="post">
									<div class="form-group">
										<label for="title">제 목</label> <input type="text"
											class="form-control" id="title" name="q_title">
									</div>
									<div class="form-group">
										<label for="content">내 용</label>
										<textarea class="form-control" id="content" rows="4"
											name="q_content"></textarea>
										<input type="hidden" name="p_no" value="${product.p_no}">
									</div>
									<button type="submit" class="btn btn-primary"
										id="submitQuestion">확인</button>
									<button type="button" class="btn btn-secondary"
										id="cancelQuestion">취소</button>
								</form>
							</div>


							<!-- Q&A 뷰 -->
							<div class="row justify-content-center mt-3">
								<div class="col-12">
									<table id="table2" class="table table-dark">
										<thead>
											<tr>
												<th scope="col">작성자</th>
												<th scope="col">제목</th>
												<th scope="col">날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="q" items="${qnas}">
												<tr class="clickable-row" data-toggle="collapse"
													data-target="#row${q.q_no}-content">
													<td>${q.a_nickname}</td>
													<td>${q.q_title}</td>
													<td><fmt:formatDate value="${q.q_date}" type="date"
															dateStyle="short" pattern="yyyy/MM/dd/HH:mm" /></td>
													<c:if test="${q.q_id == loginMember.a_id}">
														<td><button type="button" class="btn btn-danger"
																onclick="QnaDelete('${q.q_no}', '${product.p_no}')">QnA
																삭제</button></td>
													</c:if>
												</tr>
												<tr id="row${q.q_no}-content" class="collapse">
													<td colspan="4" style="text-align: center;">${q.q_content}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>










							<!-- QnA 페이징 -->
							<ul class="pagination pagination-sm justify-content-center">
								<c:choose>
									<c:when test="${qnaCurPage != 1}">
										<li class="page-item"><a class="page-link"
											href="detail.product?reviewPage=${reviewCurPage}&qnaPage=${qnaCurPage - 1}&p_no=${product.p_no}"
											id="snsL">&lt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">&lt;</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach var="i" begin="1" end="${qnaPageCount}">
									<li
										class="page-item <c:if test="${i == qnaCurPage}">active</c:if>"><a
										class="page-link"
										href="detail.product?reviewPage=${reviewCurPage}&qnaPage=${i}&p_no=${product.p_no}">${i}</a></li>
								</c:forEach>

								<c:choose>
									<c:when test="${qnaCurPage != qnaPageCount}">
										<li class="page-item"><a class="page-link"
											href="detail.product?reviewPage=${reviewCurPage}&qnaPage=${qnaCurPage + 1}&p_no=${product.p_no}"
											id="snsR">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">&gt;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>








						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">후기 작성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- 리뷰 작성 양식  -->
				<form action="regReviewDo" method="post"
					enctype="multipart/form-data" onsubmit="return validateForm()">
					<div class="modal-body">
						<div class="table-responsive">
							<table class="table table-striped">
								<tbody>
									<tr>
										<td><input type="text" class="form-control"
											placeholder="제목" name="r_title" maxlength="20"></td>
										<input type="hidden" name="p_no" value="${product.p_no}">
									</tr>
									<tr>
										<td><textarea class="form-control" placeholder="리뷰 내용"
												name="r_content" maxlength="200" style="height: 350px;"></textarea>
										</td>
									</tr>
									<tr>
										<td>
											<div class="rating">
												<!-- <input type="hidden" id ="r_contentsId" name="r_contentsId" value=""> -->
												<span class="star" data-value="1">☆</span> <span
													class="star" data-value="2">☆</span> <span class="star"
													data-value="3">☆</span> <span class="star" data-value="4">☆</span>
												<span class="star" data-value="5">☆</span> <input
													type="hidden" name="r_rate" id="starpoint">
											</div>
										</td>
									</tr>
									<tr>
										<td><input type="file" name="file" id="fileInput">
											<br> <span id="fileName"></span></td>
									</tr>
									<%--   <tr>
                  <td><input type="hidden" class="form-control-file"
                    name="r_id" value="${account.id }"></td>
                </tr> --%>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">닫기</button>
							<button class="btn btn-primary">작성</button>
						</div>
				</form>
			</div>
		</div>
	</div>
	</div>







	<!-- 기문이 모달창 -->
	<div id="mainModal" class="main-cart__modal">
		<div class="main-cart__modal-wrapper">
			<div class="main-cart__modal-header">
				<div style="font-weight: bold">장바구니</div>
				<div>
					<button class="main-cart__modal--close">&times;</button>
				</div>
			</div>
			<div
				style="padding: 2.5em 1em; border-bottom: 1px solid rgba(255, 255, 255, 0.2);">장바구니에
				추가되었습니다.</div>
			<div class="main-how-to-cart">
				<div>
					<button id="main-continue-shopping">계속 쇼핑하기</button>
				</div>
				<div>
					<button id="main-go-to-cart" onclick="location.href='mypage.cart'">장바구니로
						이동하기</button>
				</div>
			</div>
		</div>
	</div>






	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<link rel="stylesheet" href="resources/css/inhoo/detail.css" />
	<link rel="stylesheet" href="resources/css/kimoon/main-page.css" />


</body>
</html>