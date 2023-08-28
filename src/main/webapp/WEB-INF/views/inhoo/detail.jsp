<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파이널</title>

<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"/>
<script src="resources/js/IH_modal.js"></script>
<script src="resources/js/IH_DetailDo.js"></script>
<script src="resources/js/IH_ReviewT.js"></script>
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


</head>
<body>
<div class="t3-wrapper">
      <!-- Main Content -->
      <div class="wrap mainbody" style="margin-top: 40px">
        <div class="container-fluid">
          <div class="row equal-height">
            <div id="t3-content" class="t3-content col-md-12">
              <div class="productdetail-view productdetails">
                <div class="page-header">
                  <h1 style="font-size: 20px; padding-left: 110px; display: inline-block; text-transform: initial;">
                    <span>${product.p_name }</span>
                    <br />
                    <span style="text-transform: none">
                      ${product.p_maker }
                    </span>
                  </h1>
                </div>
              
                <div class="row align-items-start">
                  <div class="left col-md-5 col-sm-12">
                    <div class="row">
                    <img id="mainImg" src="resources/img/Guitar/${product.p_img1 }">
                    </div>
                  </div>
                 
                   <div class="right col-md-5 col-sm-12">
                    <div class="vm-product-details-container">
                      <div class="t3-module border p-3">
                        <div id="goods_img">
                          <img src="resources/img/Guitar/${product.p_img2 }" width="320" height="150"/>
                        </div>
                        <div class="module-inner">
                          <div class="module-ct">
                            <div class="vmgroup single-product normal-module">
                              <div class="vmproduct normal-module">
                                <div class="spacer">
                                  <div class="product-short-description"></div>
                                  <div class="product-price salesprice" id="productPrice8" style="padding-top: 10px">
                                    <div class="PricebasePrice vm-display vm-price-value">
                                      <span class="vm-price-desc">정상가 : </span>
                                      <span class="PricebasePrice" style="font-weight: normal; font-size: 13px;">${product.p_price }</span>
                                    </div>
                                    <span class="price-crossed"></span>
                                    <div class="PricesalesPrice vm-display vm-price-value">
                                      <span class="vm-price-desc">판매가 </span>
                                      <span class="PricesalesPrice" style="color: #f0ad4e" >${product.p_sale }</span>
                                      <span>원</span>
                                    </div>
                                  </div>

                                  <div class="product-info">
                                    <div class="vm-display release_date">
                                      <span class="vm-desc">출시일 </span>
                                      <span class="vm-value"> ${product.p_date } </span>
                                    </div>
                                    <div class="vm-display">
                                      <span class="vm-desc">종류 </span>
                                      <span class="vm-value">
                                      ${product.p_big_category } > ${product.p_middle_category } >  ${product.p_small_category } > ${product.p_content } 
                                       </span>
                                    </div>
                                    <div class="vm-display">
                                      <span class="vm-desc">퍼블리셔 </span>
                                      <span class="vm-value"><a href="game_thumb.html?search_publisher=93">${product.p_maker }</a></span>
                                    </div>
                                    <div class="vm-display">
                                      <span class="vm-desc">color </span>
                                      <span class="vm-value">${product.p_color }</span>
                                    </div>
                                  </div>
                                  
                                  <div class="vmproduct-link" style="text-align: center">
                                    <button type="button" class="btn btn-warning btn-lg" id="btn_cart" data="50004203" data-assetid="3508" data-prodtp="1">
                                      장바구니
                                    </button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="clear"></div>
                  </div>
                </div>




                <div class="row justify-content-between mt-5">
                  <div class="col-5 mb-3">
                    <h2>구매 후기</h2>
                  </div>
                  <div class="col-1">
                  <c:if test="${not empty loginMember || not empty LoginMemberNaver || not empty kakaoInfo  }">
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter">
                      후기 쓰기
                    </button>
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
          <tr class="clickable-row" data-toggle="collapse" data-target="#row${r.r_id}">
            <th>${r.r_rate}</th>
            <th>${r.r_id}</th>
            <th>${r.r_title}</th>
	        <th>
            	<fmt:formatDate value="${r.r_date }" type="date" dateStyle="short"/>
	        </th>
          </tr>
          <tr id="row${r.r_id}" class="collapse">
            <td colspan="2">
              <!-- 이미지가 존재하는 경우만 이미지를 표시합니다. -->
              <c:choose>
                <c:when test="${not empty r.r_img}">
                  <img src="resources/img/${r.r_img }" alt="Review Image">
                </c:when>
                <c:otherwise>
                  <!-- 이미지가 없을 경우 아무것도 표시하지 않습니다. -->
                </c:otherwise>
              </c:choose>
            </td>
            <td>${r.r_content}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>


  			
  			
  			
  			
