<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
</head>
<body>

<head>
    <meta charset="UTF-8">
    <title>인증번호 확인 및 비밀번호 변경</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="resources/js/myeonggyu/find_pw.js"></script>
    <script type="text/javascript" src="resources/js/myeonggyu/change_pw.js"></script>
    <link rel="stylesheet" href="resources/css/myeonggyu/find_pw.css">
</head>
<body>
<div class="pwf-content pwf-container pwf-margin-top">
    <div class="w3-container w3-card-4 w3-auto" >
        <div id="findPw">
            <h3> 비밀번호 변경</h3>
        </div>
        <div class="changePW" >
            <p id="writePW">
                <label>새 비밀번호</label>
                <input type="password" id="a_password" name="a_password" placeholder="새로운 비밀번호를 입력하세요">
            </p>
            <p id="writePW_re">
                <label>새 비밀번호 확인</label>
                <input type="password" id="a_password_re" name="a_password_re" placeholder="새로운 비밀번호를 확인하세요">
            </p>
            <p>
                <button type="button" id="verifyAndResetBtn">확인 및 변경</button>
            </p>
        </div>
    </div>
</div>
</body>
</html>