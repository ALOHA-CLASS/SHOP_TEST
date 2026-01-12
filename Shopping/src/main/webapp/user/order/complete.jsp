<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>   
	<% 
		// 파라미터로 주문번호와 배송지 받기
		String ship_cartId = request.getParameter("cartId");
		String ship_addressName = request.getParameter("addressName");
		
		ship_cartId = ship_cartId != null ? ship_cartId : "";
		ship_addressName = ship_addressName != null ? ship_addressName : "";
	%>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 완료</h1>
	</div>
	
	<!-- 주문 완료 확인 -->
	
	<div class="container order mb-5 p-5">
		
		<h2 class="text-center">주문이 완료되었습니다.</h2>
		<!-- 주문정보 -->
		<div class="ship-box">
			<table class="table ">
				<tr>
					<td>주문번호 :</td>
					<td><%= ship_cartId %></td>
				</tr>
				<tr>
					<td>배송지 :</td>
					<td><%= ship_addressName  %></td>
				</tr>
			</table>
			
			<div class="btn-box d-flex justify-content-center">
				<a href="${ root }/user/my/order.jsp" class="btn btn-primary btn-lg px-4 gap-3">주문내역</a>
			</div>
		</div>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





