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
    

    <style>
    	.header{
    		width: 1200px;
    		height: 120px;
    	}
    
	    .wrap {
            width: 100%;
            margin: 0 auto;
            /* 가운데 정렬 */
        }
        
    	.contents{
    		
    		height: 1200px;
    		width: 1200px;
    	}
    	
    	.quickmenu{
    		width:12%;
    		height:100%;
    		float:left;
    	}
    	
    	.contentsright{
    		width:88%;
    		height:100%;
    		float:left;
    		padding-left:40px;
    	}
    	.footer-color {
    		position:absolute;
		 	width:1200px;
		 	background-color: #FFDE30;
		 	height:20px;
		}
    </style>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="./common/header.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="./common/quickmenu.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					이 부분을 수정하세요!!!
				</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>