function showId() {
    var phoneNumber = $("#a_p_no").val();
    
    $.ajax({
        url: "/shopping/account.phone.ID",
        method: "POST",
        data: { phoneNumber: phoneNumber },
        success: function(response) {
            // 세션에 저장된 아이디 값이 들어있음
            $("#found_id").val(response);  // 아이디 값을 설정
            console.log(response);
            $("#IDget").show();            // 아이디 표시 엘리먼트를 보여줌
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}