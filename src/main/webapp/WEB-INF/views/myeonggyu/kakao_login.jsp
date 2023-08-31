<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
</head>
<body>
  <div class="kakaoBtn">
    <a id="kakao-login-btn" style="cursor: pointer;">
      <img id="k_login-img" src="resources/img/Login/icon_kakao3.png" />
     
      	 <span>카카오 로그인</span>  
      	</a>

  </div>
  <input type="hidden" id="user-email" name="user-email" value="" />
  <input type="hidden" id="kakao-user-id" name="kakao-user-id" value="" />
	
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript"src="resources/js/myeonggyu/kakaoLogIn.js"></script>
            
</body>
</html>
