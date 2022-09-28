<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mDAO" class="pack_member.MemberDAO" />
<%
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");
String uName = mDAO.mtd_login(uid, upw);
if (uName != null) {
	session.setAttribute("uidKey", uid);
	session.setAttribute("uNameKey", uName);
	String uidKey = (String)session.getAttribute("uidKey");
	String uNameKey = (String)session.getAttribute("uNameKey");
	out.print("로그인한 계정 : " + uidKey);
	out.print("<br>");
	out.print("로그인이름 : " + uNameKey);
}
%>