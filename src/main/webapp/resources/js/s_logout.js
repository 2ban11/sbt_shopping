
function logoutNaver() {
    var logoutURL = "https://nid.naver.com/nidlogin.logout";
    var newWindow = window.open(logoutURL, "_blank");

    // 세션 등 로그아웃 처리
    sessionStorage.clear();
    alert("네이버 로그아웃이 완료되었습니다.");

    // 0.5초 후에 팝업 창 닫기 시도
    setTimeout(function() {
        newWindow.close();
	window.location.href = "http://localhost/shopping/"
    }, 5); // 0.1초 후에 팝업 창 닫기 시도
}