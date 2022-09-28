<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<%
request.setCharacterEncoding("UTF-8");%>
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
							<td>아이디*</td>
							<td>
								<input type="text" id="uid"
									name="uid" maxlength="20">
								<button type="button" id="idChkBtn">ID중복확인</button>
								<span id="idChkTxt"></span>
								<input type="hidden" id="idCheck" value="">
								<p id="idGuideTxt">
									3~20자의 영문 대소문자, 숫자만 사용 가능합니다.
								</p>
								<!-- span#idGuideTxt -->
							</td>
						</tr>
						<tr>
							<td>비밀번호*</td>
							<td>
								<input type="password" id="upw"
									name="upw" maxlength="20">
								<label>
									<input type="checkbox" id="showPwChk">
									비밀번호 보기
								</label>
								<p id="pwGuideTxt">
									3~20자의 영문 대소문자, 숫자, 특수기호(_),(-),(!),(@)만 사용 가능합니다.
								</p>
							</td>
						</tr>
						<tr>
							<td>비밀번호 확인*</td>
							<td>
								<input type="password" id="upw2"
									maxlength="30">
								<span id="upw2ChkTxt"></span>
							</td>
						</tr>
						<tr>
							<td>이름*</td>
							<td>
								<input type="text" id="uName"
									name="uName" maxlength="30">
							</td>
						</tr>
						<tr>
							<td>이메일*</td>
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
							<td>생년월일</td>
							<td>
								<input type="text" name="uBirth" maxlength="6">
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