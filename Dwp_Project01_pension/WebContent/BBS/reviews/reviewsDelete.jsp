<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO" />
<%
int num = Integer.parseInt(request.getParameter("num"));
int rtn = objBBSDAO.mtd_reviewsDelete(num);
if(rtn==1){
	response.sendRedirect("/BBS/reviews/reviewsDeleteEnd.jsp");
}else if (rtn==0){
	//삭제 안되쓰
}
%>
