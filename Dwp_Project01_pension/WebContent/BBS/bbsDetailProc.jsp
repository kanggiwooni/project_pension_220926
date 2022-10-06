<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO" />
<%
int num = Integer.parseInt(request.getParameter("num"));
int nowPage = Integer.parseInt(request.getParameter("nowPage"));
String bbs = request.getParameter("bbs");
String url="/BBS/"+bbs+"/"+bbs;
objBBSDAO.mtd_bbsUpCount(num,bbs);
response.sendRedirect(url+"Detail.jsp?num="+num+"&nowPage="+nowPage);
%>