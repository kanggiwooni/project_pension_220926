<%@page import="pack_BBS.BBS_VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO" />
<%
int num = Integer.parseInt(request.getParameter("num"));
List<BBS_VO> objList = objBBSDAO.mtd_reviewsDetail(num);
BBS_VO objVO = objList.get(0);	
String uid_Session = (String)session.getAttribute("uidKey");
String uid = objVO.getUid();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_BBS.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_BBS.js"></script>
	</head>
	<body>
		<iframe src="/iframe/iframe_header.jsp" scrolling="no" id="iframe_header"></iframe> 
		<div id="wrap" class="bbs_reviewsWrap">
			
			<h1>수정 페이지</h1>
			<hr>
			<input type="hidden" name="num" form="reviewsModify" value="<%=num%>">
			<table>
				<tbody>
					<tr>
						<td colspan="2">글쓰기</td>	
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" form="reviewsModify" value="<%=objVO.getTitle()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" form="reviewsModify"><%=objVO.getContent()%></textarea></td>
					</tr>
					<!-- <tr>
						<td>파일첨부</td>
						<td><input type="file" name="uploadFileName" form="reviewsModify"></td>
					</tr> -->
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<button form="reviewsModify">수정</button>
							<button type="button">목록보기</button>
						</td>
					</tr>
				</tfoot>
			</table>

		</div>
		<!-- div#wrap -->
		<form action="/BBS/reviews/reviewsModifyProc.jsp" id="reviewsModify"></form>
		<iframe src="/iframe/iframe_footer.jsp" scrolling="no" id="iframe_footer"></iframe>
	</body>
</html>