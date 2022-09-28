<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<%
request.setCharacterEncoding("UTF-8");


%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_Member.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_Member.js"></script>
	</head>
	<body>
	
		<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>
		
		<div id="wrap">
			<h1>회원가입 페이지</h1>
			<form action="/member/joinProc.jsp" id="joinFrm">
				<table id="joinTbl">
					<tbody>
						<tr>
							<td>아이디</td>
							<td>
								<input type="text" name="uid"
									maxlength="30">
								<button type="button">ID중복확인</button>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<input type="password" name="upw"
									maxlength="30">
							</td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td>
								<input type="password" id="upw2"
									maxlength="30">
								<span id="upw2ChkTxt"></span>
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td>
								<input type="text" name="uName"
									maxlength="30">
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" id="uEmail1" name="uEmail">
								@
								<input type="text" id="uEmail2">
								<select id="selectEmail">
									<option value="">직접입력</option>
									<option>naver.com</option>
									<option>google.com</option>
									<option>daum.net</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								남<input type="radio" name="gender" value="1">
								여<input type="radio" name="gender" value="2">
							</td>
						</tr>
						<tr>
							<td>생일</td>
							<td>
								<input type="text" name="uBirth"
									maxlength="10">
							</td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td>
								<input type="text" name="uZipcode" readonly>
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
								<input type="text" name="uAddr"
									maxlength="100">
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td>
								<button type="button" id="joinSubmitBtn">회원가입</button>
							</td>
						</tr>
					</tfoot>
				</table>
				<!-- table#joinTbl -->
			</form>
			<!-- form#joinFrm -->
		</div>
		<!-- div#wrap -->
		
		<iframe src="/iframe/iframe_footer.jsp" id="iframe_footer" scrolling="no"></iframe>

	</body>
</html>