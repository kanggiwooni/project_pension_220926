<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="mDAO" class="pack_member.MemberDAO" />
<jsp:useBean id="mVO" class="pack_member.MemberVO" />
<%
request.setCharacterEncoding("UTF-8");

String uid = request.getParameter("uid");
String upw = request.getParameter("upw");
String uName = mDAO.mtd_login(uid, upw);
%>
<script>
<%
if (uName != null) {
	session.setAttribute("uidKey", uid);
	session.setAttribute("uNameKey", uName);

	mVO = mDAO.getMemberData(uid);
	session.setAttribute("bean", mVO);
%>
	location.href="/index.jsp";
<%
} else {
%>	
	alert("아이디 또는 비밀번호를 확인해주세요.");
	location.href="/member/login.jsp";
<%
}
%>
</script>