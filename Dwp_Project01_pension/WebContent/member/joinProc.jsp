<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mDAO" class="pack_member.MemberDAO" />
<jsp:useBean id="mVO" class="pack_member.MemberVO" />
<jsp:setProperty name="mVO" property="*" />
<%
int rtnCnt = mDAO.mtd_join(mVO);

if (rtnCnt == 1) {
	out.print("join OK");
}
%>