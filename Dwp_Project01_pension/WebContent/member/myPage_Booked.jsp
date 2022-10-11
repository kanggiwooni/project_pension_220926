<%@page import="java.text.DecimalFormat"%>
<%@page import="pack_Booking.BookingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="bDAO" class="pack_Booking.BookingDAO" />
<jsp:useBean id="bVO" class="pack_Booking.BookingVO" />
<%
request.setCharacterEncoding("UTF-8");
String uid = (String)session.getAttribute("uidKey");
List<BookingVO> objList =  bDAO.mtd_bookInfo(uid);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>예약내역 확인</title>
	<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_Member.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_Booking.js"></script>
</head>
<body>

	<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>

	<div id="wrap" class="dFlex bookedWrap">
		<div id="myPageLnbArea">
			<ul id="myPageLnb">
				<li><a href="/member/myPage_Booked.jsp">예약내역 확인</a></li>
				<li><a href="/member/myPage_Mod.jsp">회원정보 수정</a></li>
				<li><a onclick="resign()">회원 탈퇴하기</a></li>
			</ul>
		</div>
		<!-- div#myPageLnbArea -->
		
		<div id="bookInfoArea">
			<h1>예약내역 확인</h1>
			<table id="bookTbl">
				<tbody>
					<tr>
						<th>예약번호</th>
						<th>날짜</th>
						<th>인원</th>
						<th>객실</th>
						<th>예약자명</th>
						<th>연락처</th>
						<th>결제금액</th>
					</tr>
					<%
					if (objList.isEmpty()) {
						out.print("<tr>");
						for (int i = 0; i < 7; i++) {
							out.print("<td>-</td>");
						}
						out.print("</tr>");
					} else {
						String decimalFormat = "#,### 원";
						DecimalFormat df = new DecimalFormat(decimalFormat);
						
						for (int i = 0; i < objList.size(); i++) {
							bVO = objList.get(i);
							%>
							<tr>
								<td><%=bVO.getbNum()%></td>
								<td><%=bVO.getbDate()%></td>
								<td><%=bVO.getbPeople()%></td>
								<td><%=bVO.getrName()%></td>
								<td><%=bVO.getuName()%></td>
								<td><%=bVO.getuPhone()%></td>
								<td><%=df.format(bVO.getPayPrice())%></td>
							</tr>
							<%
						}
					}
					%>
				</tbody>
			</table>
			<!-- table#bookTbl -->
		</div>
		<!-- div#bookInfoArea -->
	</div>
	<!-- div#wrap -->
	
	<iframe src="/iframe/iframe_footer.jsp" id="iframe_footer" scrolling="no"></iframe>
	
</body>
</html>