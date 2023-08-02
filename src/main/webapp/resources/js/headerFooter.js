$(document).ready(function () {
  // 버튼 클릭하면 원하는 위치로 이동
  $(".footer__go-top").click(function (event) {
    event.preventDefault();
    $("html, body").animate({ scrollTop: 0 }, 300);
  });
});