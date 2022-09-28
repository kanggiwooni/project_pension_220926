<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="mDAO" class="pack_member.MemberDAO" />
<%
request.setCharacterEncoding("UTF-8");
String uid = request.getParameter("uid");

int idCheck = mDAO.mtd_idCheck(uid);
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>ID중복확인</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Member.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_Member.js"></script>
	</head>
	<body>
		<div id="wrap_pop">
			<h1><%= uid %></h1>
			<span>
				<%
				String chkTxt = "";
				String btnTxt = "";
				if (idCheck == 1) {
					chkTxt ="존재하는 아이디입니다";
					btnTxt = "ID 재입력";
				} else {
					chkTxt = "사용할 수 있는 아이디입니다";
					btnTxt = "사용하기";
				}
				out.print(chkTxt);
				%>
			</span>
			<button type="button" id="popCloseBtn" value="<%=idCheck%>">
				<%= btnTxt %>
			</button>
		</div>
		<!-- div#wrap -->
	</body>
</html>