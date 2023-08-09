$(document).ready(function(){
	bxslider();
	mainPageNavigation();
	mainPageContents();
});

// 슬라이드
function bxslider() {
	$('.bxslider').bxSlider({
	});
}

// 네비게이션
function mainPageNavigation() {
    $('.main-page__tab div').hover( // hover이벤트의 첫 번째 콜백은 hover-in, 두 번째 콜백은 hover-out
        function() {
            // Hover-in 효과 (파란색으로 선택된 요소는 무시)
            if (!$(this).hasClass('active')) {
                $(this).css('border-top', '1px solid white');
            }
        },
        function() {
            // Hover-out 효과 (파란색으로 선택된 요소는 무시)
            if (!$(this).hasClass('active')) {
                $(this).css('border-top', 'none');
            }
        }
    );

    $('.main-page__tab div').click(function() {
        // 다른 div에서 'active' 클래스 제거
        $('.main-page__tab div').removeClass('active');
        // 다른 div에서 파란색 상단 테두리 제거
        $('.main-page__tab div').css('border-top', 'none');
        // 클릭한 div에 'active' 클래스 추가(딱히 active에 무슨 요소를 준 것은 아니지만 active관련 처리는 위에 hover에서 이뤄지고 있음)
        $(this).addClass('active');
        // 클릭한 div에 파란색 상단 테두리 추가
        $(this).css('border-top', '1px solid #67c1f5');
    });
}

function mainPageContents() {
	$(".main-page-contents__wrapper > div").hide();
    $(".main-page__tab a").click(function () {
    	$(".main-page-contents__wrapper > div").hide().filter(this.hash) // href와 일치하는 div의 id가져오기
                    .fadeIn();
                  $(".main-page__tab a").removeClass("active");
                  $(this).addClass("active"); // active되면 테두리와 글자를 하늘색으로
                  return false;
                })
                .filter(":eq(0)") // 첫 번째 .main-page__tab a 요소
                .click();
}