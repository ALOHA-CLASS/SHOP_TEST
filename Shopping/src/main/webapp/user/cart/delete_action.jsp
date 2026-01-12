<%--
	세션에서 장바구니 상품 삭제
 --%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String productId = request.getParameter("id");
	String cartId = request.getParameter("cartId");

	// 장바구니 전체 삭제
	if( productId == null && cartId != null ) {
		session.setAttribute("cartList", null);	
		response.sendRedirect("cart.jsp");
		return;
	}

	// 장바구니 개별 항목 삭제
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	
	if( cartList == null ) {
		response.sendRedirect("cart.jsp");
		return;
	}
	
	
	for(int i = 0 ; i < cartList.size() ; i++) {
		Product product = cartList.get(i);
		
		// 삭제할 장바구니 상품
		if( product.getProductId().equals(productId) ) {
			cartList.remove( product );
			break;
		}
	}
	response.sendRedirect("cart.jsp");
	
%>









