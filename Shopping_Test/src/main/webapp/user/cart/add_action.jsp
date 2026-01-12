<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String referer = request.getHeader("Referer");
	out.print("이전 경로 : " + referer);
	
	// TODO: 상품ID 넘겨받기
	String productId = ❓❓❓
	out.print(productId);

	// TODO: 상품 정보 조회
	ProductRepository productDAO = new ProductRepository();
	Product product = ❓❓❓
	
	// 존재하지 않는 상품일 때
	if( product == null ) {
		String root = request.getContextPath();
		response.sendRedirect(root + "error/exception");
		// 테스트 해보기
	}
	
	// TODO: 장바구니 목록 세션 정보 등록
	List<Product> list = (List<Product>) ❓❓❓
	// 최초 장바구니 담기
	if( list == null ) {
		list = new ArrayList<Product>();
		session.setAttribute("cartList", list);
	}
	
	int cnt = 0;
	Product productItem = new Product();
	
	for(int i = 0 ; i < list.size() ; i++) {
		productItem = list.get(i);
		// TODO: 기존의 장바구니 목록의 상품과 지금 추가하는 상품이 같으면, 개수를 누적
		if( productItem.getProductId().equals(productId) ) {
			cnt++;
			int count = ❓❓❓;	// 장바구니 개수 누적
			productItem.setQuantity(count);
		}
	}
	
	// 신규 상품을 장바구니 추가한 경우
	if( cnt == 0 ) {
		product.setQuantity(1);			// 최초 장바구니 개수 1
		list.add(product);				// 장바구니 목록에 신규 상품 추가
	}


	// TODO: 상품 목록 페이지로 이동
	❓❓❓

%>