<!-- 구매후기 페이징 -->
<div class="row justify-content-center">
    <div class="col-auto">
        <nav aria-label="...">
            <ul class="pagination pagination-sm">
                <c:choose>
                   
                    <c:when test="${reviewCurPage != 1}">
                        <li class="page-item">
                            <a class="page-link" href="detail.product?reviewPage=${reviewCurPage - 1}&qnaPage=${qnaCurPage}&p_no=${product.p_no}" id="snsL">&lt;</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a>
                        </li>
                    </c:otherwise>
                </c:choose>

              
                <c:choose>
                    <c:when test="${reviewCurPage != reviewPageCount}">
                        <li class="page-item">
                            <a class="page-link" href="detail.product?reviewPage=${reviewCurPage + 1}&qnaPage=${qnaCurPage}&p_no=${product.p_no}" id="snsR">&gt;</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&gt;</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>
</div>  			
  			
  			
  			
  			
  			
  			
  			
  			
  				



<!-- QnA 등록 -->
<div class="row justify-content-between mt-5">
    <div class="col-5 mb-3">
        <h2>Q & A</h2>
    </div>
    <div class="col-1">
    <c:if test="${not empty loginMember || not empty LoginMemberNaver || not empty kakaoInfo  }">
        <button type="button" class="btn btn-danger" id="toggleFormBtn">
            상품 문의
        </button>
     </c:if>
    </div>
</div>

<div id="qnaForm" style="display: none;">
	<form action="regQnaDo" method="post">
        <div class="form-group">
            <label for="title">제 목</label>
            <input type="text" class="form-control" id="title" name="q_title">
        </div>
        <div class="form-group">
            <label for="content">내 용</label>
            <textarea class="form-control" id="content" rows="4" name="q_content"></textarea>
            <input type="hidden" name="p_no" value="${product.p_no}">
        </div>
        <button type="submit" class="btn btn-primary" id="submitQuestion">확인</button>
        <button type="button" class="btn btn-secondary" id="cancelQuestion">취소</button>
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
                    <th scope="col">몰</th>
                    <th scope="col">날짜</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="q" items="${qnas}">
                    <!-- 클릭 가능한 행. 클릭 시 아래의 행을 펼치거나 접습니다. -->
                    <tr class="clickable-row" data-toggle="collapse" data-target="#row${q.q_no}-content">
                        <td>${q.q_id}</td>
                        <td>${q.q_title}</td>
                        <td>${q.q_product}</td>
                        <td>
                            <fmt:formatDate value="${q.q_date}" type="date" dateStyle="short"/>
                        </td>
                    </tr>
                    <!-- 펼쳐지는 행. 해당 게시글의 내용을 표시합니다. -->
                    <tr id="row${q.q_no}-content" class="collapse">
                        <td colspan="4">${q.q_content}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>









<!-- QnA 페이징 -->
<div class="row justify-content-center">
    <div class="col-auto">
        <nav aria-label="...">
            <ul class="pagination pagination-sm">
                    
                <c:choose>
                    <c:when test="${qnaCurPage != 1}">
                        <li class="page-item">
                            <a class="page-link" href="detail.product?reviewPage=${reviewCurPage}&qnaPage=${qnaCurPage - 1}&p_no=${product.p_no}" id="snsL">&lt;</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                
                <c:choose>
                    <c:when test="${qnaCurPage != qnaPageCount}">
                        <li class="page-item">
                            <a class="page-link" href="detail.product?reviewPage=${reviewCurPage}&qnaPage=${qnaCurPage + 1}&p_no=${product.p_no}" id="snsR">&gt;</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&gt;</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>
</div>







              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


 


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">후기 작성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <!-- 리뷰 작성 양식  -->
         <form action="regReviewDo" method="post" enctype="multipart/form-data">
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
                	<td>
                		<input type="file" name="file"> <br>
                	</td>
                </tr> 
              <%--   <tr>
                  <td><input type="hidden" class="form-control-file"
                    name="r_id" value="${account.id }"></td>
                </tr> --%>
              </tbody>
            </table>
          </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button class="btn btn-primary">작성</button>
      </div>
        </form>
      </div>
    </div>
  </div>
</div>

    


   









<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/detail.css"/>


</body>
</html>