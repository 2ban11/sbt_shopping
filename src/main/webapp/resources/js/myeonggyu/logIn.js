document.addEventListener("DOMContentLoaded", function() {
    var btnLogin = document.getElementById("btn_login");
    var inputId = document.getElementById("a_id");
    var inputPassword = document.getElementById("a_password");
    var idError = document.getElementById("a_id_error");
    var passwordError = document.getElementById("a_password_error");

    btnLogin.addEventListener("click", function(event) {
        if (inputId.value.trim() === "") {
            idError.style.display = "block";
            event.preventDefault();
        }

        if (inputPassword.value.trim() === "") {
            passwordError.style.display = "block";
            event.preventDefault();
        }
    });

    inputId.addEventListener("input", function() {
        if (inputId.value.trim() !== "") {
            idError.style.display = "none";
        }
    });

    inputPassword.addEventListener("input", function() {
        if (inputPassword.value.trim() !== "") {
            passwordError.style.display = "none";
        }
    });
});