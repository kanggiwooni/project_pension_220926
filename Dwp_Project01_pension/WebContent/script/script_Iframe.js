$(function () {
	
	/* GNB 풀다운 메뉴 시작 */
    $("#mainMenu>li.mainLi").mouseover(function () {
        $(this).children("ul.subMenu").stop().fadeIn(200);
    });
    $("#mainMenu>li.mainLi").mouseout(function () {
        $(this).children("ul.subMenu").stop().fadeOut(200);
    });
	/* GNB 풀다운 메뉴 끝 */


	/* GNB 이동관련 소스 시작 */
	$("a#mainPage").click(function(){
		window.parent.location.href="/index.jsp";
	});
	$("a#noticePage").click(function(){
		window.parent.location.href="/BBS/notice/notice.jsp";
	});
	$("a#reviewsPage").click(function(){
		window.parent.location.href="/BBS/reviews/reviews.jsp";
	});
	$("a#loginPage").click(function(){
		window.parent.location.href="/member/login.jsp";
	});
	$("a#joinPage").click(function(){
		window.parent.location.href="/member/joinAgreement.jsp";
	});
	/* GNB 이동관련 소스 끝 */
	
});