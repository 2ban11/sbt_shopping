$(document).ready(function() {
    var isVerificationCodeSent = false;
    var verificationCode; // 인증번호를 저장할 변수
	var enteredEmail;
    $("#findBtn").click(function() {
      var email = $("#a_email").val();
    if (email === "") {
        $("#emailWarning").text("이메일을 입력하시오").css("color", "red");
        return;
    }

    // 이메일 유효성 검사 정규식 패턴 수정
    var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailRegex.test(email)) {
        $("#emailWarning").text("올바른 이메일 형식이 아닙니다").css("color", "red");
        return;
    } else {
        $("#emailWarning").text("");
    }
        // 이메일 유효성 검사
        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if (!emailRegex.test(email)) {
            $("#emailWarning").text("올바른 이메일 형식이 아닙니다").css("color", "red");
            return;
        } else {
            $("#emailWarning").text(""); // 이메일 유효성 검사를 통과한 경우 메시지 초기화
	$("#a_email").on("input", function() {
        $("#emailWarning").text("").css("color", "red");
    });
        }
		
		
        $.ajax({
        type: "POST",
        url: "/shopping/account.sendEmailCode",
        data: { email: email },
        success: function(response) {
	 sessionStorage.setItem("enteredEmail", email);
            if (response.message === "email_not_exist") {
                alert("가입되지 않은 이메일입니다.");
            } else {
                alert("인증 이메일이 성공적으로 전송되었습니다!");
                isVerificationCodeSent = true;
                enteredEmail = email;
                verificationCode = response.verificationCode;
                $("#verificationCodeContainer").show();
            }
        },
        error: function() {
            alert("인증 이메일 전송 중 오류가 발생했습니다.");
        }
    });
 

 $("#verifyCodeBtn").click(function() {
        if (isVerificationCodeSent) {
            var enteredCode = $("#verificationCode").val();

            // 클라이언트에서 입력한 인증번호와 서버에서 받은 인증번호 비교
            if (enteredCode === verificationCode) {
                // 인증 성공 시 페이지 이동
                window.location.href = "/shopping/account.email.auth";
            } else {
                alert("인증 번호가 올바르지 않습니다.");
            }
        } else {
            alert("먼저 인증 이메일을 받아주세요.");
        }
    });
});
});