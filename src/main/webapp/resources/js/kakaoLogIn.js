 Kakao.init('e57e76752dce19149944038091a5e349');
    var isKakaoLoggedIn = false; // 카카오 로그인 성공 여부를 저장하는 변수
    var loggedInUser = {
    		  userEmail: "",
    		  kakaoUserId: ""
    		};
    $("#kakao-login-btn").on("click", function () {
      //1. 로그인 시도
      Kakao.Auth.login({
        success: function (authObj) {
          isKakaoLoggedIn = true; // 카카오 로그인 성공 시 변수를 true로 설정

          //2. 로그인 성공시, API 호출
          Kakao.API.request({
            url: '/v2/user/me',
            data: { property_keys: ['kakao_account.email', 'kakao_account.profile.nickname'] },
            success: function (res) {
             console.log(authObj);
 			var token = authObj.access_token;
              // 페이지 이동
			console.log(authObj)
			console.log(res)
			
			console.log(res.kakao_account.email)
			saveKakaoUserData(res.kakao_account.email, res.kakao_account.profile.nickname);
			/*$.ajax({
				url : "https://kapi.kakao.com/v1/user/unlink",
				method : "POST",
				beforeSend: function (xhr) {
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            xhr.setRequestHeader("Authorization","Bearer " + authObj.access_token);

        },
			success : function(res){
					console.log(res)
			}
			})*/
			
<<<<<<< HEAD
           window.location.href = 'http://localhost/shopping/loginSuccess.go?type=kakao';
=======
           // window.location.href = 'http://localhost/shopping/loginSuccess.go?type=kakao';
>>>>>>> 12fecef (8/17 myeonggyu 커밋)
            },
            fail: function (error) {
              // 실패 처리
            }
          });

          //console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function (err) {
          alert(JSON.stringify(err));
        }
      });
    });


 function logoutKakao() {
        // 카카오 로그아웃 API 호출
        var kakaoLogoutURL = 'https://kauth.kakao.com/oauth/logout?client_id=e57e76752dce19149944038091a5e349&logout_redirect_uri=http://localhost/shopping/login.go';
        window.location.href = kakaoLogoutURL;
}
    


 // 서버로 사용자 정보 전송하는 함수
    function saveKakaoUserData(userEmail, nickName) {
	 
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
    }