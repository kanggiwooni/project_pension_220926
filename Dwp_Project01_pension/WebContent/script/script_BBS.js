$(function(){
	
	
	//notice 제목 클릭시 상세보기 이동 시작
	$("td.noticeTitle").click(function(){
		let num = $(this).prev("td").text();
		location.href="/BBS/bbsDetailProc.jsp?num="+num+"&bbs=notice";
	});
	//notice 제목 클릭시 상세보기 이동 끝
	
	//reviews 제목 클릭시 상세보기 이동 시작
	$("td.reviewsTitle").click(function(){
		let num = $(this).prev("td").text();
		location.href="/BBS/bbsDetailProc.jsp?num="+num+"&bbs=reviews";
	});
	//reviews 제목 클릭시 상세보기 이동 끝
	
	
	//notice 상세보기 페이지에서 삭제 클릭시 한번더 확인 후 진행 시작
	$("button#noticeDeleteBtn").click(function(){
		let chkToF = confirm("정말 삭제하시겠습니까?");
		let num = $(this).val();
		let bbs ="notice";
		if(chkToF){
			location.href = "/BBS/bbsDelete.jsp?num="+num+"&bbs="+bbs;
		}else{
			
		}
	});
	//notice 상세보기 페이지에서 삭제 클릭시 한번더 확인 후 진행 끝
	
	
	//reviews 상세보기 페이지에서 삭제 클릭시 한번더 확인 후 진행 시작
	$("button#reviewsDeleteBtn").click(function(){
		let chkToF = confirm("정말 삭제하시겠습니까?");
		let num = $(this).val();
		let bbs="reviews";
		if(chkToF){
			location.href = "/BBS/bbsDelete.jsp?num="+num+"&bbs="+bbs;
		}else{
			
		}
	});
	//reviews 상세보기 페이지에서 삭제 클릭시 한번더 확인 후 진행 끝
	
});



/* /BBS/notice/notice.jsp 리스트페이지 페이징 시작  */
function movePage(p1) {    // 페이지 이동
	
/*    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord*/

	let param = "/BBS/notice/notice.jsp?nowPage="+p1;	    
	     /*param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; */
	location.href= param;

}
/* /BBS/notice/notice.jsp 리스트페이지 페이징 끝  */


/* /BBS/notice/notice.jsp 리스트페이지 페이징 블럭이동 시작  */
function moveBlock(p1, p2, direction) {    // 블럭 이동

	let pageNum = parseInt(p1);
	let pagePerBlock = parseInt(p2);	
	//alert("p1 : " + p1 + "\np2 : " + p2);
	
	/*let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord*/
	let param;
	if(direction=='next'){
		param = "/BBS/notice/notice.jsp?nowPage="+(pagePerBlock*(pageNum)+1);
		     /*param += "&keyField="+p3;
		     param += "&keyWord="+p4 ; */
		location.href=param;
	}else if(direction=='prev'){
		param = "/BBS/notice/notice.jsp?nowPage="+(pagePerBlock*(pageNum-1));
		     /*param += "&keyField="+p3;
		     param += "&keyWord="+p4 ; */
		location.href=param;
	}
}
/* /BBS/notice/notice.jsp 리스트페이지 페이징 블럭이동 끝  */




/* /BBS/reviews/review.jsp 리스트페이지 페이징 시작  */
function movePage(p1) {    // 페이지 이동
	
/*    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord*/

	let param = "/BBS/reviews/reviews.jsp?nowPage="+p1;	    
	     /*param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; */
	location.href= param;

}
/* /BBS/reviews/review.jsp 리스트페이지 페이징 끝  */


/* /BBS/reviews/review.jsp 리스트페이지 페이징 블럭이동 시작  */
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
/* /BBS/reviews/review.jsp 리스트페이지 페이징 블럭이동 끝  */