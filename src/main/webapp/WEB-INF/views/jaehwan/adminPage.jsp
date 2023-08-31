<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link rel="stylesheet" href="resources/css/jh/listPage.css" />
<link rel="stylesheet" href="resources/css/jh/regProduct.css" />
<link rel="stylesheet" href="resources/css/jh/chkColors.css" />
<link rel="stylesheet" href="resources/css/jh/calendar.css" />
<link rel="stylesheet" href="resources/css/jh/pagination.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.3.3/chart.min.js" integrity="sha512-fMPPLjF/Xr7Ga0679WgtqoSyfUoQgdt8IIxJymStR5zV3Fyb6B3u/8DcaZ6R6sXexk5Z64bCgo2TYyn760EdcQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
</head>

<body>
  <div class="listPage_contents" id="listPage_contents">
    <div class="detail_Search_Window" style="background-color: transparent;">
      <div id="searchDetail" style="display:block; background-color: transparent;">
        <div class="adminPage__select">
        <select class="p_small_category" id="categorySelect" style="display:block;">
          <option  value="">상품 종류</option>
          <option  value="기타">기타</option>
          <option  value="앰프">앰프</option>
          <option  value="이펙터">이펙터</option>
          <option  value="주변용품">주변용품</option>
        </select>
        <select class="sortOrder" id="sortSelect">
          <option  value="">최신순</option>
          <option  value="sort1">높은 가격순</option>
          <option  value="sort2">낮은 가격순</option>
        </select>
        </div>
    <div class="adminPage__tab" style="user-select: auto;">
		<div class="" style="user-select: auto;"><a href="adminPage">상품관리</a></div>
		<div class="" style="user-select: auto;"><a href="controlOrder">주문관리</a></div>
		<div class="" style="user-select: auto;"><a href="controlRefund">환불관리</a></div>
		<div class="" style="user-select: auto;"><a href="controlMargin">매상/매출</a></div>
	</div>
    </div>
        </div>
      <jsp:include page="${controlPage }"></jsp:include>
    <div class="pagination_window">
      <section>
        <div id="data-container"></div>
        <div id="pagination"></div>
      </section>
    </div>
  </div>
  
  
  
  
  
