<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>

<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
int rtn = objBBSDAO.mtd_reviewsWrite(request);

if(rtn==1){
	response.sendRedirect("/BBS/reviews/reviewsInsertEnd.jsp");
}else if(rtn==0){
	out.print("연결실패 ㅠㅠ");
}

%>
