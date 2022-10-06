<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");

int parentNum = Integer.parseInt(request.getParameter("num"));
String uid = request.getParameter("uid");
String uName = request.getParameter("uName");
String comment = request.getParameter("comment");

int rtn = objBBSDAO.mtd_reviewsCommentWrite(parentNum, uid, uName, comment);
if(rtn==1){
	response.sendRedirect("/BBS/reviews/reviewsDetail.jsp?num="+parentNum);
}else if(rtn==0){
	out.print("댓글저장실패");
}
%>
