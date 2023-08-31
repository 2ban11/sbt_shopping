function addToCartModal() {
	$(".btn.btn-warning.btn-lg.btn-block").off("click");
	$(".btn.btn-warning.btn-lg.btn-block").click(function(e) {
		let ok = confirm('장바구니에 담으시겠습니까');
		if (ok) {
			
        e.preventDefault();

		let c_id = $(this).next().val();
		console.log(c_id);
        var c_product = $(this).closest("form").find("[name='p_no']").val();
        console.log(c_product);
			
		if(c_id !== ''){
			
		
        $.ajax({
            type: "GET",
            url: "do.insert.cart",
            data: {
                c_id: c_id,
                c_product: c_product
            },
            success: function(response) {
				console.log('success')
                showModal(response === "success");
            },
            error: function() {
				console.log("error")
                showModal(false);
            }
        });
}else{
	alert('로그인 해주세요!')
}
		
		}
    });

    function showModal(success) {
       //모달창 띄우기
	var modal = document.getElementById("mainModal");
	var close = document.getElementsByClassName("main-cart__modal--close")[0];
    modal.style.display = "block";
	
	// 창 닫기
	close.addEventListener("click", function() {
    	modal.style.display = "none";
	});

	// 계속 쇼핑하기 버튼
	var continueShoppingBtn = document.getElementById("main-continue-shopping");
	continueShoppingBtn.addEventListener("click", function() {
   		modal.style.display = "none";
	});

	// 장바구니로 이동하기 버튼
	var goToCartBtn = document.getElementById("main-go-to-cart");
	goToCartBtn.addEventListener("click", function() {
    	// 장바구니 페이지로 이동하는 코드 추가하기
	});
    }

	

}

$(document).ready(function(){
	addToCartModal();
});