<!--  ---------------------------------------------------------------------------------------------  -->
  
  
  <div class="popup" id="regProductPopup">
			<div class="reg-window">
				<h1>상품등록</h1>
				<br>
				<form action="regProduct" method="post" enctype="multipart/form-data">
					<div class="int-area">
						<div style="display:flex;">
						<a>상품종류</a>&nbsp;<select class="p_big_category" id="categorySelect" name="p_big_category">
         						 <option  value="">상품 종류</option>
        					     <option  value="기타">기타</option>
        					     <option  value="앰프">앰프</option>
      						     <option  value="이펙터">이펙터</option>
      						     <option  value="주변용품">주변용품</option>
      					  </select>
						<a>상품타입</a><select class="p_middle_category" id="categorySelect" name="p_middle_category">
         						 <option  value="">상품 종류</option>
        					     <option  value="일렉기타">일렉기타</option>
        					     <option  value="어쿠스틱기타">어쿠스틱</option>
      						     <option  value="클래식기타">클래식</option>
      						     <option  value="베이스기타">베이스</option>
      						     <option  value="우쿠렐레기타">우쿠렐레</option>
      						     <option  value="기타앰프">기타앰프</option>
      						     <option  value="멀티이펙터">멀티이펙터</option>
      						     <option  value="기타줄">기타줄</option>
      						     <option  value="피크">피크</option>
      						     <option  value="케이블">케이블</option>
      						     <option  value="카포">카포</option>
      					  </select>
						</div>
						<div style="display:flex;">
						<a>기타종류</a> <select class="p_small_category" id="categorySelect" name="p_small_category" >
        				 	    <option  value="">종류 선택</option>
      			     		    <option  value="Stratocaster">Stratocaster</option>
        					    <option  value="Telecaster">Telecaster</option>
       						    <option  value="Les Paul">Les Paul</option>
      						    <option  value="Hollow">Hollow</option>
      						    <option  value="Superstrat">Superstrat</option>
     								   </select>
						<a>브랜드</a>&nbsp;&nbsp;&nbsp;&nbsp;<select class="companyBy" id="companySelect" name="p_maker">
        							  <option value="">회사 선택</option>
         							  <option value="Fender">Fender</option>
         							  <option value="Gibson">Gibson</option>
        							  <option value="Ibanez">Ibanez</option>
       							      <option value="Epiphone">Epiphone</option>
       							      <option value="Yamaha">Yamaha</option>
     						 		  </select>
						</div>
						<a>색상</a><div class="chkboxAll">
         <div class="chkboxAll" >
          <div class="chkbox1" style="background-color: transparent; justify-content: space-around; padding-top: 0px;">
            <input type="radio" id="cbtest1" name="p_color" value="red">
            <label for="cbtest1" class="cb1" id="cb1"></label>
            <input type="radio" id="cbtest2" name="p_color" value="orange">
            <label for="cbtest2" class="cb1" id="cb2"></label>
            <input type="radio" id="cbtest3" name="p_color" value="yellow">
            <label for="cbtest3" class="cb1" id="cb3"></label>
            <input type="radio" id="cbtest4" name="p_color" value="green">
            <label for="cbtest4" class="cb1" id="cb4"></label>
            <input type="radio" id="cbtest5" name="p_color" value="pink">
            <label for="cbtest5" class="cb1" id="cb5"></label>
          </div>
          <div class="chkbox2" style="background-color: transparent; justify-content: space-around;">
            <input type="radio" id="cbtest6" name="p_color" value="blue">
            <label for="cbtest6" class="cb1" id="cb6"></label>
            <input type="radio" id="cbtest7" name="p_color" value="purple">
            <label for="cbtest7" class="cb1" id="cb7"></label>
            <input type="radio" id="cbtest8" name="p_color" value="wood">
            <label for="cbtest8" class="cb1" id="cb8"></label>
            <input type="radio" id="cbtest9" name="p_color" value="white">
            <label for="cbtest9" class="cb1" id="cb9"></label>
            <input type="radio" id="cbtest10" name="p_color" value="black">
            <label for="cbtest10" class="cb1" id="cb10"></label>
          </div>
        </div>
        			<div class="int-area2">
      					<a>상품명</a><input type="text" name="p_name"
							 autocomplete="off" maxlength="100" required>
						 <div style="display:flex;">
						<a>원가</a><input type="text" name="p_cost"
							 autocomplete="off" maxlength="10" style="width:33%;" required>
						<a>정가</a><input type="text"  name="p_price"
						class="p_price"	 autocomplete="off" style="width:33%;">
						 </div>
						 <div style="display:flex;">
						<a>할인</a><input type="text" name="p_sale" style="width:33%;"
							 autocomplete="off" maxlength="10" required>
						<a>재고</a><input type="text" name="p_cnt" style="width:33%;"
							 autocomplete="off" maxlength="10" required>
						 </div>
						<a>사진등록</a><input type="file" name="img" accept="image/*"
							 autocomplete="off" required>
						<a>상세사진</a><input type="file" name="img2" accept="image/*"
							 autocomplete="off" required>
						<a>상품설명</a>
						<textarea rows="" cols="" name="p_content" maxlength="300" required></textarea>
        			</div>
						</div>
					</div>
					<div class="btn-area">
						<button class="confirm--btn" id="btn">등록</button>
					</div>
				</form>
				</div>
			</div>
<div class="dim-for-popup" id="dim-for-popup"></div>



