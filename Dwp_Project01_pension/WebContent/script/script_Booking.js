$(function(){

	/* 캘린더 이전 월 보기 */
	$("#lastMonthBtn").click(function(){
		let nowPageYear = $("#nowPageYear").text();
		let nowPageMonth = $("#nowPageMonth").text();
		let url = "/booking/bookCalendar.jsp?&monthParam=1";
		url += "&nowPageYear="+nowPageYear+"&nowPageMonth="+nowPageMonth;
		location.href = url;
	});
	/* 캘린더 다음 월 보기 */
	$("#nextMonthBtn").click(function(){
		let nowPageYear = $("#nowPageYear").text();
		let nowPageMonth = $("#nowPageMonth").text();
		let url = "/booking/bookCalendar.jsp?&monthParam=2";
		url += "&nowPageYear="+nowPageYear+"&nowPageMonth="+nowPageMonth;
		location.href = url;
	});
	
	/* 예약 페이지로 이동 */
	$("a.noBooked").click(function(){
		
		if ($("#uid").val() != "null") {
			let yearMonth = $("#bDate").val();
			let date = $(this).parent("p").siblings("h4").text();
			let rName = $(this).text();
			
			$("#rName").val(rName);
			$("#bDate").val(yearMonth +""+ date);
			
			$("form#bookingFrm").submit();
		} else {
			alert("로그인 후 예약하실 수 있습니다.");
			location.href = "/member/login.jsp";
		}
	});
	
	/* 이메일 직접입력/선택입력 처리 */
	$("select#selectEmail").change(function(){
		let email = $(this).val();
		$("input#uEmail2").val(email);
	});
	
	$("#bookSubmitBtn").click(function(){
		$("form#bookFrm").submit();
	});

});