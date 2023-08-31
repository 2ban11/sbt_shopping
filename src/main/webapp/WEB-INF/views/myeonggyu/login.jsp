<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/myeonggyu/login.css">
  <script type="text/javascript"src="resources/js/myeonggyu/logIn.js"></script>
<style>
  .error {
    color: red;
  }
</style>
</head>
<body>
<div class="login-wrap">
	<div class="login-section basic-login">
    <div class="page-header">
        <h4><strong>기존회원 로그인</strong></h4>
    </div>
    <div class="login">
        <form action="account.login" id="loginFrm" method="post" class="form-horizontal">
            <div class="container">
               <div class="form-group">
    <label for="a_id" class="required">아이디(이메일)<span class="star">*</span></label>
    <input type="text" name="a_id" id="a_id" class="form-control" autofocus="">
    <p id="a_id_error" class="error" style="display: none;">아이디를 입력해주세요.</p>
</div>
<div class="form-group">
    <label for="a_password" class="required">비밀번호<span class="star">*</span></label>
    <input type="password" name="a_password" id="a_password" class="form-control" >
    <p id="a_password_error" class="error" style="display: none;">비밀번호를 입력해주세요.</p>
</div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block" id="btn_login">로그인</button>
                </div>
                <div class="form-group">
                    <ul class="list-inline">
                     <li class="list-inline-item"><a href="/shopping/account.phone.getID"  >아이디 찾기</a></li>
                        <li class="list-inline-item bars">|</li>
                        <li class="list-inline-item"><a href="/shopping/account.sendEmailCodePage"  >비밀번호 찾기</a></li>
                        <li class="list-inline-item bars">|</li>
                        <li class="list-inline-item"><a href="/shopping/account.join.go">회원가입</a></li>
                    </ul>
                </div>
                <div class="login-result">${result }</div>
            </div>
									<input type="hidden" name="return_url" value="">
									 <input type="hidden" name="token" id="token">
							</form>
						</div>

	</div>
						<div class="login-section snsLoginWrap" style="margin-top:30px">
							<div class="page-header">
								<h4><strong>간편로그인</strong></h4>
							</div>
							<div class="s_login">
					<div class="n_login">

				    <%@ include file="naver_login.jsp"  %>
				    </div>
				    <div class="k_login" >
    				<%@ include file="kakao_login.jsp"  %>
    
								</div>
							</div>
							</div>
								
							<div class="docs-section">
								<p class="text-danger">개인정보 보호를 위해 공용 PC에서 사용 후 연결된 간편로그인 계정의 로그아웃 상태를 반드시 확인해주세요.</p>
							</div>
						</div>
</body>
</html>