$(document).ready(function () {
    let lastClickedRow = -1; // 변수를 초기화하여 마지막으로 클릭한 행의 인덱스 추적
    
    $(".clickable-row").click(function () {
      let clickedRowIndex = $(this).index(); // 클릭한 행의 인덱스 추출
      
      if (clickedRowIndex !== lastClickedRow) {
        // 다른 행을 클릭한 경우 기존 열린 내용 닫기
        $("#clickable-row").removeClass("active");
        $(".collapse").removeClass("show");
        lastClickedRow = clickedRowIndex;
      }
      
      // 해당 행의 내용 열기/닫기
      $(this).toggleClass("active");
      let targetCollapse = $(this).data("target");
      $(targetCollapse).collapse("toggle");
    });
  



});


function makeForm(btn, pk){

const params = new URL(location).searchParams;

let pageNo = params.get('p_no');
let active = $(btn);
let rowEl = $(btn).closest('.clickable-row');
let table = `<tr><td colspan="4">
<form action="reg.ans.do">
<table class="ans-table" style="width: 100%;">
<tr><td>답변</td>
<td><textArea name="a_ans" cols="50" rows="3" style="resize: none;"></textArea></td>
	<input name="p_no" hidden value="${pageNo}">
<td><button name="a_q_no" value="${pk}">답변 등록</button></td>
</tr>
</table></form></td></tr>`;
console.log(active);
if($(active).val() == 0){
	$(rowEl).after(table);
	$(active).val(1);
}
	
}










