<%@page import="pack_Booking.RoomVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="pack_Booking.BookingVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
    
<jsp:useBean id="bDAO" class="pack_Booking.BookingDAO" />
<jsp:useBean id="rVO" class="pack_Booking.RoomVO" />
<%
request.setCharacterEncoding("UTF-8");

/*
현재 날짜/시간 => cal.getTime()
현재 날짜의 요일 => cal.get(Calendar.DAY_OF_WEEK) : 일요일 1 ~ 토요일 7
현재 연도 => cal.get(Calendar.YEAR)
현재 월 => cal.get(Calendar.MONTH) : 0부터 시작 => 4 = 5월
현재 일 => cal.get(Calendar.DATE)

이번 연도의 몇째주 => cal.get(Calendar.WEEK_OF_YEAR)
이번 달의 몇째주 => cal.get(Calendar.WEEK_OF_MONTH)

이번 달의 시작 일의 요일 => (date = 1로 set 후) cal.get(Calendar.DAY_OF_WEEK)
이번 달의 마지막 일 => cal.getActualMaximum(Calendar.DATE)
이번 달의 마지막 주 => cal.getActualMaximum(Calendar.WEEK_OF_MONTH)

cal.set(Calendar.YEAR,2021);
cal.set(Calendar.MONTH,5);
cal.set(Calendar.DATE,1);
*/

String dateFormat = "yyyy년 MM월 dd일 (E)";
SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);

String decimalFormat = "#,###";
DecimalFormat df = new DecimalFormat(decimalFormat);

Calendar nowCal = Calendar.getInstance(); // 오늘 날짜 캘린더
String[] weekArr = {"일", "월", "화", "수", "목", "금", "토"};

int nowYear = nowCal.get(Calendar.YEAR);					// 오늘 연도
int nowMonth = nowCal.get(Calendar.MONTH);			// 오늘 월
int nowDate = nowCal.get(Calendar.DATE);					// 오늘 일
int nowDay = nowCal.get(Calendar.DAY_OF_WEEK);		// 오늘 요일

int monthParam = 0; // 이전 월 또는 다음 월 버튼 파라미터
int nowPageYear = 0; // 현재 페이지 연도
int nowPageMonth = 0; // 현재 페이지 월

Calendar cal = Calendar.getInstance();

if (request.getParameter("monthParam") != null) {
	
	monthParam = Integer.parseInt(request.getParameter("monthParam"));
	nowPageYear = Integer.parseInt(request.getParameter("nowPageYear"));
	nowPageMonth = Integer.parseInt(request.getParameter("nowPageMonth"));
	
	// 이전 월로 이동
	if (monthParam ==  1) {
		
		if (nowPageMonth == 1) {
			cal.set(Calendar.YEAR, nowPageYear - 1);
			cal.set(Calendar.MONTH, 11);
		} else {
			cal.set(Calendar.YEAR, nowPageYear);
			cal.set(Calendar.MONTH, nowPageMonth - 2);
		}
	
	// 다음 월로 이동
	} else if (monthParam == 2) {
		
		if (nowPageMonth == 12) {
			cal.set(Calendar.YEAR, nowPageYear + 1);
			cal.set(Calendar.MONTH, 0);
		} else {
			cal.set(Calendar.YEAR, nowPageYear);
			cal.set(Calendar.MONTH, nowPageMonth);
		}
	}
	
} else {
	cal.set(Calendar.YEAR, nowYear); // 현재 연도로 초기화
	cal.set(Calendar.MONTH, nowMonth); // 현재 월로 초기화
}

cal.set(Calendar.DATE, 1); // 1일로 초기화

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);
int day = cal.get(Calendar.DAY_OF_WEEK);

int lastDay = cal.getActualMaximum(Calendar.DATE); // 이번달의 마지막 날짜

// 모든 객실 정보 불러오기
List<RoomVO> objList = bDAO.mtd_getRoomInfo();

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>예약페이지</title>
	<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Booking.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_Booking.js"></script>
</head>
<body>

	<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>

	<div id="wrap" class="calendarWrap">
		<div id="selectMonthArea" class="dFlex">
			<button type="button" id="lastMonthBtn">&lt;</button>
			<h1>
				<span id="nowPageYear"><%=year%></span>.
				<span id="nowPageMonth"><%=month + 1%></span>
			</h1>
			<button type="button" id="nextMonthBtn">&gt;</button>
		</div>
		<!-- div#selectMonthArea -->
		<p style="text-align: center">
			오늘 날짜 : <%=sdf.format(nowCal.getTime())%>
		</p>
		
		<div id="tblHeadArea" class="dFlex">
			<div>예약 가능, 예약 완료 안내</div>
			<div>가격 보기 체크박스</div>
		</div>
		<!-- div#tblHeadArea -->
		
		<table id="calendarTbl">
			<tbody>
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
				<%
				// 달력 출력 부분 시작
				for (int i = 1; i <= lastDay; i++) {
					cal.set(Calendar.DATE, i);
					int dayWeek = cal.get(Calendar.DAY_OF_WEEK);
					
					// 1일 이전 빈칸 처리
					if (i == 1) {
						for (int j = 1; j < dayWeek; j++) { out.print("<td></td>"); }
					}
					
					if (dayWeek == 1) {
						out.print("<tr>");
					}
					
					out.print("<td>");
					out.print("<h4>" + i + "</h4>");
					
					Calendar compareCal = Calendar.getInstance(); // 날짜 비교용 캘린더 객체
					compareCal.set(year, month, i);
					
					if (compareCal.before(nowCal)) { // 오늘 이전의 날짜
						out.print("<span>예약종료</span>");
					} else {
						for (int j = 0; j < objList.size(); j++) {
							
							rVO = objList.get(j);
							
							String rName = rVO.getrName();
							int rPrice = rVO.getrPrice();
							
							// 주말 요금 +10000원
							if (dayWeek == 1 || dayWeek == 7) rPrice += 10000;
							
							// 예약 여부 확인
							int rNum = rVO.getNum();
							dateFormat = "yyyy-MM-dd";
							sdf = new SimpleDateFormat(dateFormat);
							String bDate = sdf.format(compareCal.getTime());
							
							String chkBooking = "";
							if (bDAO.mtd_chkBooking(rNum, bDate)) {
								chkBooking = "booked";
							} else {
								chkBooking = "noBooked";
							}
							
							out.print("<p class='dFlex' style='justify-content: space-between'>");
							out.print("<a class='" + chkBooking + "'>" + rName + "</a>");
							out.print("<span>" + df.format(rPrice) + "</span></p>");
						}
					}
					
					out.print("</td>");
					
					if (dayWeek == 7 && i < lastDay) {
						out.print("</tr>");
					}
					
					// 마지막일 이후 빈칸 처리
					if (i == lastDay) {
						for (int j = 0; j < 7 - dayWeek; j++) { out.print("<td></td>"); }
					}
					
				}
				// 달력 출력 부분 끝
				%>
			</tbody>
		</table>
		
	</div>
	<!-- div#wrap -->
	
	<iframe src="/iframe/iframe_footer.jsp" id="iframe_footer" scrolling="no"></iframe>
	
</body>
</html>