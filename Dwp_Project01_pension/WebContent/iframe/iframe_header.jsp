<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<%
String uid = (String) session.getAttribute("uidKey");
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>header</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="/style/style_Iframe.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_Iframe.js"></script>
	</head>
	<body>

	    <div id="headerWrap"> 

	        <header id="header" class="dFlex">
	
	            <div id="headerLogoArea">
	                <a id="mainPage">
	                    <img src="/images/logo_header.png" alt="로고이미지" width="210">
	                </a>
	            </div>
	            <!-- div#headerLogoArea -->

            	<nav id="headerGNBArea">
                
	                <ul id="mainMenu" class="dFlex">
	
	                    <li class="mainLi">
	                        <a>객실안내</a>
	                        <ul class="subMenu">
	                            <li class="subLi"><a>1번방</a></li>
	                            <li class="subLi"><a>2번방</a></li>
	                            <!--
	                            <li class="subLi"><a>3번방</a></li>
	                            <li class="subLi"><a>4번방</a></li>
	                            -->
	                        </ul>
	                    </li>
	
	                    <li class="mainLi">
	                        <a>예약안내</a>
	                        <ul class="subMenu">
	                            <li class="subLi"><a>실시간예약</a></li>
	                            <!-- 
	                            <li class="subLi"><a>판화</a></li>
	                            <li class="subLi"><a>공예/고대유물</a></li>
	                            <li class="subLi"><a>기외</a></li> 
	                            -->
	                        </ul>
	                    </li>
	
	                    <li class="mainLi">
	                        <a>커뮤니티</a>
	                        <ul class="subMenu">
	                            <li class="subLi">
	                            	<a id="noticePage">공지사항</a>
	                            </li>
	                            <li class="subLi">
	                            	<a>QnA</a>
	                            </li>
	                            <li class="subLi">
	                            	<a id="reviewsPage">이용후기</a>
	                            </li>
	                            <!--
	                            <li class="subLi"><a>공백</a></li>
	                            -->
	                        </ul>
	                    </li>
	                </ul>
	                <!-- ul#mainMenu -->

	            </nav>
	            <!-- nav#headerGNBArea -->
	            
	            <div id="headerMemArea">
	            	<% if (uid == null) { %>
						<a id="loginPage">로그인</a>
						<a id="joinPage">회원가입</a>
	            	<% } else { %>
	            		<a id="logoutPage">로그아웃</a>
						<a id="myPage">마이페이지</a>
	            	<% } %>
	            </div>
	            <!-- div#headerMemArea -->

	        </header>
	        <!-- header#header -->
	
	    </div>
	    <!-- div#headerWrap -->
	
	</body>
</html>