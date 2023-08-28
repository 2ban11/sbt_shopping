function checkAll() {
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});
			
			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
	}

	
function updatecart(){
	alert('수정되었습니다');
}

function cartDeleteSelected(){
	$(".selectDelete-btn").click(function(){
	let aa = $("input[name='chk']:checked");
	let ok = confirm('삭제하시겠습니까?');
	let param="";
	if(ok){
		$.each(aa, function(i,o){
			param += 'c_no='+o.value+'&';
			console.log(param);
	});
	location.href='deletecart?' + param;
		//location.href = 'deletecart?c_no=' + o.value;
	}	
	});
}

function date(){
	
		$(document).ready(
			function() {
				// 오늘 날짜 구하기
				var today = new Date();
				var year = today.getFullYear();
				var month = (today.getMonth() + 1).toString().padStart(2, '0');
				var day = today.getDate().toString().padStart(2, '0');
				var currentDate = year + "-" + month + "-" + day;

				// 1주일 전 날짜 구하기
				var oneWeekAgo = new Date();
				oneWeekAgo.setDate(today.getDate() - 7);
				if (oneWeekAgo.getMonth() > today.getMonth()) {
					// 달이 바뀌는 경우
					if (today.getMonth() === 0) {
						// 현재 달이 1월인 경우
						oneWeekAgo.setFullYear(today.getFullYear() - 1);
						oneWeekAgo.setMonth(11); // 12월로 설정
					} else {
						oneWeekAgo.setMonth(today.getMonth() - 1);
					}
				}
				var weekAgoYear = oneWeekAgo.getFullYear();
				var weekAgoMonth = (oneWeekAgo.getMonth() + 1).toString()
						.padStart(2, '0');
				var weekAgoDay = oneWeekAgo.getDate().toString().padStart(2,
						'0');
				var oneWeekAgoDate = weekAgoYear + "-" + weekAgoMonth + "-"
						+ weekAgoDay;

				// 1달 전 날짜 구하기
				var oneMonthAgo = new Date(today);
				oneMonthAgo.setMonth(today.getMonth() - 1);

				// Handle cases where the day is beyond the last day of the month
				var lastDayOfMonth = new Date(oneMonthAgo.getFullYear(),
						oneMonthAgo.getMonth() + 1, 0).getDate();
				if (today.getDate() > lastDayOfMonth) {
					oneMonthAgo.setDate(lastDayOfMonth);
				}

				// Handle cases where the month goes back to the previous year
				if (today.getMonth() === 0) {
					oneMonthAgo.setFullYear(today.getFullYear() - 1);
					oneMonthAgo.setMonth(11); // December
				}

				// 3달 전 날짜 구하기
				var threeMonthsAgo = new Date(today);
				threeMonthsAgo.setMonth(today.getMonth() - 3);

				// Handle cases where the day is beyond the last day of the month
				var lastDayOfThreeMonthsAgo = new Date(threeMonthsAgo
						.getFullYear(), threeMonthsAgo.getMonth() + 1, 0)
						.getDate();
				if (today.getDate() > lastDayOfThreeMonthsAgo) {
					threeMonthsAgo.setDate(lastDayOfThreeMonthsAgo);
				}

				// Handle cases where the month goes back to the previous year
				if (today.getMonth() <= 2) {
					threeMonthsAgo.setFullYear(today.getFullYear() - 1);
					threeMonthsAgo.setMonth(today.getMonth() + 9); // Three months ago
				}

				// 6달 전 날짜 구하기
				var sixMonthsAgo = new Date(today);
				sixMonthsAgo.setMonth(today.getMonth() - 6);

				// Handle cases where the day is beyond the last day of the month
				var lastDayOfSixMonthsAgo = new Date(
						sixMonthsAgo.getFullYear(),
						sixMonthsAgo.getMonth() + 1, 0).getDate();
				if (today.getDate() > lastDayOfSixMonthsAgo) {
					sixMonthsAgo.setDate(lastDayOfSixMonthsAgo);
				}

				// Handle cases where the month goes back to the previous year
				if (today.getMonth() <= 5) {
					sixMonthsAgo.setFullYear(today.getFullYear() - 1);
					sixMonthsAgo.setMonth(today.getMonth() + 7); // Six months ago
				}

				// 1년 전 날짜 구하기
				var oneYearAgo = new Date(today);
				oneYearAgo.setFullYear(today.getFullYear() - 1);

				var oneMonthAgoDate = formatDate(oneMonthAgo);
				var threeMonthsAgoDate = formatDate(threeMonthsAgo);
				var sixMonthsAgoDate = formatDate(sixMonthsAgo);
				var oneYearAgoDate = formatDate(oneYearAgo);

				// 1주일 버튼 클릭 시 날짜 설정
				$("#1week").click(function() {
					$("#sartdate").val(oneWeekAgoDate);
					$("#enddate").val(currentDate);
				});

				// 1개월 버튼 클릭 시 날짜 설정
				$("#1month").click(function() {
					$("#sartdate").val(oneMonthAgoDate);
					$("#enddate").val(currentDate);
				});

				// 3개월 버튼 클릭 시 날짜 설정
				$("#3month").click(function() {
					$("#sartdate").val(threeMonthsAgoDate);
					$("#enddate").val(currentDate);
				});

				// 6개월 버튼 클릭 시 날짜 설정
				$("#6month").click(function() {
					$("#sartdate").val(sixMonthsAgoDate);
					$("#enddate").val(currentDate);
				});

				// 1년 버튼 클릭 시 날짜 설정
				$("#1year").click(function() {
					$("#sartdate").val(oneYearAgoDate);
					$("#enddate").val(currentDate);
				});

				// 날짜 선택 버튼 클릭 시, 날짜 입력란의 값을 설정
				$(".btn-search-date").click(function() {
					var startDate = $("#sartdate").val();
					var endDate = $("#enddate").val();
				});
			});

	function formatDate(date) {
		var year = date.getFullYear();
		var month = (date.getMonth() + 1).toString().padStart(2, '0');
		var day = date.getDate().toString().padStart(2, '0');
		return year + "-" + month + "-" + day;
	}
} 

