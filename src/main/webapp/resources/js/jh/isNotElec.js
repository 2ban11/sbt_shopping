$(document).ready(function(){
		isNotElec();
});

function addToCartModal(btn) {
		let c_id = $(btn).next().val();
        var c_product = $(btn).parent().find("[name='c_product']").val();
		console.log('---------')
		console.log(c_id);
		console.log(c_product);	
		console.log('---------')
		
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
            }
        });
}else{
	alert('로그인 해주세요!')
}
		
}
    function showModal(success) {
       //모달창 띄우기
	var modal = document.getElementById("jhModal");
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

function isNotElec() {
        // URL에 포함된 매개변수 값 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const middleCategory = urlParams.get("MC");
        const bigCategory = urlParams.get("BC");

        // 원하는 조건에 따라 스타일 변경
		console.log(urlParams);
		console.log(bigCategory);
		console.log(middleCategory);
		
        if (bigCategory === "기타" && middleCategory === "일렉기타") {
            $("#categorySelect").css("display", "block");
        } else {
            $("#categorySelect").css("display", "none");
        }

}

