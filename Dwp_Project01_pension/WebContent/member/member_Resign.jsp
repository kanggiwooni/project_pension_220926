<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDAO" class="pack_member.MemberDAO" />
<%
String uid = (String)session.getAttribute("uidKey");
int rtnCnt = mDAO.mtd_delete(uid);

%>
<script>
<%
if (rtnCnt == 1) {
%>
	alert("회원탈퇴 성공");
	location.href="/index.jsp";
<%
} else {
%>	
	alert("회원탈퇴 실패");
	location.href="/index.jsp";
<%
}
%>
</script>