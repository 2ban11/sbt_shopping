function goHome() {
    location.href = 'index.go';
}


$(document).ready(function() {
     $("#a_email3").change(function() {
        var selectedDomain = $(this).val();
        if (selectedDomain === "direct") {
            $("#a_email2").prop("disabled", false).val("").focus();
        } else {
            $("#a_email2").prop("disabled", true).val(selectedDomain);
        }
    });

    // #a_email2 값이 변경될 때 이벤트 처리
    $("#a_email2").on("input", function() {
        // 선택 옵션을 "직접입력"으로 변경
        $("#a_email3").val("direct");
    });
    
    // #a_email2 값이 변경될 때 이벤트 처리
    $("#a_email2").on("change", function() {
        // 선택한 이메일 주소 가져오기
        var enteredEmail = $(this).val();
        // 이메일 주소 출력 (개발 시 확인용)
        console.log(enteredEmail);
    });

    // 이메일 유효성 검사
    function validateEmail() {
        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var a_email3 = $("#a_email3").val();
        var a_email2 = $("#a_email2").val(); // 직접 입력한 이메일 값 가져오기
        if (a_email3 === "direct") {
            if (!emailRegex.test(a_email2)) {
                alert("올바른 이메일 주소를 입력하세요.");
                return false;
            }
        }
        return true;
    }
 
   
     

    // 닉네임 유효성 검사
    function validateNickname() {
        var nicknameRegex = /^[a-zA-Z0-9가-힣]{1,10}$/;
        var a_nickname = $("#a_nickname").val();
        if (!nicknameRegex.test(a_nickname)) {
            alert("닉네임은 1자 이상 10자 이하의 영문, 숫자, 한글로 입력해주세요.");
            return false;
        }
        return true;
    }

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
	
	// 아이디 중복 확인
    function isIdDuplicated() {
        if ($("#a_id").val() === "") {
            alert("아이디 중복확인을 하세요.");
            return true;
        }
        return false;
    }

    // 닉네임 중복 확인
    function isNicknameDuplicated() {
        if ($("#a_nickname").val() === "") {
            alert("닉네임 중복확인을 하세요.");
            return true;
        }
        return false;
    }
	// 전화번호 유효성 검사


// 전화번호 중복 확인 함수
function isPhoneNumberDuplicated() {
    if ($("#a_phone").val() === "") {
        alert("전화번호 중복확인을 하세요.");
        return true;
    }
    return false;
}
	
    // 회원가입 폼 제출을 처리하는 함수
 $(".joinForm").submit(function(event) {
    event.preventDefault(); // 폼 제출 막음
    
    var isEmailValid = validateEmail();
    var isNicknameValid = validateNickname();
    var isPasswordValid = validatePassword();
    var isPasswordMatched = checkPasswordMatch();
    var phoneNumberIsDuplicated = isPhoneNumberDuplicated(); // 변수명 변경

    // 아이디 중복 확인
    if (isIdDuplicated()) {
        return false;
    }

    // 닉네임 중복 확인
    if (isNicknameDuplicated()) {
        alert("닉네임 중복확인을 해주세요.");
        return false;
    }

    // 유효성 검사 실패 시 폼 제출 막음
    if (!isEmailValid || !isNicknameValid || !isPasswordValid || !isPasswordMatched || phoneNumberIsDuplicated) {
        alert("입력한 정보를 다시 확인해주세요.");
        return false; // 유효성 검사 실패 시 폼 제출 막음
    }

    // 모든 유효성 검사를 통과하면 폼을 제출합니다.
    alert("회원가입이 완료되었습니다."); // 유효성 검사 통과 시 알림
    this.submit(); // 폼 제출
});

    // 아이디 중복 확인 버튼 클릭 시
     $("#btn_id_chk").click(function() {
        var a_id = $("#a_id").val();
        var a_email2 = $("#a_email2").val();
        if (a_id === "") {
            alert("아이디를 입력해주세요");
            return;
        } else if (a_email2 === "") {
            alert("주소를 선택해주세요");
            return;
        }
        // AJAX를 사용하여 아이디 중복 확인을 요청합니다.
        $.ajax({
            url: "/shopping/account.get",
            type: "GET",
            data: { a_id: a_id + "@" + a_email2 },
            success: function(result) {
                if (result === 1) {
                    alert("이미 사용 중인 아이디입니다.");
                    $("#id_chk").val("");
                } else {
                    alert("사용 가능한 아이디입니다.");
                    $("#id_chk").val("1");
                }
            },
            error: function(xhr, status, error) {
                alert("아이디 중복 확인 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    });

    // 닉네임 중복 확인 버튼 클릭 시
    $("#btn_nickname_chk").click(function() {
        var a_nickname = $("#a_nickname").val();
        if (a_nickname === "") {
            alert("닉네임을 입력해주세요");
            return;
        }
        // AJAX를 사용하여 닉네임 중복 확인을 요청합니다.
        $.ajax({
            url: "/shopping/accountNickname.get",
            type: "GET",
            data: { a_nickname: a_nickname },
            success: function(result) {
                if (result === 1) {
                    alert("이미 사용 중인 닉네임입니다.");
                    $("#nickname_chk").val("");
                } else {
                    alert("사용 가능한 닉네임입니다.");
                    $("#nickname_chk").val("1");
                }
            },
            error: function(xhr, status, error) {
                alert("닉네임 중복 확인 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    });
$("#btn_phone_chk").click(function() {
    var a_phone = $("#a_phone").val();

		var phoneRegex = /^\d{10,11}$/; // 10자리 또는 11자리 숫자만 허용
    if (!phoneRegex.test(a_phone)) {
        alert("올바른 전화번호를 입력하세요.");
        return;
    }
		
    if (a_phone === "") {
        alert("전화번호를 입력해주세요");
        return;
    }

    // AJAX를 사용하여 전화번호 중복 확인을 요청합니다.
    $.ajax({
        url: "/shopping/account.phone.get",
        type: "GET",
        data: { a_phone: a_phone },
        success: function(result) {
            if (result === 1) {
                alert("이미 사용 중인 전화번호입니다.");
                $("#phone_chk").val("");
            } else {
                alert("사용 가능한 전화번호입니다.");
                $("#phone_chk").val("1");
            }
        },
        error: function(xhr, status, error) {
            alert("전화번호 중복 확인 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
    });
});
});
