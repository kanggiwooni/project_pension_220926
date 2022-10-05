<%@page import="pack_BBS.BBS_VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>

<jsp:useBean id="objBBSDAO" class="pack_BBS.BBS_DAO" />
<%
String uid_Session = (String)session.getAttribute("uidKey");
BBS_VO objVO = null;
String bbs="reviews";


///////////////////////페이징 관련 속성 값 시작///////////////////////////
int totalRecord = 0;        // 전체 데이터 수(DB에 저장된 row 개수)
int numPerPage =  3;    // 페이지당 출력하는 데이터 수(=게시글 숫자)
int pagePerBlock = 5;   // 블럭당 표시되는 페이지 수의 개수
int totalPage = 0;           // 전체 페이지 수
int totalBlock = 0;          // 전체 블록수

/*  페이징 변수값의 이해 
totalRecord=> 200     전체레코드
numPerPage => 3
pagePerBlock => 3
totalPage => 67(66.666)
totalBlock => 14  (67/3 => 13.4)
*/

int nowPage = 1;          // 현재 (사용자가 보고 있는) 페이지 번호
int nowBlock = 1;         // 현재 (사용자가 보고 있는) 블럭

int start = 0;     // DB에서 데이터를 불러올 때 시작하는 인덱스 번호
int end = 5;     // 시작하는 인덱스 번호부터 반환하는(=출력하는) 데이터 개수 
    // select * from T/N where... order by ... limit start, end;

int listSize = 0;    // 1페이지에서 보여주는 데이터 수
	//출력할 데이터의 개수 = 데이터 1개는 가로줄 1개

//게시판 검색 관련소스
//String keyField = ""; // DB의 컬럼명
//String keyWord = ""; // DB의 검색어
	
/* if (request.getParameter("keyWord") != null) {
keyField = request.getParameter("keyField");
keyWord = request.getParameter("keyWord");
} */


	
if (request.getParameter("nowPage") != null) {
nowPage = Integer.parseInt(request.getParameter("nowPage"));
start = (nowPage * numPerPage) - numPerPage;
end = numPerPage;            
}


/*
select * from BBS_reviews order by num desc limit 10, 10;
데이터가 100개   =>   num :  100  99   98    97 ... 91 |  90        1
 start, end :                        0    1    2     3....   9      10
페이지당 출력할 데이터 수 10개
현재 페이지 1페이지라면    => 1페이지의 출력결과   100 ~ 91
2페이지   90~81
3페이지    80~71
*/

totalRecord =objBBSDAO.mtd_getReviewsTotalCount();   
//전체 데이터 수 반환

totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);

///////////////////////페이징 관련 속성 값 끝///////////////////////////
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
			<hr>
			
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
					List<BBS_VO> objList = objBBSDAO.mtd_bbsList(start,end,bbs);
					listSize=objList.size();
					if(objList.isEmpty()){//게시글이없을경우
					%>
					<tr>
						<td colspan="5">게시글이없습니다</td>
					</tr>
					<%
					}else{
						for(int i=0;i<numPerPage;i++){
						/* for(int i=0;i<objList.size();i++){ */
							if(i==listSize){
								break;
							}
							objVO = objList.get(i);
					%>
					<tr>
						<td><%=objVO.getNum()%></td>
						<td class="reviewsTitle"><%=objVO.getTitle()%></td>
						<td><%=objVO.getUid()%></td>
						<td><%=objVO.getReportingDate()%></td>
						<td><%=objVO.getViews()%></td>
					</tr>					
					<%
						}
					}
					%>

				</tbody>
				<tfoot>
					<tr>
						<td colspan="4"></td>
						<%
						if(uid_Session==null){
						%>
						<td>
						</td>
						<%
						}else{
						%>
						<td>
							<a href="/BBS/reviews/reviewsInsert.jsp">
								<button type="button" id="reviewsWrite">글쓰기</button>
							</a>
						</td>						
						<%
						}
						%>
					</tr>
					<tr>
						<td colspan="5">
						<%
						int pageStart = (nowBlock - 1 ) * pagePerBlock + 1;
						int pageEnd = (nowBlock < totalBlock) ? pageStart + pagePerBlock - 1 :  totalPage;
						if(totalPage != 0){
							
							if(nowBlock>1){ //페이지블럭이 2개이상있고 현재 페이지 블럭이 첫번째 블럭이 아닐경우							
						%>
							<span class="moveBlockArea" onclick="moveBlock('<%=nowBlock%>','<%=pagePerBlock%>','prev')">&lt;</span>
						<%
							}
							// 페이지 나누기용 번호출력 시작
							for(int i=pageStart;i<=pageEnd;i++){
								if(i==nowPage){
									%>
									<span class="nowPageNum"><%=i %></span>
									<%
								}else{
									%>
									<span class="pageNum" onclick="movePage(<%=i%>)"><%=i %> </span>
									<%
								}
							}
							// 페이지 나누기용 번호출력 시작
							
							if(totalBlock>nowBlock){ //페이블럭이 더있을경우
								%>
								<span class="moveBlockArea" onclick="moveBlock('<%=nowBlock%>','<%=pagePerBlock%>','next')">&gt;</span>
								<%
							}
						}
						%>
						</td>
					</tr>
				</tfoot>
			</table>
			
		</div>
		<!-- div#wrap -->
		<iframe src="/iframe/iframe_footer.jsp" scrolling="no" id="iframe_footer"></iframe>
	</body>
</html>