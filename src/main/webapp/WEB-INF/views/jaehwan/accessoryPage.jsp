<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />
<link rel="stylesheet" href="resources/css/kimoon/main-page.css" />
<link rel="stylesheet" href="resources/css/jh/listPage.css" />
<link rel="stylesheet" href="resources/css/jh/regProduct.css" />
<script type="text/javascript" src="resources/js/jh/isNotElec.js"></script>
</head>

<body>
  <div class="listPage_contents" id="listPage_contents">
    <div class="detail_Search_Window">
      <form id="searchDetail" action="searchDetail" method="post" style="justify-content:end;">
        <select class="companyBy" id="companySelect" name="p_maker"  style="margin:20px; display:none;">
          <option value="">회사 선택</option>
          <option value="Orange">Orange</option>
          <option value="Marshall">Marshall</option>
          <option value="Yamaha">Yamaha</option>
        </select>
        
        <select class="p_small_category" id="categorySelect" name="p_small_category">
          <option  value="">종류 선택</option>
          <option  value="Stratocaster">Stratocaster</option>
          <option  value="Telecaster">Telecaster</option>
          <option  value="Les Paul">Les Paul</option>
          <option  value="Hollow">Hollow</option>
          <option  value="Superstrat">Superstrat</option>
        </select>
        <select class="sortOrder" id="sortSelect" name="p_price" style="margin:20px;">
          <option  value="">최신순</option>
          <option  value="sort1">높은 가격순</option>
          <option  value="sort2">낮은 가격순</option>
        </select>
        <div class="chkboxAll" style="display:none;">
          <div class="chkbox1">
            <input type="checkbox" id="cbtest1" name="p_color" value="red">
            <label for="cbtest1" class="cb1" id="cb1"></label>
            <input type="checkbox" id="cbtest2" name="p_color" value="orange">
            <label for="cbtest2" class="cb1" id="cb2"></label>
            <input type="checkbox" id="cbtest3" name="p_color" value="yellow">
            <label for="cbtest3" class="cb1" id="cb3"></label>
            <input type="checkbox" id="cbtest4" name="p_color" value="green">
            <label for="cbtest4" class="cb1" id="cb4"></label>
            <input type="checkbox" id="cbtest5" name="p_color" value="pink">
            <label for="cbtest5" class="cb1" id="cb5"></label>
          </div>
          <div class="chkbox2">
            <input type="checkbox" id="cbtest6" name="p_color" value="blue">
            <label for="cbtest6" class="cb1" id="cb6"></label>
            <input type="checkbox" id="cbtest7" name="p_color" value="purple">
            <label for="cbtest7" class="cb1" id="cb7"></label>
            <input type="checkbox" id="cbtest8" name="p_color" value="wood">
            <label for="cbtest8" class="cb1" id="cb8"></label>
            <input type="checkbox" id="cbtest9" name="p_color" value="white">
            <label for="cbtest9" class="cb1" id="cb9"></label>
            <input type="checkbox" id="cbtest10" name="p_color" value="black">
            <label for="cbtest10" class="cb1" id="cb10"></label>
          </div>
        </div>
          </form>
    </div>
    <div class="pagination_window">
      <section>
        <div id="data-container"></div>
        <div id="pagination"></div>
      </section>
    </div>
  </div>
  <!-- 모달창 -->
	<div id="jhModal" class="main-cart__modal">
		<div class="main-cart__modal-wrapper">
			<div class="main-cart__modal-header">
				<div style="font-weight: bold"></div>
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
					<a href="mypage.cart"><button id="main-go-to-cart">장바구니로 이동하기</button></a>
				</div>
			</div>
		</div>
	</div>

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
      p_content: '${p.p_content}',
      p_cnt: '${p.p_cnt}',
    };
    jsonData.push(item);
  </c:forEach>
    function paging() {
      	console.log('paging called ---------');
    	 let container = $('#pagination');
    	    container.pagination({
    	        dataSource: jsonData,
    	        pageSize: 7,
    	        callback: function (data, pagination) {
    	            var dataHtml = '<ul>';
    	            $.each(data, function (index, item) {
    	                dataHtml += '<div class="listPage_item1">';
    	                dataHtml += '<div class="ul-div product-img"><img src="resources/img/Accessory/' + item.p_img1 + '" class="productImg"';
    	                dataHtml += ' onclick="location.href=\'detail.product?p_no=' + item.p_no + '\'" /></div>';
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
    	                dataHtml += '<div class="ul-div productTitle" onclick="location.href=\'detail.product?p_no=' + item.p_no + '\'">' + item.p_name + '</div>';
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
      	              
      	              dataHtml += '<div class="DifferAndCart">'; 			              
      	              
      	              // 할인율
      	              var priceDifference = item.p_price - item.p_sale;
      	              var pricePercentage = (priceDifference / item.p_price) * 100;
      	              if (priceDifference !== 0) {
      	              dataHtml += '<div class="productDifference">';
      	              dataHtml += pricePercentage.toFixed(0) + '%';
      				} else {
      					}
      	                dataHtml += '</div>';
      	                
      	                
      	              if(item.p_cnt != 0){
       				dataHtml += '<span>';
      	            dataHtml += '<button class="fa-solid fa-cart-shopping intoTheCart--btn"';
      	            dataHtml += 'name="c_product" value="' + item.p_no + '">&nbsp;</button>';
      	            			}

      	            dataHtml += '<input type="hidden" name="c_id" value="${sessionScope.loginMember.a_id}">';
					dataHtml += '</span>';
  					
      	                dataHtml += '</div>'; // 그 디브 끝
      	                dataHtml += '</div>'; // 그 디브 끝
      	            });
    	            dataHtml += '</ul>';
    	            $("#data-container").html(dataHtml);
    	        }
    	    });
	}
$(function () {
    $("#searchDetail").change(updateResults);
    paging();
   
});

function updateResults() {
    const companyName = $("#companySelect").val();
    const category = $("#categorySelect").val();
    const colors = $("input[name='p_color']:checked").map(function () {
        return $(this).val();
    }).get().join("!");	
    const sortOrder = $("#sortSelect").val();

    console.log(companyName);
    console.log(category);
    console.log(sortOrder);
    
    
    const requestData = {
        "p_maker": companyName,
        "p_small_category": category,
        "p_color": colors,
        "sortOrder": sortOrder
    };

    $.ajax({
        url: "searchDetail",
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

$(document).on("click",".intoTheCart--btn",function(e){
	// id, pno, cnt
	addToCartModal(e.currentTarget);
	let checkLogin = $('input[name=c_id]').val().length;
	if(checkLogin != 0){
		showModal();
	}
	
	
});

</script>
</body>
</html>
