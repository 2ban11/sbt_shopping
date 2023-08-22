function showAdminButton() {
    var loggedInUserId = "master"; // 로그인한 아이디를 설정하세요.
    var buttonContainer = $("#master-button-container");
    
    if (loggedInUserId === "master") {
        var adminButton = buttonContainer.find(".admin-button");
        adminButton.show();
    }
}