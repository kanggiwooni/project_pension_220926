<%@page import="pack_BBS.BBS_VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO" />
<%
int num = Integer.parseInt(request.getParameter("num"));
int nowPage = Integer.parseInt(request.getParameter("nowPage"));

List<BBS_VO> objList = objBBSDAO.mtd_reviewsDetail(num);
BBS_VO objVO = objList.get(0);	
String uid_Session = (String)session.getAttribute("uidKey");
String uName = (String)session.getAttribute("uNameKey");
String uid = objVO.getUid();
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>이용후기 자세히보기</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_BBS.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_BBS.js"></script>
	</head>
	<body>
	
		<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>
	
		<div id="wrap" class="bbs_detailWrap">
			<h1>이용후기</h1>
			
			<table class="reviewsDetailTBL">
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
							<button onclick="location.href = '/BBS/reviews/reviews.jsp?nowPage=<%=nowPage%>'">목록보기</button>
							<%
								if(uid.equals(uid_Session)){
							%>
							<button onclick="location.href = '/BBS/reviews/reviewsModify.jsp?num='+<%=num%>">수정</button>
							<%-- <button onclick="location.href = '/BBS/reviews/reviewsDelete.jsp?num='+<%=num%>">삭제</button> --%>
							<button id="reviewsDeleteBtn" value="<%=num%>">삭제</button>
							<%} %>
						</td>
					</tr>
				</tbody>
			</table>
<%
List<BBS_VO> objCommentList = objBBSDAO.mtd_reviewsDetailComment(num);
%>
			<table class="reviewsDetailCommentTBL">
				<tbody>
				<%
					for(int i=0; i<objCommentList.size();i++){
				%>						
					<tr>
						<td><%=objCommentList.get(i).getuName() %>(<%=objCommentList.get(i).getUid() %>)</td>
					</tr>
					<tr>
						<td><%=objCommentList.get(i).getComment() %></td>
					</tr>
					<tr>
						<td><%=objCommentList.get(i).getReportingDate() %></td>
					</tr>
				<%
					}
				%>

					<tr >
						<td id="commentTD">댓글쓰기</td>						
					</tr>
					<%
					if(uid_Session !=null){
					%>
					<tr>
						<td><%=uName %>(<%=uid %>)</td>
					</tr>
					<%
					}else{						
					%>
					<tr>
						<td>비회원</td>
					</tr>
					<%
					}
					%>
					<tr>
						<td><textarea name="comment" id="comment" form="commentFrm"></textarea></td>
						<%
						if(uid_Session !=null){
						%>
						<td><button onclick="fnCommentChk()" form="commentFrm">등록</button></td>
						<%							
						}else{
						%>
						<td><button onclick="fnWarning()" type="button">등록</button></td>
						<%
						}
						%>
					</tr>
				</tbody>
			</table>
			<input type="hidden" form="commentFrm" value="<%=num%>" name="num">
			<input type="hidden" form="commentFrm" value="<%=uName%>" name="uName">
			<input type="hidden" form="commentFrm" value="<%=uid%>" name="uid">
			<input type="hidden" form="commentFrm" value="<%=nowPage%>" name="nowPage">
			<form action="/BBS/reviews/reviewsCommentProc.jsp" id="commentFrm"></form>
			
		</div>
		<!-- div#wrap -->
		
		<iframe src="/iframe/iframe_footer.jsp" id="iframe_footer" scrolling="no"></iframe>
	
	</body>
</html>