<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/myeonggyu/account.js" ></script>

<link rel="stylesheet" href="resources/css/myeonggyu/join.css">
</head>
<body>
	<br>
	<div class="join">
	<form action="/shopping/account.join" method="post" enctype="multipart/form-data" 
	class="joinForm" >
		<div class="registration" style="width:100%">
			<fieldset>
				<legend><span>회원가입</span></legend>
				<div class="form-inline form-group">
					<label for="a_id" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="a_id" name="a_id" placeholder="아이디를 입력하세요" style="width:170px;">
						<span style="color:#A4A4A4">@</span>
						<input type="text" class="form-control" id="a_email2" name="a_email2" style="width:150px;">
						<select name="a_email3" id="a_email3" class="form-control inputbox" style="">
							<option value="" selected="">선택</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="korea.com">korea.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="direct">직접입력</option>
						</select>
						<button type="button" class="btn btn-default" id="btn_id_chk">중복확인</button>
						<!-- 아이디 중복 확인 버튼 -->
						<input type="hidden" id="id_chk" name="id_chk" value="">
					</div>
				</div>
				<div class="form-group">
					<label for="a_password" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="a_password" name="a_password" placeholder="비밀번호를 입력하세요" aria-describedby="passwordHelpBlock">
					</div>
					<span id="passwordHelpBlock" class="text-muted-text-left">영문소문자, 숫자, 특수문자를 포함하여 8자이상 16이하로 사용이 가능합니다.<br/>(@는 포함하실수 없습니다.)</span>
				</div>
				<div class="form-group">
					<label for="a_password_re" class="col-sm-2 control-label">비밀번호확인</label>
					<div class="col-sm-4 ">
						<input type="password" class="form-control" id="a_password_re" name="a_password_re" placeholder="비밀번호확인을 입력하세요" aria-describedby="passwordReHelpBlock" >
					</div>
					<span id="passwordReHelpBlock" class="help-block text-left"></span>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="a_name" name="a_name" placeholder="이름을 입력하세요" aria-describedby="nameReHelpBlock" maxlength="10"  style="width:200px;">
					</div>
				</div>
				<div class="form-inline-form-group">
					<label for="nickname" class="col-sm-2 control-label">닉네임</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="a_nickname" name="a_nickname" placeholder="닉네임을 입력하세요" aria-describedby="nicknameReHelpBlock" maxlength="10" style="width:200px;">
						<button type="button" class="btn btn-default" id="btn_nickname_chk">중복확인</button>
					</div>
					<span id="passwordReHelpBlock" class="text-muted-text-left">닉네임은 최대 10자까지 가능합니다.</span>
					<input type="hidden" id="nickname_chk" name="nickname_chk" value="">
				</div>
			</fieldset>
			<div class="form-group form-actions">
				<div class="col-sm-12 text-center">
					<button type="submit"class="btn btn-primary validate" >회원가입</button>
					<a class="btn btn-default cancel" href="http://localhost/shopping/" title="Cancel">취소하기</a>
				</div>
			</div>
		</div>
	</form>
	</div>
	<div class="docs-section" style="margin-top:16px;margin-bottom:16px;padding-bottom:6px;padding-top:16px">
		<p class="text_msg"><strong class="text-danger">※ 아이디(이메일), 닉네임은 주문 및 결제 시 필요한 고유 정보로, 가입 후에는 변경이 불가합니다.</strong></p>
	</div>
</body>
</html>