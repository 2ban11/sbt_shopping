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
		
/*function deleteCartAll() {
	$(".selectDelete-btn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val){
			var checkArr = new Array();
			
			$("input[name=chk]:checked").each(function(){
				checkArr.push($(this).attr("data-cartNum"));
				console.log(checkArr.push($(this).attr("data-cartNum")));
			});
			
			$.ajax({
				url : "/deletecart",
				type : "post",
				data : { chk : checkArr },
				sucess : function(){
					location.href = "/";
				}
			})
		}
	});
}*/
	function deleteCart(no) {
		let ok = confirm('삭제?');
		if (ok) {
			location.href = 'deletecart?c_no=' + no;
		}
	}

$(function(){
	checkAll();
/*	deleteCartAll();*/
})