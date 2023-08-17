<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css" >
body{
color: white;
}
</style>
</head>
<body>
<div class="login-wrap">
						<div class="page-header">
							<h1><strong>기존회원 로그인</strong></h1>
						</div>
						<div class="login">
							<form action="account.login" id="loginFrm" method="post" class="form-horizontal">
    <input type="hidden" id="visitorId" name="visitorId" value="">
    <fieldset>
        <div class="form-group">
            <div class="col-sm-12 control-label">
                <label id="username-lbl" for="a_id" class="required">아이디(이메일)<span class="star">&nbsp;*</span></label>
            </div>
            <div class="col-sm-12">
                <input type="text" name="a_id" id="a_id" class="required" required="" aria-required="true" autofocus="" style="width:414px;">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12 control-label">
                <label id="password-lbl" for="a_password" class="required">비밀번호<span class="star">&nbsp;*</span></label>
            </div>
            <div class="col-sm-12">
                <input type="password" name="a_password" id="a_password" class="required" maxlength="99" required="" aria-required="true" style="width:414px;">
            </div>
        </div>
									<div class="form-group">
										<div class="col-sm-12 btn-wrap">
											<button type="submit" class="btn btn-primary btn-lg btn-block" id="btn_login">로그인</button>
										</div>
									</div>

									<div class="other-links form-group">
										<div class="col-sm-12">
											<ul>
												<li><a href="/shopping/account.sendEmailCodePage" >비밀번호 찾기</a> </li>
												<li><span class="bars">|</span></li>
												<li><a href="/shopping/account.join.go">회원가입</a></li>
											</ul>
										</div>
									</div>
									<input type="hidden" name="return_url" value="">
									 <input type="hidden" name="token" id="token">
								</fieldset>
							</form>
						</div>

						<div class="snsLoginWrap" style="margin-top:30px">
							<div class="page-header">
								<h1><strong>간편로그인</strong></h1>
							</div>
					<div class="login">

				    <%@ include file="naver_login.jsp"  %>
    				<%@ include file="kakao_login.jsp"  %>
    
								</div>
							</div>
								
							<div class="docs-section">
								<p class="text-danger">개인정보 보호를 위해 공용 PC에서 사용 후 연결된 간편로그인 계정의 로그아웃 상태를 반드시 확인해주세요.</p>
							</div>
						</div>
</body>
</html>