/*function makeChecked(){
	$('.mypage-info-data-cart-select').click(function(){
		let input = $(this).children();
		
		console.log($(input).prop('checked',!input.prop('checked')));
	});
}*/


function validatePassword(){
var password = document.getElementById("pw");
var PWConfirm = document.getElementById("PWConfirm");
  if(password.value != PWConfirm.value) { // 만일 두 인풋 필드값이 같지 않을 경우
    // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
    PWConfirm.setCustomValidity("비밀번호가 일치하지 않습니다."); 
  } 
  else { // 만일 두 인풋 필드값이 같을 경우
    // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
    // 따라서 빈값을 주어 submit 처리되게 한다
    PWConfirm.setCustomValidity(''); 
  }
}


function signOut(){
	$(".mypage-btn-account-btn-signout").click(function(){
	let id = $("#a_id").val();
	console.log(id);
	let ok = confirm('탈퇴하시겠습니까?');
	let param="";
	if(ok){
		param = 'a_id='+ id;
			console.log(param);
	}	
	location.href='signout?' + param;
	});
}


function refund(no){
	let ok = confirm('환불하시겠습니까?');
	if(ok){
		location.href='refund?od_no=' + no;
	}
}


function refundCancel(no){
	let ok = confirm('취소하시겠습니까?');
	if(ok){
		location.href='refundcancel?od_no=' + no;
	}
}

function refundCancel2(no){
	let ok = confirm('취소하시겠습니까?');
	if(ok){
		location.href='refundcancel2?od_no=' + no;
	}
}

function refundAccept(no){
	let ok = confirm('환불하시겠습니까?');
	if(ok){
		location.href='refundaccept?od_no=' + no;
	}
}


$(function(){
	checkAll();
	cartDeleteSelected();
	date();
	signOut();
	/*makeChecked();*/
})