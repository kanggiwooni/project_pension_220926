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
	session.invalidate();
%>
	alert("회원을 탈퇴했습니다.");
	location.href="/index.jsp";
<%
} else {
%>	
	alert("회원탈퇴 오류");
	location.href="/index.jsp";
<%
}
%>
</script>