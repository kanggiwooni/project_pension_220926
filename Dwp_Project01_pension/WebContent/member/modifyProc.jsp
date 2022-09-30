<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mVO" class="pack_member.MemberVO" />
<jsp:useBean id="mDAO" class="pack_member.MemberDAO" />
<%
request.setCharacterEncoding("UTF-8");

String uid = (String)session.getAttribute("uidKey");
out.print(uid);

mVO.setUpw(request.getParameter("upw"));
mVO.setuEmail(request.getParameter("uEmail"));
mVO.setGender(request.getParameter("gender"));
mVO.setuBirth(request.getParameter("uBirth"));
mVO.setuZipcode(request.getParameter("uZipcode"));
mVO.setuAddr(request.getParameter("uAddr"));

mDAO.mtd_modify(uid, mVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정 처리</h1>
</body>
</html>