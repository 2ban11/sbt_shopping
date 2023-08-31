$(function () {
	
 $(".update-popup--btn").click(function () {
	
		console.log("sdfsdf");
	
  		let productModify = $(this).closest(".productModify");
        let productItem = productModify.closest(".listPage_item1");
      

 		let p_big_category = productItem.find(".p_big_category").text().trim();
        let p_middle_category = productItem.find(".p_middle_category").text().trim();
        let p_small_category = productItem.find(".productSmallCategory").text().trim();
        let p_maker = productItem.find(".companyBy").text().trim();
        let p_color = productItem.find(".productColor").text().trim();
        let p_name = productItem.find(".productTitle").text().trim();
        let p_price = productItem.find(".productPrice").text().trim();
        let p_sale = productItem.find(".productSale").text().trim();
        let p_cnt = productItem.find(".productCnt").text().trim();
        let p_content = productItem.find(".productContent").text().trim();
        let p_cost = productItem.find(".p_cost").text().trim();
        let p_no = productItem.find(".p_no").text().trim();
		
		var body = document.body;
		body.style.overflow = "hidden";


		console.log(p_cost);
		console.log(p_big_category);
		console.log(p_middle_category);   
		console.log(p_small_category);     
		console.log(p_maker);
		console.log(p_color);
		console.log(p_name);
		console.log(p_price);
		console.log(p_sale);
		console.log(p_cnt); 
		console.log(p_content); 
		console.log(p_no); 
		
		openPopup2();

        $("#updateProductPopup .p_big_category").val(p_big_category);
        $("#updateProductPopup .p_no").val(p_no);
        $("#updateProductPopup .p_middle_category").val(p_middle_category);
        $("#updateProductPopup .p_small_category").val(p_small_category);
        $("#updateProductPopup .companyBy").val(p_maker);
        $("#updateProductPopup .chkboxAll").val(p_color);
        $("#updateProductPopup .p_name").val(p_name);
        $("#updateProductPopup .p_price").val(p_price);
        $("#updateProductPopup .p_sale").val(p_sale);
        $("#updateProductPopup .p_cnt").val(p_cnt);
        $("#updateProductPopup .p_content").val(p_content);
        $("#updateProductPopup .p_cost").val(p_cost);
        $("#updateProductPopup .p_color").val(p_color);

    });
});

// 팝업 열기
$(function () {
    $(".reg-popup--btn").click(function () {
	openPopup();
	var body = document.body;
	body.style.overflow = "hidden";
	    });
});

function openPopup() {
  let popup = document.getElementById("regProductPopup");
  let dim = document.getElementById("dim-for-popup");
  popup.style.zIndex = "100";
  dim.style.zIndex = "99";
 
}
function openPopup2() {
  let popup2 = document.getElementById("updateProductPopup");
  let dim2 = document.getElementById("dim-for-popup2");
  popup2.style.zIndex = "100";
  dim2.style.zIndex = "99";
 
}

// 팝업 닫기
function closePopup() {
  let popup = document.getElementById("regProductPopup");
  let dim = document.getElementById("dim-for-popup");
  popup.style.display = "none";
  dim.style.display = "none";
	var body = document.body;
	body.style.overflow = "auto";
	
	loadPopup()
}

function closePopup2(){
  let popup2 = document.getElementById("updateProductPopup");
  let dim2 = document.getElementById("dim-for-popup2");
  popup2.style.display = "none";
  dim2.style.display = "none";
	var body = document.body;
	body.style.overflow = "auto";
	
	loadPopup()
}

function loadPopup() {
  let popup = document.getElementById("regProductPopup");
  let popup2 = document.getElementById("updateProductPopup");
  let dim = document.getElementById("dim-for-popup");
  let dim2 = document.getElementById("dim-for-popup2");
  popup.addEventListener("click", openPopup);
  popup2.addEventListener("click", openPopup2);
  dim.addEventListener("click", closePopup);
  dim2.addEventListener("click", closePopup2);
  }

    window.addEventListener("load", loadPopup);

