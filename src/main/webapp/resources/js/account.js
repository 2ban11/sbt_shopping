function goHome(){
	location.href ='index.go'
}


$(document).ready(function(){
	$("#joinFrm").submit(function(){
		var pwd = $("#m_pwd").val();
		var num = pwd.search(/[0-9]/g);
		var eng = pwd.search(/[a-z]/ig);
		var spe = pwd.search(/[`~!#$%^&*()|\\\'\_";:\/?]/gi);
		var spe2 = pwd.match(/[^0-9a-z`~!#$%\^&*\(\)|\\\'\_\";:\/?]/gi);
		var spa = checkSpace(pwd);

		if($("#id_chk").val()==""){
			alert("아이디 중복확인을 하세요.");
			return false;
		}

		if(pwd.length<8 || pwd.length>16){
			alert("비밀번호는 영문소문자, 숫자, 특수문자를 포함 8자리 이상 ~ 16이하로 입력해주세요.");
			return false;
		}

		if(num < 0 || eng <0 || spe <0){
			alert("비밀번호는 영문소문자, 숫자, 특수문자를 포함 8자리 이상 ~ 16이하로 입력해주세요.");
			return false;
		}

		if(spa){
			alert("비밀번호는 공백없이 입력해주세요.");
			return false;
		}

		if(spe2){
			alert("비밀번호에 사용할 수 없는 문자가 포함되어 있습니다.");
			return false;
		}

		if($("#m_pwd").val() != $("#m_pwd_re").val()){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}

		if($("#nickname").val().search(/[`~!@#$%^&*()|\\\'\";:\/?]/gi) != -1){
			alert("닉네임에는 특수문자를 포함하실수 없습니다.");
			return false;
		}

		if($("#nickname_chk").val()==""){
			alert("닉네임 중복확인을 하세요.");
			return false;
		}

		return true;
	});


	$("#email3").bind("change",function(){
		var email_url = $("#email3 option:selected").val();
		if(email_url=="direct" &&  email_url!=""){
			$("#email2").val("");
		}else{
			$("#email2").val(email_url);
		}
	});

	function checkSpace(str){
		if(str.search(/\s/)!=-1){
			return true;
		}else{
			return false;
		}
	}


	$("#btn_id_chk").bind("click",function(){
		var id = $("#m_id").val() + "@" + $("#email2").val();

		if($("#m_id").val()=="" || $("#email2").val()==""){
			alert("아이디를 입력하세요.");
			return;
		}else{
			$.ajax({
				'url': 'join_proc.php',
				'type': 'POST',
				'dataType':'json',
				'data':{mode:"idChk",id:id},
				'success': function(data){
					console.log(data);
					if(data['error_code']=="1"){
						alert(data['msg']);
						$("#id_chk").val("");
						$("#m_id").val("");
						$("#email2").val("");
						return;
					}else{
						$("#id_chk").val("1");
						alert("등록이 가능한 아이디입니다.");
						return;
					}
					
				},
				'error':function(data){
					alert("에러입니다.");
				}
			});
		}
	});

	$("#btn_nickname_chk").bind("click",function(){
		var nickname = $("#nickname").val();

		if(nickname==""){
			alert("닉네임을 입력하세요.");
			return;
		}else{
			$.ajax({
				'url': 'join_proc.php',
				'type': 'POST',
				'dataType':'json',
				'data':{mode:"nicknameChk",nickname:nickname},
				'success': function(data){
					console.log(data);
					if(data['error_code']=="1"){
						alert(data['msg']);
						$("#nickname_chk").val("");
						$("#nickname").val("");
						return;
					}else{
						$("#nickname_chk").val("1");
						alert("등록이 가능한 닉네임입니다.");
						return;
					}
					
				},
				'error':function(data){
					alert("에러입니다.");
				}
			});
		}
	});
});

