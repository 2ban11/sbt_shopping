<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
</head>
<body>
    <div class="w3-container">
        <h3>아이디 찾기</h3>
        <input id="a_p_no" placeholder="전화번호를 입력하세요">
        <button onclick="showId()">확인</button>
        <div id="IDget" style="display: none;">
    <p>
        <label>아이디</label>
        <input type="text" id="found_id" value="">
    </p>
	</div>
    </div>
    <script type="text/javascript" src="resources/js/myeonggyu/find_id.js"></script>
</body>
</html>