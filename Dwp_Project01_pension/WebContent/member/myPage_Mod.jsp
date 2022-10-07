<%@page import="pack_member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="mDAO" class="pack_member.MemberDAO" />
<%
String uid = (String)session.getAttribute("uidKey");

MemberVO mVO = mDAO.getMemberData(uid);
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_Member.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_Join.js"></script>
	</head>
	<body>
	
		<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>
		
		<div id="wrap" class="dFlex modifyWrap">
			<div id="myPageLnbArea">
				<ul id="myPageLnb">
					<li><a>예약내역 확인(미구현)</a></li>
					<li><a>회원정보 수정</a></li>
					<li><a onclick="resign()">회원 탈퇴하기</a></li>
				</ul>
			</div>
			<!-- div#myPageLnbArea -->
			
			<div id="myPageArea">
				<h1>회원정보 수정</h1>
				<h1></h1>
				<form action="/member/modifyProc.jsp" id="modifyFrm">
					<table id="joinTbl">
						<caption>* 표시는 필수 입력사항입니다.</caption>
						<tbody>
							<tr>
								<td>*아이디</td>
								<td>
									<%=mVO.getUid()%>
									<!-- <input type="text" id="uid" name="uid"
									maxlength="20">
									<button type="button" id="idChkBtn">ID중복확인</button>
									<span id="idChkTxt"></span>
									<input type="hidden" id="idCheck" value="">
									<p id="idGuideTxt" class="guideTxt">
										3~20자의 영문 대소문자, 숫자만 사용 가능합니다.
									</p>
									span#idGuideTxt -->
								</td>
							</tr>
							<tr>
								<td>*비밀번호</td>
								<td>
									<input type="password" id="upw"
										name="upw" maxlength="20">
									<label>
										<input type="checkbox" id="showPwChk">
										비밀번호 보기
									</label>
									<p id="pwGuideTxt" class="guideTxt">
										3~20자의 영문 대소문자, 숫자, 특수기호(_),(-),(!),(@)만 사용 가능합니다.
									</p>
								</td>
							</tr>
							<tr>
								<td>*비밀번호 확인</td>
								<td>
									<input type="password" id="upw2"
										maxlength="30">
									<span id="upw2ChkTxt"></span>
								</td>
							</tr>
							<tr>
								<td>*이름</td>
								<td>
									<%=mVO.getuName()%>
									<!-- <input type="text" id="uName"
										name="uName" maxlength="30"> -->
								</td>
							</tr>
							<tr>
								<td>*생년월일</td>
								<td>
									<%
									String uBirth = "";
									if (mVO.getuBirth() != null) uBirth = mVO.getuBirth();
									%>
									<input type="text" id="uBirth" name="uBirth" 
									maxlength="6" value="<%=uBirth%>">
									<span class="guideTxt">생년월일 6자리를 입력해주세요. 예시) 930428</span>
								</td>
							</tr>
							<tr>
								<td>*연락처</td>
								<td>
									<%
									String uPhone = "";
									if (mVO.getuBirth() != null) uPhone = mVO.getuPhone();
									%>
									<input type="text" id="uPhone" name="uPhone" 
									maxlength="11" value="<%=uPhone%>">
									<span class="guideTxt">숫자만 입력해주세요. 예시) 01012345678</span>
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<%
									String uEmail = mVO.getuEmail();
									int idxEmail = 0;
									String uEmail1 = "";
									String uEmail2 = "";
									if (uEmail != null) {
										idxEmail = uEmail.indexOf('@');
										uEmail1 = uEmail.substring(0, idxEmail);
										uEmail2 = uEmail.substring(idxEmail + 1);
									}
									%>
									<input type="text" id="uEmail1" name="uEmail" value="<%=uEmail1%>">
									@
									<input type="text" id="uEmail2" value="<%=uEmail2%>">
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
									<%
									String gender = mVO.getGender();
									String noChk = "checked";
									String mailChk = "";
									String femailChk = "";
									if (gender != null) {
										if (gender.equals("1")) {
											mailChk = "checked";
										} else if (gender.equals("2")) {
											femailChk = "checked";
										}
									}
									%>
									<label>
										선택 안함 <input type="radio" name="gender"
										value="" <%=noChk%>>
									</label>
									&nbsp;&nbsp;
									<label>
										남 <input type="radio" name="gender"
										value="1" <%=mailChk%>>
									</label>
									&nbsp;&nbsp;
									<label>
										여 <input type="radio" name="gender"
										value="2" <%=femailChk%>>
									</label>
								</td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>
									<%
									String uZipcode = "";
									if (mVO.getuZipcode() != null) uZipcode = mVO.getuZipcode();
									%>
									<input type="text" id="uZipcode" name="uZipcode"
									maxlength="7" readonly value="<%=uZipcode%>">
									<button type="button" id="findZipBtn">우편번호 찾기</button>
								</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>
									<%
									String uAddr = "";
									if (mVO.getuAddr() != null) uAddr = mVO.getuAddr();
									%>
									<input type="text" id="uAddr" name="uAddr"
										maxlength="100" value="<%=uAddr%>">
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<button type="button" id="modifySubmitBtn">수정하기</button>
								</td>
							</tr>
						</tfoot>
					</table>
					<!-- table#joinTbl -->
				</form>
				<!-- form#modifyFrm -->
			</div>
			<!-- div#myPageArea -->
		</div>
		<!-- div#wrap -->
		
		<iframe src="/iframe/iframe_footer.jsp" id="iframe_footer" scrolling="no"></iframe>

	</body>
</html>