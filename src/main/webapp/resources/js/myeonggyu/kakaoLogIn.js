 Kakao.init('e57e76752dce19149944038091a5e349');
var isKakaoLoggedIn = false; // 카카오 로그인 성공 여부를 저장하는 변수

var loggedInUser = {
    userEmail: "",
    kakaoUserId: ""
};

$("#kakao-login-btn").on("click", function () {
    Kakao.Auth.login({
        success: function (authObj) {
            isKakaoLoggedIn = true; // 카카오 로그인 성공 시 변수를 true로 설정
            Kakao.API.request({
                url: '/v2/user/me',
                data: { property_keys: ['kakao_account.email', 'kakao_account.profile.nickname'] },
                success: function (res) {
                    console.log(authObj);
                    var token = authObj.access_token;
                    console.log(authObj);
                    console.log(res);
                    console.log(res.kakao_account.email);
                    saveKakaoUserData(res.kakao_account.email, res.kakao_account.profile.nickname);
                    window.location.href = 'http://localhost/shopping';
                },
                fail: function (error) {
                    // 실패 처리
                }
            });
            var token = authObj.access_token;
        },
        fail: function (err) {
            alert(JSON.stringify(err));
        }
    });
});




 function saveKakaoUserData(userEmail, nickName){
    $.ajax({
        url: 'kakao_login_callback',
        method: 'POST',
        data: {
            userEmail: userEmail,
            kakaoUserId: nickName
        },
        success: function (response) {
            console.log(response)
        },
        error: function (xhr, status, error) {
            // 오류 처리
        }
    });
};


