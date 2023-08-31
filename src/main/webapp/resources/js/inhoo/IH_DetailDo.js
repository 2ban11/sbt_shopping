$(document).ready(function () {
    let lastClickedRow = -1; // 변수를 초기화하여 마지막으로 클릭한 행의 인덱스 추적
    
    $(".clickable-row").click(function () {
      let clickedRowIndex = $(this).index(); // 클릭한 행의 인덱스 추출
      
      if (clickedRowIndex !== lastClickedRow) {
        // 다른 행을 클릭한 경우 기존 열린 내용 닫기
        $(".clickable-row").removeClass("active");
        $(".collapse").removeClass("show");
        lastClickedRow = clickedRowIndex;
      }
      
      // 해당 행의 내용 열기/닫기
      $(this).toggleClass("active");
      let targetCollapse = $(this).data("target");
      $(targetCollapse).collapse("toggle");
    });
  });









