<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
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
		// TODO: 쿠키에 저장된 배송 정보 불러오기
		// 힌트: ship_cartId, ship_name, ship_date, ship_country, ship_zipCode, ship_addressName, ship_phone 변수 선언 (빈 문자열로 초기화)
		String ship_cartId = "";
		String ship_name = "";
		String ship_date = "";
		String ship_country = "";
		String ship_zipCode = "";
		String ship_addressName = "";
		String ship_phone = "";
		
		// TODO: request에서 쿠키 배열을 가져오기
		// Cookie[] cookies = ???;
		Cookie[] cookies = null;
		
		// TODO: 쿠키 배열이 null이 아니면 반복문으로 각 쿠키 처리
		// 힌트: 쿠키 이름을 확인하고 switch문으로 각 변수에 값 할당
		// 힌트: URLDecoder.decode()를 사용하여 쿠키 값을 UTF-8로 디코딩
		
		
		
		
		
		
		
		
		
		
		
		
		// TODO: 세션에서 장바구니 목록(cartList) 가져오기
		// 힌트: session.getAttribute("cartList")를 사용하고 List<Product> 타입으로 캐스팅
		List<Product> cartList = null;
		// TODO: cartList가 null이면 새 ArrayList<Product>() 생성
		
		
		// TODO: 로그인 여부 확인
		// 힌트: loginId 변수를 확인하여 login 변수(boolean)와 order_type 변수(String) 설정
		String order_type = "";
		boolean login = false;
		
		
	%>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 정보</h1>
	</div>
	
	<!-- 주문 확인 영역 -->
	<div class="container order mb-5">
		<form action="add_action.jsp" method="post">
		<!-- 배송정보 -->
		<div class="ship-box">
			<table class="table ">
				<tr>
					<td>주문 형태 :</td>
					<td><%= order_type %></td>
				</tr>
				<tr>
					<td>성 명 :</td>
					<td><%= ship_name %></td>
				</tr>
				<tr>
					<td>우편번호 :</td>
					<td><%= ship_zipCode %></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><%= ship_addressName %></td>
				</tr>
				<tr>
					<td>배송일 :</td>
					<td><%= ship_date %></td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td><%= ship_phone %></td>
				</tr>
				<%
					// TODO: 로그인하지 않은 경우(!login)에만 주문 비밀번호 입력 필드 표시
					
				%>
				<tr>
					<td>주문 비밀번호 :</td>
					<td>
						<input type="password" class="form-control" name="orderPw" >
					</td>
				</tr>
				<%
					
				%>
			</table>
		</div>
		
		<!-- 주문목록 -->
		<div class="cart-box">
			<table class="table table-striped table-hover table-bordered text-center align-middle">
				<thead>
					<tr class="table-primary">
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<%
						// TODO: 총 금액 계산을 위한 변수 선언 및 초기화
						int sum = 0;
						
						// TODO: cartList의 모든 상품을 반복하며 출력
						// 힌트: for문 또는 향상된 for문 사용 (i < cartList.size())
						
							// TODO: i번째 상품 가져오기
							// Product product = ???;
							
							// TODO: 소계 계산 (상품 단가 * 수량)
							// int total = ???;
							
							// TODO: 총 금액에 소계 더하기
							
					%>
					<tr>
						<td><!-- TODO: 상품명 출력 --></td>			
						<td><!-- TODO: 단가 출력 --></td>			
						<td><!-- TODO: 수량 출력 --></td>			
						// TODO: 장바구니가 비어있는지 확인
						// 힌트: cartList.isEmpty() 사용
						
					%>
					<tr>
						<td colspan="5">추가된 상품이 없습니다.</td>	
					</tr>
					<%  %>
					<tr>
						<td></td>
						<td></td>
						<td>총액</td>
						<td><!-- TODO: 총 금액(sum) 출력 --></td>
						<td></td>
					</tr>
					<%
						 } else { %>
					<tr>
						<td></td>
						<td></td>
						<td>총액</td>
						<td><%= sum %></td>
						<td></td>
					</tr>
					<%
						}
					%>
				</tfoot>
			</table>
	
		</div>
		
		<!-- 버튼 영역 -->
		<div class="d-flex justify-content-between mt-5 mb-5">
			<div class="item">
				<a href="../shipment/add.jsp" class="btn btn-lg btn-success">이전</a>
				<!-- 취소 프로세스는 이어서... -->				
				<a href="" class="btn btn-lg btn-danger">취소</a>				
			</div>
			<div class="item">
				<input type="hidden" name="login" value="<%= login %>" />
				<input type="hidden" name="totalPrice" value="<%= sum %>" />
				<input type="submit" class="btn btn-lg btn-primary" value="주문완료" />	
			</div>
		</div>
		</form>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
















