 $(document).ready(function() {
    $("#findButton").click(function() {
        var a_phone = $("#a_phone").val();
        $.ajax({
            url: "/shopping/findIdByPhoneNum",
            type: "POST",
            data: { a_phone: a_phone },
            success: function(response) {
                $("#result").text(response);
            },
            error: function() {
                $("#result").text("조회에 실패하였습니다.");
            }
        });
    });
});