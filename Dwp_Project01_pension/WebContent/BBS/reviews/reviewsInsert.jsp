<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>

<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO"></jsp:useBean>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>이용후기 글쓰기 페이지</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_BBS.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_BBS.js"></script>
	</head>
	<body>
		<iframe src="/iframe/iframe_header.jsp" scrolling="no" id="iframe_header"></iframe> 
		<div id="wrap" class="bbs_reviewsWrap">
			
			<h1>이용후기 Review</h1>
			<hr>
			<table>
				<tbody>
					<tr>
						<td colspan="2">글쓰기</td>						
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" form="reviewsInsert"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" form="reviewsInsert"></textarea></td>
					</tr>
					<tr>
						<td>파일첨부</td>
						<td><input type="file" name="uploadFileName" form="reviewsInsert"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<button form="reviewsInsert">확인</button>
							<button onclick="location.href = '/BBS/reviews/reviews.jsp'">목록보기</button>
						</td>
					</tr>
				</tfoot>
			</table>

		</div>
		<!-- div#wrap -->
		<form action="/BBS/reviews/reviewsInsertProc.jsp" id="reviewsInsert" method="post" enctype="multipart/form-data"></form>
		<iframe src="/iframe/iframe_footer.jsp" scrolling="no" id="iframe_footer"></iframe>
	</body>
</html>