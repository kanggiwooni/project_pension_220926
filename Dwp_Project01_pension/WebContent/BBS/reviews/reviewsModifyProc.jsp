<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");

int num = Integer.parseInt(request.getParameter("num"));
String title = request.getParameter("title");
String content = request.getParameter("content");

int rtn = objBBSDAO.mtd_reviewsModify(num, title, content);
if(rtn==1){
	response.sendRedirect("/BBS/reviews/reviewsModifyEnd.jsp?num="+num);
}else if(rtn==0){
	out.print("연결실패 ㅠㅠ");
}
%>
