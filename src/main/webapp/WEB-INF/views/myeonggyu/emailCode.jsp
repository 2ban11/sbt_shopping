<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/myeonggyu/find_pw.js" ></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/myeonggyu/emailCode.css" >
</head>
<body>
<div class="pwf-content pwf-container pwf-margin-top">
	
    <div class="w3-container w3-card-4 w3-auto" style="width: 382px; height: 456.3px;">
        <div class="findPw">
            <h3>비밀번호 찾기</h3>
        </div>
        <div>
            <p>
                <label>이메일</label>
                <input class="emailForPw" type="text" id="a_email" name="a_email" placeholder="회원가입한 이메일주소를 입력하세요">
            </p>
            <p id="emailWarning" style="color: red;"></p>
            <p class="EMailNUm">
                <button type="button" id="findBtn" class="sendMailNum">인증 번호 받기</button>
            </p>
        </div>
        <div id="verificationCodeContainer" style="display: none;">
            <p>
                <label>인증 번호</label>
                <input type="text" id="verificationCode" placeholder="인증 번호를 입력하세요">
            </p>
            <p>
                <button type="button" id="verifyCodeBtn">인증 번호 확인</button>
            </p>
        </div>
    </div>
</div>
</body>
</html>