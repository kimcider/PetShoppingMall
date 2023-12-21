<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/css/common/template.css">
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header_seller.jsp" %>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_seller.jsp"%>
            </div>
			<div class="contentsright">
				<div>
				환불목록
					<c:if test="${not empty orderMainList}">
						<c:forEach var="orders" items="${orderMainList}" varStatus="mainstatus">
							<c:set var="deliverStatus" value="배송시작"/>
							주문번호: ${orders.no }<br>
							<c:if test="${not empty orderDetailList}">
								<c:forEach var="orderdetails" items="${orderDetailList[mainstatus.index]}" varStatus="status">
									<c:if test="${orderdetails.delivery_status == 2}"><c:set var="deliverStatus" value="배송완료"/></c:if>
									<table border="1">
										<thead><tr> <th>제품명</th><th>옵션</th><th>판매가</th><th>할인가</th>
													<th>수량</th><td>환불상태</td> </tr></thead>
										<tr <c:if test="${orderdetails.refound_status == 1}">style="color:red"</c:if>>
											<td>${orderdetails.product_name}</td>
											<td>
												<c:if test="${not empty orderdetails.options}">
													<c:forEach var="orderoptions" items="${orderdetails.options}" varStatus="status">
														${orderoptions.title} : ${orderoptions.content} <br>
													</c:forEach>
												</c:if>
												<c:if test="${empty orderdetails.options}">옵션없음</c:if>
											
											<td>${orderdetails.product_price}</td><td>${orderdetails.discount}</td><td>${orderdetails.quantity}</td>
											<td>
												<c:if test='${orderdetails.refound_status == 1}'>환불요청</c:if>
												<c:if test='${orderdetails.refound_status == 2}'>환불완료</c:if>
											</td>
										</tr>
									</table>
									환불 사유: ${orderdetails.reason}<br>
									
								</c:forEach>
								<br>환불자정보<br>
								이름: ${orders.user_name } 연락처: ${orders.user_phone } <br>
								주문일시: ${orders.order_date } 배송상태: ${deliverStatus}<br>
								
								<c:if test='${deliverNo != null && deliverNo != ""}'>
									운송장 번호: ${orderdetails.delivery_no}
									<c:if test='${deliverStatus == "배송시작"}'>도착예정일: ${deliveryList[mainstatus.index].due_date}</c:if>
									<c:if test='${deliverStatus == "배송완료"}'>도착일: ${deliveryList[mainstatus.index].arrival_date}</c:if>
								</c:if>
								
								<br><br><hr><br>
							</c:if>
						</c:forEach>
					</c:if>
					
				</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
   	
</body>
</html>