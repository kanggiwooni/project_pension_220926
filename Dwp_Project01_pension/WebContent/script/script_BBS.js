$(function(){
	
	$("td.reviewsTitle").click(function(){
		let num = $(this).prev("td").text();
		location.href="/BBS/reviews/reviewsDetail.jsp?num="+num;
	});
	
	
	
	
});