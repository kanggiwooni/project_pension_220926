$(function(){
	
	$("td.reviewsTitle").click(function(){
		let num = $(this).prev("td").text();
		location.href="/BBS/reviews/reviewsDetailProc.jsp?num="+num;
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




/* 리스트페이지 페이징 시작 /bbs/list.jsp */
function movePage(p1) {    // 페이지 이동
	
/*    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord*/

	let param = "/BBS/reviews/reviews.jsp?nowPage="+p1;	    
	     /*param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; */
	location.href= param;

}
/* 리스트페이지 페이징 끝 /bbs/list.jsp */


/* 리스트페이지 페이징 블럭이동 시작 /BBS/reviews.jsp */
function moveBlock(p1, p2, direction) {    // 블럭 이동

	let pageNum = parseInt(p1);
	let pagePerBlock = parseInt(p2);	
	//alert("p1 : " + p1 + "\np2 : " + p2);
	
	/*let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord*/
	let param;
	if(direction=='next'){
		param = "/BBS/reviews/reviews.jsp?nowPage="+(pagePerBlock*(pageNum)+1);
		     /*param += "&keyField="+p3;
		     param += "&keyWord="+p4 ; */
		location.href=param;
	}else if(direction=='prev'){
		param = "/BBS/reviews/reviews.jsp?nowPage="+(pagePerBlock*(pageNum-1));
		     /*param += "&keyField="+p3;
		     param += "&keyWord="+p4 ; */
		location.href=param;
	}
}
/* 리스트페이지 페이징 블럭이동 끝 /BBS/reviews.jsp */