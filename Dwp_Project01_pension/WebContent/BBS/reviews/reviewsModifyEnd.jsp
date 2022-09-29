<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_BBS.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_BBS.js"></script>
	</head>
	<body>
	
		<div id="wrap">
			<h1>수정되었습니다.</h1>
			
			<button onclick="location.href = '/BBS/reviews/reviewsDetail.jsp?num='+<%=num%>">확인</button>
			
		</div>
		<!-- div#wrap -->
	
	</body>
</html>