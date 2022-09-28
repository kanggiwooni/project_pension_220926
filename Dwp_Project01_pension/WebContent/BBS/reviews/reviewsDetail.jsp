<%@page import="pack_BBS.BBS_VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
List<BBS_VO> objList = objBBSDAO.mtd_reviewsDetail(num);
BBS_VO objVO = objList.get(0);	
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
	
		<div id="wrap">
			<h1>이용후기</h1>
			<hr>
			
			<table>
				<tbody>
					<tr>
						<td colspan="2"><%=objVO.getTitle()%></td>

					</tr>
					<tr>
						<td>글쓴이 : <%=objVO.getUid()%></td>
						<td>작성일 : <%=objVO.getReportingDate()%> 조회 : <%=objVO.getViews()%></td>
					</tr>
					<tr>
						<td colspan="2"><%=objVO.getContent()%></td>

					</tr>
					<tr>
						<td></td>
						<td>
							<button></button>
							<button></button>
							<button onclick="location.href = '/BBS/reviews/reviews.jsp'">목록보기</button>
						</td>
					</tr>
				</tbody>
			</table>
			
		</div>
		<!-- div#wrap -->
	
	</body>
</html>