<!-- -------------------------------------------------------------------------------------- -->



 <div class="popup" id="updateProductPopup">
			<div class="reg-window">
				<h1>상품수정</h1>
				<br>
				<form action="updateProduct" method="post" enctype="multipart/form-data">
					<div class="int-area">
						<div style="display:flex;">
						<a>상품종류</a>&nbsp;<select class="p_big_category" id="categorySelect" name="p_big_category">
         						 <option  value="">상품 종류</option>
        					     <option  value="기타">기타</option>
        					     <option  value="앰프">앰프</option>
      						     <option  value="이펙터">이펙터</option>
      						     <option  value="주변용품">주변용품</option>
      					  </select>
						<a>상품타입</a><select class="p_middle_category" id="categorySelect" name="p_middle_category">
         						 <option  value="">상품 종류</option>
        					     <option  value="일렉기타">일렉기타</option>
        					     <option  value="어쿠스틱">어쿠스틱</option>
      						     <option  value="클랙식">클래식</option>
      						     <option  value="베이스">베이스</option>
      						     <option  value="우쿠렐레">우쿠렐레</option>
      						     <option  value="멀티">멀티</option>
      						     <option  value="기타줄">기타줄</option>
      						     <option  value="피크">피크</option>
      						     <option  value="케이블">케이블</option>
      						     <option  value="카포">카포</option>
      					  </select>
						</div>
						<div style="display:flex;">
						<a>기타종류</a> <select class="p_small_category" id="categorySelect" name="p_small_category" >
        				 	    <option  value="">종류 선택</option>
      			     		    <option  value="Stratocaster">Stratocaster</option>
        					    <option  value="Telecaster">Telecaster</option>
       						    <option  value="Les Paul">Les Paul</option>
      						    <option  value="Hollow">Hollow</option>
      						    <option  value="Superstrat">Superstrat</option>
     								   </select>
						<a>브랜드</a>&nbsp;&nbsp;&nbsp;&nbsp;<select class="companyBy" id="companySelect" name="p_maker">
        							  <option value="">회사 선택</option>
         							  <option value="Fender">Fender</option>
         							  <option value="Gibson">Gibson</option>
        							  <option value="Ibanez">Ibanez</option>
       							      <option value="Epiphone">Epiphone</option>
       							      <option value="Yamaha">Yamaha</option>
     						 		  </select>
						</div>
						<a>색상</a><div class="chkboxAll">
         <div class="chkboxAll" >
          <div class="chkbox1" style="background-color: transparent; justify-content: space-around; padding-top: 0px;">
            <input type="radio" id="cbtest11" name="p_color" value="red">
            <label for="cbtest11" class="cb1" id="cb1"></label>
            <input type="radio" id="cbtest12" name="p_color" value="orange">
            <label for="cbtest12" class="cb1" id="cb2"></label>
            <input type="radio" id="cbtest13" name="p_color" value="yellow">
            <label for="cbtest13" class="cb1" id="cb3"></label>
            <input type="radio" id="cbtest14" name="p_color" value="green">
            <label for="cbtest14" class="cb1" id="cb4"></label>
            <input type="radio" id="cbtest15" name="p_color" value="pink">
            <label for="cbtest15" class="cb1" id="cb5"></label>
          </div>
          <div class="chkbox2" style="background-color: transparent; justify-content: space-around;">
            <input type="radio" id="cbtest16" name="p_color" value="blue">
            <label for="cbtest16" class="cb1" id="cb6"></label>
            <input type="radio" id="cbtest17" name="p_color" value="purple">
            <label for="cbtest17" class="cb1" id="cb7"></label>
            <input type="radio" id="cbtest18" name="p_color" value="wood">
            <label for="cbtest18" class="cb1" id="cb8"></label>
            <input type="radio" id="cbtest19" name="p_color" value="white">
            <label for="cbtest19" class="cb1" id="cb9"></label>
            <input type="radio" id="cbtest20" name="p_color" value="black">
            <label for="cbtest20" class="cb1" id="cb10"></label>
          </div>
        </div>
        			<div class="int-area2">
        						
      					<a>상품명</a><input type="text" name="p_name"
						 class="p_name"	 autocomplete="off">
      					<input type="hidden" name="p_no"
						 class="p_no" autocomplete="off">
						 <div style="display:flex;">
						<a>원가</a><input type="text" name="p_cost"
							 class="p_cost" autocomplete="off" maxlength="10" style="width:33%;" required>
						<a>정가</a><input type="text"  name="p_price"
						class="p_price"	 autocomplete="off" style="width:33%;">
						 </div>
						 <div style="display:flex;">
						<a>할인</a><input type="text"  name="p_sale"
						class="p_sale"	 autocomplete="off" style="width:32%;">
						<a>재고</a><input type="text"  name="p_cnt"
						class="p_cnt"	 autocomplete="off" style="width:32%;">
						 </div>
						<a>사진등록</a><input type="file" name="img" accept="image/*"
						class="p_img" autocomplete="off">
						<a>상품설명</a>
						<textarea rows="" cols="" class="p_content" name="p_content"></textarea>
        			</div>
						</div>
					</div>
					<div class="btn-area">
						<button class="confirm--btn">수정</button>
					</div>
				</form>
				</div>
			</div>
 <div class="dim-for-popup" id="dim-for-popup2"></div>

  <script>
    let jsonData = [];
    <c:forEach var="p" items="${products}">
      var item = {
    	p_no: '${p.p_no}',
        p_name: '${p.p_name}',
        p_color: '${p.p_color}',
        p_big_category: '${p.p_big_category}',
        p_middle_category: '${p.p_middle_category}',
        p_small_category: '${p.p_small_category}',
        p_maker: '${p.p_maker}',
        p_price: '${p.p_price}',
        p_sale : '${p.p_sale}',
        p_img1: '${p.p_img1}',
        p_img2: '${p.p_img2}',
        p_content: '${p.p_content}',
        p_cnt: '${p.p_cnt}',
        p_cost: '${p.p_cost}',
      };
      jsonData.push(item);
    </c:forEach>
    function paging() {
      	console.log('paging called ---------');
    	 let container = $('#pagination');
    	    container.pagination({
    	        dataSource: jsonData,
    	        pageSize: 10,
    	        callback: function (data, pagination) {
    	            var dataHtml = '<ul style="padding-left:0;">';
    	            $.each(data, function (index, item) {
    	                dataHtml += '<div class="listPage_item1">';
    	                dataHtml += '<div class="ul-div product-img">';
    	                dataHtml += '<img src="' + getProductImage(item.p_big_category, item.p_img1) + '" class="productImg">';
    	                dataHtml += '</div>';
    	                if (item.p_maker !== '') {
    	                    dataHtml += '<div class="ul-div product-logo"><img src="resources/img/MakerLogo/' + item.p_maker + '_Logo_White.png" class="LogoImg"></div>';
    	                }
    	                dataHtml += '<div class="ul-div p_no" style="display:none;">' + item.p_no + '</div>';
    	                dataHtml += '<div class="ul-div p_big_category" style="display:none;">' + item.p_big_category + '</div>';
    	                dataHtml += '<div class="ul-div p_middle_category" style="display:none;">' + item.p_middle_category + '</div>';
    	                dataHtml += '<div class="ul-div companyBy" style="display:none;">' + item.p_maker + '</div>';
    	                dataHtml += '<div class="ul-div productContent" style="display:none;">' + item.p_content + '</div>';
    	                dataHtml += '<div class="ul-div productCnt" style="display:none;">' + item.p_cnt + '</div>';
    	                dataHtml += '<div class="ul-div productColor">' + item.p_color + '</div>';
    	                dataHtml += '<div class="ul-div productSmallCategory">' + item.p_small_category + '</div>';
    	                dataHtml += '<div class="ul-div productTitle">' + item.p_name + '</div>';
    	                dataHtml += '<div class="ul-div p_cost" style="display:none;">' + item.p_cost + '</div>';
    	                dataHtml += '<div class="aaa">'
    	              	  dataHtml += '<div class="productPrice"';
    	              if (item.p_price !== item.p_sale) {
    	                  dataHtml += ' style="text-decoration: line-through; color: gray;"';
    	              }
    	              dataHtml += '>';
    	              dataHtml += new Intl.NumberFormat('ko-KR', {
    	                  style: 'currency',
    	                  currency: 'KRW'
    	              }).format(item.p_price);
    	              dataHtml += '</div>';

    	              if (item.p_price !== item.p_sale) {
    	                  dataHtml += '<div class="productSale"';
    	                  dataHtml += ' style="font-size: 16px;">';
    	                  dataHtml += new Intl.NumberFormat('ko-KR', {
    	                      style: 'currency',
    	                      currency: 'KRW'
    	                  }).format(item.p_sale);
    	                  dataHtml += '</div>';
    	              }
    	              dataHtml += '</div>'; // aaa div 끝
    	              dataHtml += '<div>'; 			              
    	              dataHtml += '<div class="productModify">';
    	              dataHtml += '<button class="update-popup--btn" title="수정하기" style="font-size: revert;line-height: normal;">수정</button>'
    	              dataHtml += '<button class="delete-popup--btn" title="삭제하기" style="font-size: revert;line-height: normal;"><a href="deleteProduct?p_no='+ item.p_no + '">삭제</a></button>'
    	              dataHtml += '</div>';
    	              
    	              // 할인율
    	              var priceDifference = item.p_price - item.p_sale;
    	              var pricePercentage = (priceDifference / item.p_price) * 100;
    	              dataHtml += '<div style="display:flex;">'; 
    	              if (priceDifference !== 0) {
    	              dataHtml += '<div class="productDifference" style="width:60px;">';
    	              dataHtml += pricePercentage.toFixed(0) + '%';
    	              dataHtml += '</div>';
    				} else {
    	                dataHtml += '<div class="productDifference" style="background:transparent">';
    	                dataHtml += '</div>';
    					}
    	                dataHtml += '</div>';
    	                dataHtml += '</div>'; // 그 디브 끝
    	                dataHtml += '</div>'; // 그 디브 끝
    	            });
    	              dataHtml += '<button class="reg-popup--btn" title="등록하기">등록</button>'
    	            $("#data-container").html(dataHtml);
    	        }
    	    });
	}
 // getProductImage 함수 정의
    function getProductImage(category, imgName) {
        var imgPath = 'resources/img/';
        switch (category) {
            case '기타':
                imgPath += 'Guitar/';
                break;
            case '앰프':
                imgPath += 'Amp/';
                break;
            case '이펙터':
                imgPath += 'Effector/';
                break;
            case '주변용품':
                imgPath += 'Accessory/';
                break;
            default:
                imgPath += 'default/'; // 기본 이미지 경로
                break;
        }
        return imgPath + imgName;
    }
$(function () {
    $("#searchDetail").change(updateResults);
    paging();
    
   
});

function updateResults() {
    const category = $("#categorySelect").val();
    const sortOrder = $("#sortSelect").val();

    console.log(category);
    console.log(sortOrder);
    
    
    const requestData = {
        "p_big_category": category,
        "sortOrder": sortOrder
    };

    $.ajax({
        url: "searchDetailForAdmin",
        type: "POST",
        dataType: 'json',
        data: requestData,
        success: function (response) {
        	jsonData = response;
        	paging();
          
        },
        error: function (error) {
            console.log(error);
        }
    });
}

</script>
<script type="text/javascript" src="resources/js/jh/calendar.js"></script>
<script type="text/javascript" src="resources/js/jh/updatePopup.js"></script>
</body>
</html>
