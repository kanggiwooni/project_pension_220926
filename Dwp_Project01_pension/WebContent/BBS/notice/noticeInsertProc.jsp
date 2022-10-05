<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>

<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO" />

<%
request.setCharacterEncoding("UTF-8");
String uid = (String)session.getAttribute("uidKey");
String uName = (String)session.getAttribute("uNameKey");
String bbs = "notice";
int rtn = objBBSDAO.mtd_noticeWrite(request,uid,uName);

if(rtn==1){
	response.sendRedirect("/BBS/bbsInsertEnd.jsp?bbs="+bbs);
}else if(rtn==0){
	out.print("연결실패 ㅠㅠ");
}

%>
