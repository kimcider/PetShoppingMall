 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					 <h2>로그인</h2>
					    <form action="login.do" method="post">
					        <div>
					            <div>
					                아이디<br>
					                <input type="text" name="id">
					            </div>
					            <div>
					                비밀번호<br>
					                <input type="password" name="password">
					            </div>
					            <div>
					                <a href="">회원 가입</a>
					                <input type="submit" value="로그인">
					            </div>
					            <div>
					                <a href="">아이디 찾기</a> / <a href="">비밀번호 찾기</a>
					            </div>
					        </div>
					    </form>
					    <a href="">판매자로 로그인하기</a>
				</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>
 
 
