<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "UaEIf33g3s0PC0nCawKU";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost/shopping/naver_login_callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String naverState = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + naverState;
    session.setAttribute("naverState", naverState);
 %>
  <a class="n_Login_box"href="<%=apiURL%>"><img id="n_login-img"src="resources/img/Login/icon_naver.png"/>
  <span>
  네이버 로그인
  </span>
  </a>
  </body>
</html>