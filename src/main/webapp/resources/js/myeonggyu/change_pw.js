$(document).ready(function() {
    $("#verifyAndResetBtn").click(function() {
        var newPassword = $("#a_password").val();
        var newPasswordRe = $("#a_password_re").val();
		
		var enteredEmail = sessionStorage.getItem("enteredEmail");

		
        // 비밀번호 유효성 검사
        if (!validatePassword()) {
            return;
        }

        // 새로운 비밀번호와 비밀번호 확인 값이 일치하는지 확인
        if (!checkPasswordMatch()) {
            return;
        }

        // TODO: 서버로 새 비밀번호를 전송하여 변경하도록 요청
       $.ajax({
        type: "POST",
        url: "/shopping/account.changePassword",
        data: {
            email: enteredEmail, // 이메일을 어디서 가져올지에 따라 변경
            new_password: newPassword
        },
        success: function(response) {
            if (response.success) {
                alert("비밀번호가 성공적으로 변경되었습니다.");
                // 비밀번호 변경 성공 후 추가 동작 수행
				window.location.href ="/shopping/"
            } else {
                alert("비밀번호 변경에 실패했습니다. 현재 비밀번호를 확인해주세요.");
            }
        },
        error: function() {
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
});
    // 비밀번호 유효성 검사
    function validatePassword() {
        var a_password = $("#a_password").val();
        var pwdRegex = /^(?=.*[a-z])(?=.*[0-9])(?=.*[`~!#$%^&*()|\\'";:/?])[a-z0-9`~!#$%^&*()|\\'";:/?]{8,16}$/i;
        if (!pwdRegex.test(a_password)) {
            alert("비밀번호는 영문 소문자, 숫자, 특수문자를 포함하여 8자 이상 16자 이하로 입력해주세요.(@는 포함불가)");
            return false;
        }
        return true;
    }

    // 비밀번호 확인 검사 함수
    function checkPasswordMatch() {
        var password = $("#a_password").val();
        var confirmPassword = $("#a_password_re").val();
        if (password !== confirmPassword) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }
        return true;
    }
});