<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
    // 세션에 저장된 액세스 토큰을 가져옵니다.
    String accessToken = (String) session.getAttribute("accessToken");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>환영합니다!!</title>
      <script
      src="https://code.jquery.com/jquery-3.7.0.js"
      integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
      crossorigin="anonymous"
    ></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
      <script type="text/javascript" src="resources/js/kakaoLogIn.js"></script>
      <script type="text/javascript"src="resources/js/s_logout.js"></script>
</head>
<body>
    <h1>환영합니다!!</h1>
    
    	<a href="/shopping/account.logout"><button>로그아웃</button></a>
        
    
    <c:if test='${param.type eq "kakao"}'>
     <a href="#" id="kakao-logout-btn" onclick="logoutKakao()">카카오 로그아웃</a>
    </c:if>
    <c:if test='${param.type eq "naver"}'>
    <a href="#" onclick="logoutNaver()">네이버 로그아웃</a> 
    </c:if>

    
</body>
<script type="text/javascript">


</script>
</html>