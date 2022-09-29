<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>이용약관 동의</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_Member.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_Join.js"></script>
	</head>
	<body>
	
		<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>
		
		<div id="wrap" class="joinAgreementWrap">
			<div id="chkAllArea">
				<label>
					<input type="checkbox" id="chkAllBtn">
					<span>이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</span>
				</label>
			</div>
			<!-- div#chkAllArea -->
			
			<div id="licenseArea">
				<div class="termsArea">
					<h3>[필수] 이용약관 동의</h3>
					<iframe src="/iframe/terms_usingAgree.html"></iframe>
					<label>
						<input type="checkbox" class="agreeChk required"
							name="usingAgree">
						이용약관에 동의합니다. (필수)
					</label>
				</div>
				
				<div class="termsArea">
					<h3>[필수] 개인정보 수집 및 이용 동의</h3>
					<iframe src="/iframe/terms_personalInfo.html"></iframe>
					<label>
						<input type="checkbox" class="agreeChk required"
							name="personalInfo">
						개인정보 수집 및 이용에 동의합니다. (필수)
					</label>
				</div>
				
				<div class="termsArea">
					<h3>[선택] 쇼핑정보 수신 동의</h3>
					<iframe src="/iframe/terms_shoppingInfo.html"></iframe>
					<label>
						<input type="checkbox" class="agreeChk"
							name="shoppingInfoAgree" form="agreeFrm">
						쇼핑정보 수신에 동의합니다. (선택)
					</label>
				</div>
			</div>
			<!-- div#licenseArea -->
			
			<div id="joinBtnArea">
				<form action="/member/join.jsp" id="agreeFrm"></form>
				<button id="agreeSubmitBtn">회원가입</button>
			</div>
			<!-- div#joinBtnArea -->
		</div>
		<!-- div#wrap -->
		
		<iframe src="/iframe/iframe_footer.jsp" id="iframe_footer" scrolling="no"></iframe>
		
	</body>
</html>