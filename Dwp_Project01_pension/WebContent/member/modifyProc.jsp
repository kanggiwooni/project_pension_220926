<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mVO" class="pack_member.MemberVO" />
<jsp:useBean id="mDAO" class="pack_member.MemberDAO" />
<%
request.setCharacterEncoding("UTF-8");
String uid = (String)session.getAttribute("uidKey");

mVO.setUpw(request.getParameter("upw"));
mVO.setuBirth(request.getParameter("uBirth"));
mVO.setuPhone(request.getParameter("uPhone"));
mVO.setuEmail(request.getParameter("uEmail"));
mVO.setGender(request.getParameter("gender"));
mVO.setuZipcode(request.getParameter("uZipcode"));
mVO.setuAddr(request.getParameter("uAddr"));

int rtnCnt = mDAO.mtd_modify(uid, mVO);

if (rtnCnt == 1) {
%>
<script>
	alert("회원정보를 수정했습니다.");
	location.href = "/index.jsp";
</script>
<%
}
%>	