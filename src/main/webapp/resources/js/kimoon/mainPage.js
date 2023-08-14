$(document).ready(function(){
	bxslider();
	mainPageNavigation();
	clickFirstDiv()
});

// 슬라이드
function bxslider() {
	$('.bxslider').bxSlider({
	});
}

// 페이지 로드 시 첫 번째 div를 클릭한 것처럼 처리
function clickFirstDiv() {
    $('.main-page__tab div:first').click();
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