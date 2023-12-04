<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pet Makes the world</title>
<!-- 헤더스타일로 이름 -->
<link rel="stylesheet" href="/resources/css/common/header.css">


</head>
<body>
	<div class="header_wrap">
		<div id="header_frame">
			<div class="shape1"></div>
		</div>
		<div class="header_wrapbar">
			<div class="header_title">
				<!-- 헤더타이틀로 다바꾸기 -->
				<h1 id="header_shopname";>
					<a href="#"><b> Pet Meets World </b></a>
				</h1>
				<div class="header_menu">
					<ul>
						<li>
							<a href="#">판매자</a>
						</li>
						<li>
							<a href="#">헤더</a>
						</li>
						<li>
							<a href="#">입니다</a>
						</li>
					</ul>
				</div>
				<div class="header_search">
					<input type="text" placeholder="     검색어 입력"
						style="width: 300px; height: 30px; font-size: 10px; border: none;">
				</div>
				<c:if test="${empty sellerLoginInfo }">
					<div class="header_unlogin">
						<a href="/user/login.do">로그인</a> | <a href="/project/user/join.do">회원가입</a>
					</div>
				</c:if>
				<c:if test="${!empty sellerLoginInfo }">
					<div class="header_login">
						
						<!-- 아이콘이 그림인데 나중에는 버튼으로 바꾸어야함 -->
						<div class="header_user">
							<a href="/user/edit.do"><img src="/resources/img/common/user.png" align="right"></a>
						</div>

						<!-- 아이콘이 그림인데 나중에는 버튼으로 바꾸어야함 -->
						<div class="header_cart">
							<a href="#"><img src="/resources/img/common/cart.png" align="right"></a>
						</div>
						
						<div class="header_logout">
							<a href="/user/logout.do">로그아웃</a>
						</div>
					
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>