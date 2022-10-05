<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String bbs=request.getParameter("bbs");
String bbsComment = "";
String url="/BBS/"+bbs+"/"+bbs+"Detail.jsp?num="+num;
if(bbs=="review"){
	bbsComment = "이용후기";
}else if(bbs=="notice"){
	bbsComment = "공지사항";
}
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title><%=bbsComment%> 수정 완료 페이지</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_BBS.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_BBS.js"></script>
	</head>
	<body>
	
		<div id="wrap">
			<h1>수정되었습니다.</h1>
			<hr>
			<button onclick="location.href = '<%=url%>'">확인</button>
			
		</div>
		<!-- div#wrap -->
	
	</body>
</html>