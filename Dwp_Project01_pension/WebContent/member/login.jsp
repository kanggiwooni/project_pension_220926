<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_Member.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_Login.js"></script>
	</head>
	<body>
	
		<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>
		
		<div id="wrap">
			<h1>로그인 페이지</h1>
			<form action="/member/loginProc.jsp" id="loginFrm">
				<input type="text" id="uid" name="uid" 
				maxlength="20" placeholder="아이디" autofocus>
				<input type="password" id="upw" name="upw" 
				maxlength="20" placeholder="비밀번호">
				<button type="button" id="loginBtn">로그인</button>
			</form>
			<!-- loginFrm -->
			
			<hr>
			<button type="button">회원가입</button>
		</div>
		<!-- div#wrap -->
		
		<iframe src="/iframe/iframe_footer.jsp" id="iframe_footer" scrolling="no"></iframe>
		
	</body>
</html>