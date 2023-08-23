<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jh/listPage.css" />
<link rel="stylesheet" href="resources/css/jh/chkColors.css" />
<link rel="stylesheet" href="resources/css/jh/regProduct.css" />
<script type="text/javascript" src="resources/js/jh/isNotElec.js"></script>
</head>
<body>
<div class="popup" id="regProductPopup">
			<div class="reg-window">
				<h1>상품등록</h1>
				<br>
				<br>
				<form action="regProduct" method="post" enctype="multipart/form-data">
					<div class="int-area">
						<div style="display:flex;">
						<a>상품종류</a>&nbsp;<select class="p_small_category" id="categorySelect" name="p_big_category">
         						 <option  value="">상품 종류</option>
        					     <option  value="기타">기타</option>
        					     <option  value="앰프">앰프</option>
      						     <option  value="이펙터">이펙터</option>
      						     <option  value="주변용품">주변용품</option>
      					  </select>
						<a>상품타입</a><select class="p_middle_category" id="categorySelect" name="p_middle_category">
         						 <option  value="">상품 종류</option>
        					     <option  value="Elec">일렉기타</option>
        					     <option  value="Acoustic">어쿠스틱</option>
      						     <option  value="Classic">클래식</option>
      						     <option  value="Bass">베이스</option>
      						     <option  value="Ukulele">우쿠렐레</option>
      						     <option  value="Multi">멀티</option>
      						     <option  value="String">기타줄</option>
      						     <option  value="Pick">피크</option>
      						     <option  value="Cable">케이블</option>
      						     <option  value="Capo">카포</option>
      					  </select>
						</div>
						<br>
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
						<br>
						<a>색상</a><div class="chkboxAll">
         <div class="chkboxAll" >
          <div class="chkbox1" style="background-color: transparent; justify-content: space-around;">
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
          <div class="chkbox2" style="background-color: transparent; justify-content: space-around;">
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
        <br>
        			<div class="int-area2">
      					<a>상품명</a><input type="text" name="p_name"
							 autocomplete="off" maxlength="100" required>
						<a>정가</a><input type="text" name="p_price"
							 autocomplete="off" maxlength="10" required>
						<a>판매가</a><input type="text" name="p_sale"
							 autocomplete="off" maxlength="10" required>
						<a>재고수량</a><input type="text" name="p_cnt"
							 autocomplete="off" maxlength="10" required>
						<a>사진등록</a><input type="file" name="img" accept="image/*"
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
				<br>
				<form action="updateProduct" method="post" enctype="multipart/form-data">
					<div class="int-area">
						<div style="display:flex;">
						<a>상품종류</a>&nbsp;<select class="p_small_category" id="categorySelect" name="p_big_category">
         						 <option  value="">상품 종류</option>
        					     <option  value="Guitar">기타</option>
        					     <option  value="Amp">앰프</option>
      						     <option  value="Effector">이펙터</option>
      						     <option  value="Accessory">주변용품</option>
      					  </select>
						<a>상품타입</a><select class="p_middle_category" id="categorySelect" name="p_middle_category">
         						 <option  value="">상품 종류</option>
        					     <option  value="Elec">일렉기타</option>
        					     <option  value="Acoustic">어쿠스틱</option>
      						     <option  value="Classic">클래식</option>
      						     <option  value="Bass">베이스</option>
      						     <option  value="Ukulele">우쿠렐레</option>
      						     <option  value="Multi">멀티</option>
      						     <option  value="String">기타줄</option>
      						     <option  value="Pick">피크</option>
      						     <option  value="Cable">케이블</option>
      						     <option  value="Capo">카포</option>
      					  </select>
						</div>
						<br>
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
						<br>
						<a>색상</a><div class="chkboxAll">
         <div class="chkboxAll" >
          <div class="chkbox1" style="background-color: transparent; justify-content: space-around;">
            <input type="checkbox" id="cbtest11" name="p_color" value="red">
            <label for="cbtest11" class="cb1" id="cb1"></label>
            <input type="checkbox" id="cbtest12" name="p_color" value="orange">
            <label for="cbtest12" class="cb1" id="cb2"></label>
            <input type="checkbox" id="cbtest13" name="p_color" value="yellow">
            <label for="cbtest13" class="cb1" id="cb3"></label>
            <input type="checkbox" id="cbtest14" name="p_color" value="green">
            <label for="cbtest14" class="cb1" id="cb4"></label>
            <input type="checkbox" id="cbtest15" name="p_color" value="pink">
            <label for="cbtest15" class="cb1" id="cb5"></label>
          </div>
          <div class="chkbox2" style="background-color: transparent; justify-content: space-around;">
            <input type="checkbox" id="cbtest16" name="p_color" value="blue">
            <label for="cbtest16" class="cb1" id="cb6"></label>
            <input type="checkbox" id="cbtest17" name="p_color" value="purple">
            <label for="cbtest17" class="cb1" id="cb7"></label>
            <input type="checkbox" id="cbtest18" name="p_color" value="wood">
            <label for="cbtest18" class="cb1" id="cb8"></label>
            <input type="checkbox" id="cbtest19" name="p_color" value="white">
            <label for="cbtest19" class="cb1" id="cb9"></label>
            <input type="checkbox" id="cbtest20" name="p_color" value="black">
            <label for="cbtest20" class="cb1" id="cb10"></label>
          </div>
        </div>
        <br>
        			<div class="int-area2">
        						
      					<a>상품명</a><input type="text" value="" name="p_name"
							 autocomplete="off">
						<a>정가</a><input type="text" name="p_price"
							 autocomplete="off">
						<a>판매가</a><input type="text" name="p_sale"
							 autocomplete="off">
						<a>재고수량</a><input type="text" name="p_cnt"
							 autocomplete="off">
						<a>사진등록</a><input type="file" name="img" accept="image/*"
							 autocomplete="off">
						<a>상품설명</a>
						<textarea rows="" cols="" name="p_content"></textarea>
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
        p_small_category: '${p.p_small_category}',
        p_maker: '${p.p_maker}',
        p_price: '${p.p_price}',
        p_sale : '${p.p_sale}',
        p_img1: '${p.p_img1}',
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
    	            var dataHtml = '<ul>';
    	            $.each(data, function (index, item) {
    	                dataHtml += '<div class="listPage_item1">';
    	                dataHtml += '<div class="ul-div product-img"><img src="resources/img/Guitar/' + item.p_img1 + '" class="productImg"></div>';
    	                if (item.p_maker !== '') {
    	                    dataHtml += '<div class="ul-div product-logo"><img src="resources/img/MakerLogo/' + item.p_maker + '_Logo_White.png" class="LogoImg"></div>';
    	                }
    	                dataHtml += '<div class="ul-div productColor">' + item.p_color + '</div>';
    	                dataHtml += '<div class="ul-div productSmallCategory">' + item.p_small_category + '</div>';
    	                dataHtml += '<div class="ul-div productTitle">' + item.p_name + '</div>';
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
    	                  dataHtml += ' style="font-size: 20px;">';
    	                  dataHtml += new Intl.NumberFormat('ko-KR', {
    	                      style: 'currency',
    	                      currency: 'KRW'
    	                  }).format(item.p_sale);
    	                  dataHtml += '</div>';
    	              }
    	              dataHtml += '</div>'; // aaa div 끝
    	              
    	              dataHtml += '<div>'; 			              
    	              dataHtml += '<div class="productModify">';
    	              dataHtml += '<button class="reg-popup--btn" title="등록하기"><a href="#regProductPopup">등록</a></button>'
    	              dataHtml += '<button class="update-popup--btn" title="수정하기"><a href="#updateProductPopup">수정</a></button>'
    	              dataHtml += '<button class="delete-popup--btn" title="삭제하기"><a href="deleteProduct?p_no='+ item.p_no + '">삭제</a></button>'
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
    	                dataHtml += '<button class="fa-solid fa-cart-shopping intoTheCart--btn"></button>';
    	                dataHtml += '</div>';
    	                dataHtml += '</div>'; // 그 디브 끝
    	                dataHtml += '</div>'; // 그 디브 끝
    	            });
    	                
    	            $("#data-container").html(dataHtml);
    	        }
    	    });
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
<script type="text/javascript" src="resources/js/jh/updatePopup.js"></script>
<script type="text/javascript" src="resources/js/jh/popup.js"></script>
</body>
</html>