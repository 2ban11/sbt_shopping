<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "UaEIf33g3s0PC0nCawKU";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "XJPThm8DJ2";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String naverState = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost/shopping/naver_login_callback", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + naverState;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    
 // 이전에 얻은 액세스 토큰
    String accessToken = "AAAAOGq1BYJPuj0mL5b7o3EsPeolnniOVojYKzZsNY40G64baiRRFZaz8rtoG2OrmXJaacfVnNDywOu5movROPML_s8";

    // 네이버 API 엔드포인트 URL
    String apiUrl = "https://openapi.naver.com/v1/nid/me";

    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
  </body>
</html>