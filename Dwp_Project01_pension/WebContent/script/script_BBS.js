$(function(){
	
	$("td.reviewsTitle").click(function(){
		let num = $(this).prev("td").text();
		location.href="/BBS/reviews/reviewsDetail.jsp?num="+num;
	});
	
	$("button#reviewsDeleteBtn").click(function(){
		let chkToF = confirm("정말 삭제하시겠습니까?");
		let num = $(this).val();
		if(chkToF){
			location.href = "/BBS/reviews/reviewsDelete.jsp?num="+num;
		}else{
			
		}
	});
	
	
});