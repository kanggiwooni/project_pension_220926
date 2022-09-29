<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO" />
<%
int num = Integer.parseInt(request.getParameter("num"));
objBBSDAO.mtd_upCount(num);
response.sendRedirect("/BBS/reviews/reviewsDetail.jsp?num="+num);
%>