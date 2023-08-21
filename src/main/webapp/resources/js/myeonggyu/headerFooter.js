$(document).ready(() => {
  showDropDownMenu();
  showSidebar();
  showSidebarMenu();
  showSearchPopup();
  goTop();
});

// 하위 요소가 있는 네비게이션 버튼을 클릭하면 아래에 세부사항 표시
function showDropDownMenu() {
  $(".nav-item").click(function () {
    $(".nav-item-sub").hide();
    $(this).find(".nav-item-sub").show();
  });

  // 외부를 클릭하면 열려있는 세부사항이 닫힘
  $(document).click(function (event) {
    if (!$(event.target).closest(".nav-item").length) {
      $(".nav-item-sub").hide();
    }
  });
}

// 헤더의 햄버거 클릭하면 왼쪽에서 나오는 사이드바
function showSidebar() {
  $(".menu-hamberger>i").on("click", function () {
    $(".sidebar__bg").show();
    $(".sidebar__menu").show().animate({
      left: 0,
    });
    $("body").addClass("sidebar-open");
  });

  // 배경을 눌렀을 경우 사이드바를 닫음
  $(".sidebar__bg").on("click", function () {
    $(".sidebar__bg").hide();
    $(".sidebar__menu").animate(
      {
        left: "-" + 50 + "%",
      },
      function () {
        $(".sidebar__menu").hide();
      }
    );
    $("body").removeClass("sidebar-open");
  });
}

// 사이드바에서 하위요소가 있는 메뉴를 누르면 리스트 열거나 접기
function showSidebarMenu() {
  // 메뉴를 클릭했을 때
  $(".sidebar__contents__wrap>li").on("click", function () {
    $(this).toggleClass("active");
    $(this).find(".sidebar__item-detail>li").toggleClass("active");
  });

  // 하위 요소를 클릭해도 메뉴가 접히는 상황 막기
  $(".sidebar__item-detail>li").on("click", function (event) {
    event.stopPropagation();
  });
}

// 모바일 화면에서 돋보기 아이콘 클릭 시 팝업창 생성
function showSearchPopup() {
  // 검색 버튼을 클릭하면 팝업을 보여주는 동작
  $(".mobile-search--button").on("click", function () {
    $(".header-search-popup").addClass("active"); // active 클래스 추가로 팝업 보여짐
  });

  // 닫기 버튼을 클릭하면 팝업을 숨기는 동작
  $(".header-search-popup .header-popup__close--btn").on("click", function () {
    $(".header-search-popup").removeClass("active"); // active 클래스 제거로 팝업 숨김
  });
}

// 푸터의 TOP버튼 클릭하면 맨 위로 이동
function goTop() {
  $(".footer__go-top").click(function (event) {
    event.preventDefault();
    $("html, body").animate({ scrollTop: 0 }, 300);
  });
}
