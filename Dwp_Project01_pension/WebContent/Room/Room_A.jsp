<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<%
String uName = (String) session.getAttribute("uNameKey");
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>객실A</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Common.css">
		<link rel="stylesheet" href="/style/style_Room.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_Iframe.js"></script>
		<script src="/script/script_Room.js"></script>
	</head>
	<body>
		
		<iframe src="/iframe/iframe_header.jsp" id="iframe_header" scrolling="no"></iframe>
		
		<div id="wrap" class="RoomWrap">
		
			<div id="SlideShowFrame">
            	<div id="pansionSlideShowImg">
	                <img src="/Room/Room_A_img/펜션A_1.jpg" alt="펜션A_1">
	                <img src="/Room/Room_A_img/펜션A_2.jpg" alt="펜션A_2">
	                <img src="/Room/Room_A_img/펜션A_3.jpg" alt="펜션A_3">
	                <img src="/Room/Room_A_img/펜션A_4.jpg" alt="펜션A_4">
	                <img src="/Room/Room_A_img/펜션A_5.jpg" alt="펜션A_5">
	            </div>
	        </div>
	        
	        <div class="room">
	        	<table class="roomInfo">
	        		<tbody>
	        			<tr>
	        				<th>객실타입</th>
	        				<th>기준/최대</th>
	        				<th colspan="2">비수기</th>
	        				<th colspan="2">성수기</th>	        				
	        			</tr>
	        			<tr>
	        				<td rowspan="2">203호</td>
	        				<td rowspan="2">2인</td>
	        				<td>주중</td>
	        				<td>주말</td>
	        				<td>주중</td>
	        				<td>주말</td>
	        			</tr>
	        			<tr>
	        			
	        			
	        				<td>70,000</td>	        				
	        				<td>90,000</td>
	        				<td>90,000</td>
	        				<td>110,000</td>
	        			</tr>
	        		</tbody>
	        	</table>
	        	<ul>
	        		<li>입실 기준인원 추가시 : 1인 10,000원 추가</li>
	        		<li>주말 : 금요일, 토요일</li>
	        		<li>성수기 : 7월25~8월15일</li>
	        		<li>객실공통구비사항 : 침대, 에어컨, 냉장고, TV, 전기주전자, <br>
	        	헤어드라이기, 전자레인지, 주방도구 일체</li>
	        		<li>Check In : 오후 3시 이후(오후 10시 이후 입실 고객님 께서는 <br>
	        	사전에 미리 연락 부탁드립니다.)</li>
	        		<li>Check Out : 오전 11시까지(오전 11시 ~ 오후 3시 까지는 객실<br>
	        	정리 시간입니다. 입실 허용시간 이전에 도착 하셔도 <br>
	        	입실하실 수 없습니다.)</li>
	        	</ul>
	        </div>
        
			<% if (uName != null) { %>
			<h1>
				환영합니다
				<%= uName %>님
			</h1>
			<% } else { %>
			<h1>
				로그인 해주세요
			</h1>
			<% } %>
			
		</div>
		<!-- div#wrap -->
		
		<iframe src="/iframe/iframe_footer.jsp" id="iframe_footer" scrolling="no"></iframe>
	
	</body>
</html>