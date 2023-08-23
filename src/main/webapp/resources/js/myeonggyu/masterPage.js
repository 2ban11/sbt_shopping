$(document).ready(function() {
    checkLoginAndConfigureUI();
});

function checkLoginAndConfigureUI() {
    $.ajax({
        type: "GET",
        url: "/check-login",
        success: function(response) {
            if (response.loggedIn) {
                if (response.isAdmin) {
                    // 마스터 계정으로 로그인한 경우에만 관리자 버튼을 보이게 함
                    $('#adminButton').show();
                } else {
                    $('#adminButton').hide();
                }
            } else {
                $('#adminButton').hide();
            }
        },
        error: function() {
            console.log("AJAX 요청 실패");
        }
    });
}