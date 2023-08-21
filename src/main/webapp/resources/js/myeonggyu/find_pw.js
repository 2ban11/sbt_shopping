$(document).ready(function() {
    var isVerificationCodeSent = false;
    var verificationCode; // 인증번호를 저장할 변수

    $("#findBtn").click(function() {
        var email = $("#a_email").val();
        
        $.ajax({
            type: "POST",
            url: "/shopping/account.sendEmailCode",
            data: { email: email },
            success: function(response) {
                alert("인증 이메일이 성공적으로 전송되었습니다!");
                isVerificationCodeSent = true;
                verificationCode = response.verificationCode; // 서버에서 생성한 인증번호 저장
                console.log(verificationCode);
                $("#verificationCodeContainer").show(); // 인증 코드 입력 요소 표시
            },
            error: function() {
                alert("인증 이메일 전송 중 오류가 발생했습니다.");
            }
        });
    });

    $("#verifyCodeBtn").click(function() {
    if (isVerificationCodeSent) {
        var enteredCode = $("#verificationCode").val();

        $.ajax({
            type: "POST",
            url: "/shopping/verifyEmailCode",
            data: {
                email: $("#a_email").val(),
                verificationCode: enteredCode
            },
            success: function(response) {
                if (response === "success") {
                    window.location.href = "/shopping/account.email.auth"; // 인증 성공 시 페이지 이동
                } else {
                    alert("인증 번호가 올바르지 않습니다.");
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다.");
            }
        });
    } else {
        alert("먼저 인증 이메일을 받아주세요.");
    }
});
});