function checkLoginAndRedirect() {
    $.ajax({
        type: "GET",
        url: "/check-login", // 서버의 로그인 체크 API 주소
        success: function(response) {
            if (response.loggedIn) {
                window.location.href = "/shopping/mypage.order"; // 로그인 상태이면 마이페이지로 이동
            } else {
                alert("로그인이 필요한 서비스입니다.");
            }
        },
        error: function() {
			alert("로그인이 필요한 서비스 입니다. 로그인 상태를 확인하세요.")
            console.log("AJAX 요청 실패");
        }
    });
}