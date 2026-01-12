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

	// TODO: 장바구니 개별 항목 삭제
	List<Product> cartList = (List<Product>) ❓❓❓;
	
	if( cartList == null ) {
		response.sendRedirect("cart.jsp");
		return;
	}
	
	
	for(int i = 0 ; i < cartList.size() ; i++) {
		Product product = cartList.get(i);
		
		// TODO: 삭제할 장바구니 상품
		// - 힌트: product.getId()와 productId 비교, product.getCartId()와 cartId 비교
		if( ❓❓❓ ) {
			cartList.remove( product );
			break;
		}
	}
	response.sendRedirect("cart.jsp");
	
%>









