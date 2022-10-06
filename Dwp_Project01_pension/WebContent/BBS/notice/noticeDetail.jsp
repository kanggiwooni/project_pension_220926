<%@page import="pack_BBS.BBS_VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO" />
<%
int num = Integer.parseInt(request.getParameter("num"));
int nowPage = Integer.parseInt(request.getParameter("nowPage"));

List<BBS_VO> objList = objBBSDAO.mtd_noticeDetail(num);
BBS_VO objVO = objList.get(0);	
String uid_Session = (String)session.getAttribute("uidKey");
String uid = objVO.getUid();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>공지사항 자세히보기</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_BBS.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_BBS.js"></script>
	</head>
	<body>
	
		<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>
	
		<div id="wrap" class="bbs_detailWrap">
			<h1>공지사항</h1>
			
			<table class="noticeDetailTBL">
				<tbody>
					<tr>
						<td colspan="2"><%=objVO.getTitle()%></td>

					</tr>
					<tr>
						<td class="userName">글쓴이 : <%=objVO.getuName()%></td>
						<td>작성일 : <%=objVO.getReportingDate()%> 조회 : <%=objVO.getViews()%></td>
					</tr>
					<tr>
						<td colspan="2"><%=objVO.getContent()%></td>

					</tr>
					<tr>
						<td></td>
						<td>
							<button onclick="location.href = '/BBS/notice/notice.jsp?nowPage=<%=nowPage%>'">목록보기</button>
							<%
								if(uid.equals(uid_Session)){
							%>
							<button onclick="location.href = '/BBS/notice/noticeModify.jsp?num='+<%=num%>">수정</button>
							<%-- <button onclick="location.href = '/BBS/notice/noticeDelete.jsp?num='+<%=num%>">삭제</button> --%>
							<button id="noticeDeleteBtn" value="<%=num%>">삭제</button>
							<%} %>
						</td>
					</tr>
				</tbody>
			</table>
			
		</div>
		<!-- div#wrap -->
		
		<iframe src="/iframe/iframe_footer.jsp" id="iframe_footer" scrolling="no"></iframe>
	
	</body>
</html>