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

</head>

<body>
  <div class="listPage_contents" id="listPage_contents">
    <div class="detail_Search_Window">
      <form id="searchDetail" action="searchDetail" method="post">
        <select class="pl_companyBy" id="companySelect" name="pl_companyName">
          <option value="">회사 선택</option>
          <option value="Fender">Fender</option>
          <option value="Gibson">Gibson</option>
          <option value="Ibanez">Ibanez</option>
          <option value="Epiphone">Epiphone</option>
          <option value="Yamaha">Yamaha</option>
        </select>
        
        <select class="pl_category" id="categorySelect" name="pl_category">
          <option  value="">종류 선택</option>
          <option  value="Stratocaster">Stratocaster</option>
          <option  value="Telecaster">Telecaster</option>
          <option  value="LesPaul">LesPaul</option>
          <option  value="Hollow">Hollow</option>
          <option  value="Superstrat">Superstrat</option>
        </select>
        <select class="sortOrder" id="sortSelect" name="pl_price">
          <option  value="">가격순</option>
          <option  value="sort1">높은 가격순</option>
          <option  value="sort2">낮은 가격순</option>
        </select>
        <div class="chkboxAll">
          <div class="chkbox1">
            <input type="checkbox" id="cbtest1" name="pl_color" value="red">
            <label for="cbtest1" class="cb1" id="cb1"></label>
            <input type="checkbox" id="cbtest2" name="pl_color" value="orange">
            <label for="cbtest2" class="cb1" id="cb2"></label>
            <input type="checkbox" id="cbtest3" name="pl_color" value="yellow">
            <label for="cbtest3" class="cb1" id="cb3"></label>
            <input type="checkbox" id="cbtest4" name="pl_color" value="green">
            <label for="cbtest4" class="cb1" id="cb4"></label>
            <input type="checkbox" id="cbtest5" name="pl_color" value="pink">
            <label for="cbtest5" class="cb1" id="cb5"></label>
          </div>
          <div class="chkbox2">
            <input type="checkbox" id="cbtest6" name="pl_color" value="blue">
            <label for="cbtest6" class="cb1" id="cb6"></label>
            <input type="checkbox" id="cbtest7" name="pl_color" value="purple">
            <label for="cbtest7" class="cb1" id="cb7"></label>
            <input type="checkbox" id="cbtest8" name="pl_color" value="wood">
            <label for="cbtest8" class="cb1" id="cb8"></label>
            <input type="checkbox" id="cbtest9" name="pl_color" value="white">
            <label for="cbtest9" class="cb1" id="cb9"></label>
            <input type="checkbox" id="cbtest10" name="pl_color" value="black">
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
  

  <script>
    var jsonData = [];
    <c:forEach var="p" items="${products}">
      var item = {
        name: '${p.pl_name}',
        color: '${p.pl_color}',
        category: '${p.pl_category}',
        companyName: '${p.pl_companyName}',
        price: '${p.pl_price}',
        imgUrl: '${p.pl_productImg}',
        companyLogo: '${p.pl_companyLogo}'
      };
      jsonData.push(item);
    </c:forEach>
  </script>

  <script>
$(function () {
    $("#searchDetail").change(updateResults);

    let container = $('#pagination');
    container.pagination({
        dataSource: jsonData,
        pageSize: 10,
        callback: function (data, pagination) {
            var dataHtml = '<ul>';
            $.each(data, function (index, item) {
                dataHtml += '<div class="listPage_item1">';
                dataHtml += '<div class="ul-div product-img"><img src="resources/img/' + item.imgUrl + '" class="productImg"></div>';
                dataHtml += '<div class="ul-div product-logo"><img src="resources/img/' + item.companyLogo + '" class="companyLogo"></div>';
                dataHtml += '<div class="ul-div companyName">[ ' + item.companyName + ' ]</div>';
                dataHtml += '<div class="ul-div productColor">' + item.color + '</div>';
                dataHtml += '<div class="ul-div productTitle">' + item.name + '</div>';
                dataHtml += '<div class="ul-div productPrice">' + new Intl.NumberFormat('ko-KR', {
                    style: 'currency',
                    currency: 'KRW'
                }).format(item.price) + '</div>';
                dataHtml += '<div class="ul-div productCartImg"><img src="resources/img/cart_icon.png" class="CartImg"></div>';
                dataHtml += '</div>';
            });
            dataHtml += '</ul>';
            $("#data-container").html(dataHtml);
        }
    });
});

function updateResults() {
	console.log('call updateResult~')
    const companyName = $("#companySelect").val();
    const category = $("#categorySelect").val();
    const colors = $("input[name='pl_color']:checked").map(function () {
        return $(this).val();
    }).get().join("!");
    const sortOrder = $("#sortSelect").val();

    console.log(companyName);
    console.log(category);
    console.log(sortOrder);
    
    
    const requestData = {
        "pl_companyName": companyName,
        "pl_category": category,
        "pl_color": colors,
        "sortOrder": sortOrder
    };

    $.ajax({
        url: "searchDetail",
        type: "POST",
        dataType: 'json',
        data: requestData,
        success: function (response) {
            var dataHtml = '<ul>';
            $.each(response, function (index, item) {
                dataHtml += '<div class="listPage_item1">';
                dataHtml += '<div class="ul-div product-img"><img src="resources/img/' + item.pl_productImg + '" class="productImg"></div>';
                dataHtml += '<div class="ul-div product-logo"><img src="resources/img/' + item.pl_companyLogo + '" class="companyLogo"></div>';
                dataHtml += '<div class="ul-div companyName">[ ' + item.pl_companyName + ' ]</div>';
                dataHtml += '<div class="ul-div productColor">' + item.pl_color + '</div>';
                dataHtml += '<div class="ul-div productTitle">' + item.pl_name + '</div>';
                dataHtml += '<div class="ul-div productPrice">' + new Intl.NumberFormat('ko-KR', {
                    style: 'currency',
                    currency: 'KRW'
                }).format(item.pl_price) + '</div>';
                dataHtml += '<div class="ul-div productCartImg"><img src="resources/img/cart_icon.png" class="CartImg"></div>';
                dataHtml += '</div>';
            });
            dataHtml += '</ul>';
            $("#data-container").html(dataHtml);
        },
        error: function (error) {
            console.log(error);
        }
    });
}
</script>
</body>
</html>
