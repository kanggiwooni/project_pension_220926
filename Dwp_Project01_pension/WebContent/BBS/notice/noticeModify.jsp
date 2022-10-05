<%@page import="pack_BBS.BBS_VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO" />
<%
int num = Integer.parseInt(request.getParameter("num"));
String bbs = "notice";
List<BBS_VO> objList = objBBSDAO.mtd_noticeDetail(num);
BBS_VO objVO = objList.get(0);	
String uid_Session = (String)session.getAttribute("uidKey");
String uid = objVO.getUid();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>공지사항 수정 페이지</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_BBS.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_BBS.js"></script>
	</head>
	<body>
		<iframe src="/iframe/iframe_header.jsp" scrolling="no" id="iframe_header"></iframe> 
		<div id="wrap" class="bbs_noticeWrap">
			
			<h1>수정 페이지</h1>
			<hr>
			<input type="hidden" name="num" form="noticeModify" value="<%=num%>">
			<input type="hidden" name="bbs" form="noticeModify" value="<%=bbs%>">
			<table>
				<tbody>
					<tr>
						<td colspan="2">글쓰기</td>	
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" form="noticeModify" value="<%=objVO.getTitle()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" form="noticeModify"><%=objVO.getContent()%></textarea></td>
					</tr>
					<!-- <tr>
						<td>파일첨부</td>
						<td><input type="file" name="uploadFileName" form="noticeModify"></td>
					</tr> -->
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<button form="noticeModify">수정</button>
							<button onclick="location.href = '/BBS/notice/noticeDetail.jsp?num='+<%=num%>">목록보기</button>
						</td>
					</tr>
				</tfoot>
			</table>

		</div>
		<!-- div#wrap -->
		<form action="/BBS/bbsModifyProc.jsp" id="noticeModify"></form>
		<iframe src="/iframe/iframe_footer.jsp" scrolling="no" id="iframe_footer"></iframe>
	</body>
</html>