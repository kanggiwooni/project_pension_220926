<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pack_member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="bDAO" class="pack_Booking.BookingDAO" />
<jsp:useBean id="rVO" class="pack_Booking.RoomVO" />    
<jsp:useBean id="mVO" class="pack_member.MemberVO" />
<%
request.setCharacterEncoding("UTF-8");
mVO = (MemberVO)session.getAttribute("bean");

String rName = request.getParameter("rName");
String bDate = request.getParameter("bDate");

String dateFormat = "yyyy년 MM월 dd일 (E)";
SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);

Calendar cal = Calendar.getInstance();
String[] weekArr = {"일", "월", "화", "수", "목", "금", "토"};

String[] dateArr = bDate.split("-");
cal.set(Calendar.YEAR, Integer.parseInt(dateArr[0]));
cal.set(Calendar.MONTH, Integer.parseInt(dateArr[1])-1);
cal.set(Calendar.DATE, Integer.parseInt(dateArr[2]));

int year = cal.get(Calendar.YEAR);					// 선택 연도
int month = cal.get(Calendar.MONTH);			// 선택 월
int date = cal.get(Calendar.DATE);					// 선택 일
int day = cal.get(Calendar.DAY_OF_WEEK);		// 선택 요일

// 선택한 객실 정보 가져오기
rVO = bDAO.mtd_getRoomInfo(rName);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>예약하기</title>
	<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Booking.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_Booking.js"></script>
</head>
<body>

	<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>

	<div id="wrap" class="bookWrap">
		<form action="/member/bookProc.jsp" id="bookFrm">
			<table id="bookTbl">
				<caption>* 표시는 필수 입력사항입니다.</caption>
				<tbody>
					<tr>
						<td>객실명</td>
						<td>
							<%=rName%>
						</td>
					</tr>
					
					<tr>
						<td>이용일</td>
						<td class="accent">
							<%=sdf.format(cal.getTime())%>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button">날짜 변경하기 (미구현)</button>
						</td>
					</tr>
					
					<tr>
						<td>*인원</td>
						<td>
							<input type="number" id="bPeople" name="bPeople"
								value="2" min="1" max="<%=rVO.getrLimit()%>">
							<span class="guideTxt">최대인원 : <%=rVO.getrLimit()%>명</span>
						</td>
					</tr>
					
					<tr>
						<td>*예약자명</td>
						<td>
							<input type="text" id="uName" name="uName"
							value="<%=mVO.getuName()%>" maxlength="30">
							<span class="guideTxt">반드시 실명으로 입력해주세요.</span>
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
							value="<%=uBirth%>" maxlength="6" placeholder="생년월일">
							<span class="guideTxt">6자리 숫자로 입력해주세요. 예시) 930428</span>
						</td>
					</tr>
					
					<tr>
						<td>*연락처</td>
						<td>
							<%
							String uPhone = "";
							if (mVO.getuPhone() != null) uPhone = mVO.getuPhone();
							%>
							<input type="text" id="uPhone" name="uPhone"
							value="<%=uPhone%>" maxlength="11" placeholder="연락처">
							<span class="guideTxt">숫자만 입력해주세요. 예) 01012345678</span>
						</td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td>
							<%
							String uEmail = mVO.getuEmail();
							String uEmail1 = "";
							String uEmail2 = "";
							if (uEmail != null) {
								int idx = uEmail.indexOf("@");
								uEmail1 = uEmail.substring(0, idx);
								uEmail2 = uEmail.substring(idx+1);
							}
							%>
							<input type="text" id="uEmail1" name="uEmail"
							value="<%=uEmail1%>">
							@
							<input type="text" id="uEmail2"
							value="<%=uEmail2%>">
							
							<select id="selectEmail">
								<option value="">직접입력</option>
								<option>naver.com</option>
								<option>google.com</option>
								<option>daum.net</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>예약요청사항</td>
						<td>
							<textarea name="uRequest" id="uRequest"
							rows="10" maxlength="200" placeholder="요청사항(최대 200자)"></textarea>
						</td>
					</tr>
					
					<tr>
						<td>결제금액</td>
						<td class="accent">
							<%
							String decimalFormat = "#,### 원";
							DecimalFormat df = new DecimalFormat(decimalFormat);
							// 주말 요금 +20000원
							int payPrice = rVO.getrPrice();
							int weekendPrice = 20000;
							if (day == 1 || day == 7) payPrice += weekendPrice;
							%>
							<%=df.format(payPrice)%>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<button type="button" id="bookCalendarBtn"
							onclick="location.href='/booking/bookCalendar.jsp'">다시 선택하기</button>
							<button type="button" id="bookSubmitBtn">결제하기</button>
						</td>
					</tr>
				</tfoot>
			</table>
			<!-- table#bookTbl -->
			<%
			int rNum = rVO.getNum();
			%>
			<input type="hidden" name="bDate" value="<%=bDate%>">
			<input type="hidden" name="rNum" value="<%=rNum%>">
			<input type="hidden" name="rName" value="<%=rName%>">
			<input type="hidden" name="payPrice" value="<%=payPrice%>">
		</form>
		<!-- form#bookFrm -->
	</div>
	<!-- div#wrap -->
	
	<iframe src="/iframe/iframe_footer.jsp" id="iframe_footer" scrolling="no"></iframe>
	
</body>
</html>