<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>예약페이지</title>
	<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Booking.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script.js"></script>
</head>
<body>

	<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>

	<div id="wrap" class="calendarWrap">
		<h1>예약 달력 페이지</h1>
		<hr>
		
		<%
		Calendar cal = Calendar.getInstance(); // 
		out.print(cal.toString());
		out.print("<br><br>");
		
		out.print("현재 날짜/시간 => cal.getTime() : " + cal.getTime() + "<br>");
		out.print("현재 날짜의 요일 => cal.get(Calendar.DAY_OF_WEEK) : " + cal.get(Calendar.DAY_OF_WEEK) + "<br>");
		out.print("현재 연도 => cal.get(Calendar.YEAR) : " + cal.get(Calendar.YEAR) + "<br>");
		out.print("현재 월 => cal.get(Calendar.MONTH) : " + cal.get(Calendar.MONTH) + "<br>");
		out.print("현재 일 => cal.get(Calendar.DATE) : " + cal.get(Calendar.DATE) + "<br>");
		
		out.print("이번 연도의 몇째주 => cal.get(Calendar.WEEK_OF_YEAR) : " + cal.get(Calendar.WEEK_OF_YEAR) + "<br>");
		out.print("이번 달의 몇째주 => cal.get(Calendar.WEEK_OF_MONTH) : " + cal.get(Calendar.WEEK_OF_MONTH) + "<br>");
		
		cal.set(Calendar.DATE, 1);
		
		out.print("이번 달의 시작 일의 요일 => (날짜 set 후) cal.get(Calendar.DAY_OF_WEEK) : " + cal.get(Calendar.DAY_OF_WEEK) + "<br>");
		out.print("이번 달의 마지막 일 => cal.getActualMaximum(Calendar.DATE) : " + cal.getActualMaximum(Calendar.DATE) + "<br>");
		out.print("이번 달의 마지막 주 => cal.getActualMaximum(Calendar.WEEK_OF_MONTH) : " + cal.getActualMaximum(Calendar.WEEK_OF_MONTH) + "<br>");
		
		out.print("<br><br>");
		
		/*
		cal.set(Calendar.YEAR,2021);
		cal.set(Calendar.MONTH,5);
		cal.set(Calendar.DATE,1);
		int year = cal.get(Calendar.YEAR); //2021
		int month = cal.get(Calendar.MONTH)+1; // 06
		int startDay = cal.get(Calendar.DATE); // 01
		int startDayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 3 : 화요일 : 일요일은 1
		int lastDay = cal.getActualMaximum(Calendar.DATE); // 6월의 마지막 날 : 30
		
		cal.set(Calendar.DATE, lastDay); // 6월의 마지막 날로 재 설정 : 2021-06-30
		int lastWeek = cal.get(Calendar.WEEK_OF_MONTH); // 마지막 주수 : 5
		*/
		
		String[] arrWeek = {"일","월","화","수","목","금","토"};
		int lastDay = cal.getActualMaximum(Calendar.DATE);
		int lastWeek = cal.getActualMaximum(Calendar.WEEK_OF_MONTH);
		out.print(lastDay + "<br>");
		out.print(lastWeek);
		
		
		cal.set(Calendar.MONTH, 11);
		cal.set(Calendar.DATE, 1);
		
		%>
		
		
		<table>
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
					out.print("<td>" + i + "일의 요일 : " + arrWeek[dayWeek - 1] + "</td>");
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