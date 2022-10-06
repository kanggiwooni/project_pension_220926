<%@page import="pack_member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="bDAO" class="pack_Booking.BookingDAO" />
<jsp:useBean id="bVO" class="pack_Booking.BookingVO" />
<%
request.setCharacterEncoding("UTF-8");
MemberVO mVO = (MemberVO)session.getAttribute("bean");

bVO.setbDate(request.getParameter("bDate"));
bVO.setbPeople(Integer.parseInt(request.getParameter("bPeople")));
bVO.setrNum(Integer.parseInt(request.getParameter("rNum")));
bVO.setrName(request.getParameter("rName"));
bVO.setUid(mVO.getUid());
bVO.setuName(mVO.getuName());
bVO.setuPhone(request.getParameter("uPhone"));
bVO.setuEmail(request.getParameter("uEmail"));
bVO.setuRequest(request.getParameter("uRequest"));
bVO.setPayPrice(Integer.parseInt(request.getParameter("payPrice")));

int rtnCnt = bDAO.mtd_insertBooking(bVO);
%>
<script>
	alert("예약이 완료되었습니다.");
	location.href = "/booking/bookCalendar.jsp";
</script>