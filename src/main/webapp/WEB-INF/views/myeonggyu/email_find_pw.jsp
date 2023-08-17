<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<head>
    <meta charset="UTF-8">
    <title>인증번호 확인 및 비밀번호 변경</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="resources/js/find_pw.js"></script>
</head>
<body>
<div class="pwf-content pwf-container pwf-margin-top">
    <div class="w3-container w3-card-4 w3-auto" style="width: 382px; height: 456.3px;">
        <div class="findPw">
            <h3> 비밀번호 변경</h3>
        </div>
        <div>
            <p>
                <label>새 비밀번호</label>
                <input type="password" id="newPassword" name="newPassword" placeholder="새로운 비밀번호를 입력하세요">
            </p>
            <p>
                <label>새 비밀번호 확인</label>
                <input type="password" id="newPassword_re" name="newPassword_re" placeholder="새로운 비밀번호를 확인하세요">
            </p>
            <p>
                <button type="button" id="verifyAndResetBtn">확인 및 변경</button>
            </p>
        </div>
    </div>
</div>
</body>
</html>