<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
</head>
<body>
              <div class="button-login" align ="center" >
                <a id="kakao-login-btn" >
    <img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="83%" height ="50px" />
    </a>
            </div>
            
            <script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
            
            <script type='text/javascript'>
Kakao.init('e57e76752dce19149944038091a5e349');


$("#kakao-login-btn").on("click", function(){
    //1. 로그인 시도
    Kakao.Auth.login({
        success: function(authObj) {
         
          //2. 로그인 성공시, API 호출
    	Kakao.API.request({
  		url: '/v2/user/me',
 		 data: { property_keys: ['kakao_account.email'] }, // 요청 시에 scope를 설정하는 방법
  		success: function(res) {
    	// 성공적인 응답 처리
  			window.location.href = 'http://localhost/shopping/loginSuccess.go'
 	 	},
  		fail: function(error) {
    	// 실패 처리
  		}
		});
          console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
}) //


</script>
            
	// <%	
	//	 session.setAttribute("a_id", "5235268");
	//	response.sendRedirect("http://localhost/shopping/loginSuccess.go");
	//	%>           
            
<a href="http://developers.kakao.com/logout">카카오 로그아웃</a>
</body>
</html>