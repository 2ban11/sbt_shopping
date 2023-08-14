$(document).ready(function(){
	isNotElec();
});

function isNotElec() {
    
        // 현재 URL 가져오기

        // URL에 포함된 매개변수 값 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const middleCategory = urlParams.get("MC");
        const bigCategory = urlParams.get("BC");


        // 원하는 조건에 따라 스타일 변경
		console.log(urlParams);
		console.log(bigCategory);
		console.log(middleCategory);
		
        if (bigCategory === "Guitar" && middleCategory === "Elec") {
            $("#categorySelect").css("display", "block");
        } else {
            $("#categorySelect").css("display", "none");
        }

}