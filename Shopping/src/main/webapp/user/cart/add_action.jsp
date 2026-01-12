<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String referer = request.getHeader("Referer");

	out.print("이전 경로 : " + referer);
	
	
	// 상품ID 넘겨받기
	String productId = request.getParameter("id");
	out.print(productId);

	// 존재하는 상품인지?
	ProductRepository productDAO = new ProductRepository();
	Product product = productDAO.getProductById(productId);
	
	// 존재하지 않는 상품일 때
	if( product == null ) {
		String root = request.getContextPath();
		response.sendRedirect(root + "error/exception");
		// 테스트 해보기
	}
	
	// 장바구니 목록 세션 정보 등록
	List<Product> list = (List<Product>) session.getAttribute("cartList");
	
	// 최초 장바구니 담기
	if( list == null ) {
		list = new ArrayList<Product>();
		session.setAttribute("cartList", list);
	}
	
	int cnt = 0;
	Product productItem = new Product();
	
	for(int i = 0 ; i < list.size() ; i++) {
		productItem = list.get(i);
		// 기존의 장바구니 목록의 상품과 지금 추가하는 상품이 같으면, 개수를 누적
		if( productItem.getProductId().equals(productId) ) {
			cnt++;
			int count = productItem.getQuantity() + 1;	// 장바구니 개수 누적
			productItem.setQuantity(count);
		}
	}
	
	// 신규 상품을 장바구니 추가한 경우
	if( cnt == 0 ) {
		product.setQuantity(1);			// 최초 장바구니 개수 1
		list.add(product);				// 장바구니 목록에 신규 상품 추가
	}
	// out.print("장바구니 처리");
	// 상품 목록 페이지로 이동
	response.sendRedirect("../product/list.jsp");

%>