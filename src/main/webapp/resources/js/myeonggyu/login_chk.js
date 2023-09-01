function checkLoginAndRedirect() {
    $.ajax({
        type: "GET",
        url: "/shopping/check-login", // 서버의 로그인 체크 API 주소
        success: function(response) {
            if (response.loggedIn) {
                window.location.href = "/shopping/mypage.order"; // 로그인한 경우 마이페이지로 이동
            } else {
                alert("로그인이 필요한 서비스입니다");
					return false;
            }
        },
        error: function(xhr) {
            if (xhr.status !== 200) {
                // 로그인 실패 등의 오류
                console.log("AJAX 요청 실패");
 		alert("로그인이 필요한 서비스입니다");
            }
        }
    });
}