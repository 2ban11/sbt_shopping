<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>환영합니다!!</title>
</head>
<body>
    <h1>환영합니다!!</h1>
    <a href="http://developers.kakao.com/logout">카카오 로그아웃</a>
    <a href="#" onclick="logoutNaver()">네이버 로그아웃</a> 

    <script>
        function logoutNaver() {
            var accessToken = '${accessToken}'; // JSP에서 세션에 저장한 액세스 토큰을 가져옵니다.
            var url = 'https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=UaEIf33g3s0PC0nCawKU&client_secret=XJPThm8DJ2&access_token=' + accessToken;

            // AJAX 요청으로 네이버 로그아웃 API 호출
            var xhr = new XMLHttpRequest();
            xhr.open('GET', url, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // 로그아웃 처리가 성공하면 네이버 로그인 페이지로 리다이렉트합니다.
                        window.location.href = 'http://localhost/shopping/naver_login.go';
                    } else {
                        // 로그아웃 처리가 실패한 경우에 대한 처리
                        alert('네이버 로그아웃에 실패하였습니다.');
                    }
                }
            };
            xhr.send();
        }
    </script>
</body>
</html>