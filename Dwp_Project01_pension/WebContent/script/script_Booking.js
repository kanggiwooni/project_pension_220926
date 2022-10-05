$(function(){

	$("#lastMonthBtn").click(function(){
		let nowPageYear = $("#nowPageYear").text();
		let nowPageMonth = $("#nowPageMonth").text();
		let url = "/booking/bookCalendar.jsp?&monthParam=1";
		url += "&nowPageYear="+nowPageYear+"&nowPageMonth="+nowPageMonth;
		location.href = url;
	});
	
	$("#nextMonthBtn").click(function(){
		let nowPageYear = $("#nowPageYear").text();
		let nowPageMonth = $("#nowPageMonth").text();
		let url = "/booking/bookCalendar.jsp?&monthParam=2";
		url += "&nowPageYear="+nowPageYear+"&nowPageMonth="+nowPageMonth;
		location.href = url;
	});

});