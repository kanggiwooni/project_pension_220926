<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="mDAO" class="pack_member.MemberDAO" />
<%
request.setCharacterEncoding("UTF-8");

String uid = request.getParameter("uid");
String upw = request.getParameter("upw");
String uName = mDAO.mtd_login(uid, upw);

if (uName != null) {
	session.setAttribute("uidKey", uid);
	session.setAttribute("uNameKey", uName);
	
	response.sendRedirect("/index.jsp");
}
%>