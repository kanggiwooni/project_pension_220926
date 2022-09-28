<%@page import="pack_BBS.BBS_VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>

<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO"></jsp:useBean>
<%
BBS_VO objVO = null;
List<BBS_VO> objList = objBBSDAO.mtd_reviewsList();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>이용후기</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_BBS.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_BBS.js"></script>
	</head>
	<body>
		<iframe src="/iframe/iframe_header.jsp" scrolling="no" id="iframe_header"></iframe> 
		<div id="wrap" class="bbs_reviewsWrap">
			<h1>이용후기</h1>
			
			<table>
				<tbody>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
					<%
					for(int i=0;i<objList.size();i++){
						objVO = objList.get(i);
					%>
					<tr>
						<td><%=objVO.getNum()%></td>
						<td><%=objVO.getTitle()%></td>
						<td><%=objVO.getUid()%></td>
						<td><%=objVO.getReportingDate()%></td>
						<td><%=objVO.getViews()%></td>
					</tr>					
					<%
					}
					%>

				</tbody>
				<tfoot>
					<tr>
						<td colspan="4"></td>
						<td>
							<a href="/BBS/reviews/reviewsInsert.jsp">
								<button type="button" id="reviewsWrite">글쓰기</button>
							</a>
						</td>
					</tr>
				</tfoot>
			</table>
			
		</div>
		<!-- div#wrap -->
		<iframe src="/iframe/iframe_footer.jsp" scrolling="no" id="iframe_footer"></iframe>
	</body>
</html>