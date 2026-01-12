<%@page import="shop.dao.ProductRepository"%>
<%@page import="shop.dao.ProductIORepository"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.OrderRepository"%>
<%@page import="shop.dto.Order"%>
<%@page import="shop.dto.Ship"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String root = request.getContextPath();

	// 쿠키에 저장된 배송정보 불러오기
	String ship_cartId = "";
	String ship_name = "";
	String ship_date = "";
	String ship_country = "";
	String ship_zipCode = "";
	String ship_addressName = "";
	String ship_phone = "";
	
	Cookie[] cookies = request.getCookies();
	Order order = new Order();
	
	if( cookies != null ) {
		for(int i = 0 ; i < cookies.length ; i++) {
			Cookie cookie = cookies[i];
			String cookieName = cookie.getName();
			String cookieValue = URLDecoder.decode( cookie.getValue(), "UTF-8" ); 
			switch(cookieName) {
			 	case "ship_cartId" 			: ship_cartId = cookieValue;		order.setCartId(cookieValue);	break;
			 	case "ship_name" 			: ship_name = cookieValue;			order.setShipName(cookieValue);	break;
			 	case "ship_date" 			: ship_date = cookieValue;			order.setDate(cookieValue);		break;
			 	case "ship_country" 		: ship_country = cookieValue;		order.setCountry(cookieValue);	break;
			 	case "ship_zipCode" 		: ship_zipCode = cookieValue;		order.setZipCode(cookieValue);	break;
			 	case "ship_addressName" 	: ship_addressName = cookieValue;	order.setAddress(cookieValue);	break;
			 	case "ship_phone" 			: ship_phone = cookieValue;			order.setPhone(cookieValue);		break;
			}
		}
	}

	// 로그인 
	String loginId = (String) session.getAttribute("loginId");
	loginId = loginId != null ? loginId : "";
	
	
	// 회원, 비회원 주문 처리
	String loginStr = request.getParameter("login");
	String totalPrice = request.getParameter("totalPrice");
	// out.print(totalPrice);
	int total = 0;
	if( totalPrice != null && !totalPrice.isEmpty() ) {
		total = Integer.parseInt(totalPrice);
	}
	String orderPw = request.getParameter("orderPw");
	order.setTotalPrice(total);
	boolean login = loginStr != null ? Boolean.parseBoolean(loginStr) : false;
	// out.print("login  :" + login);
	
	// 회원 주문처리
	if( login ) {
		// out.print("회원 주문 처리...");
		order.setUserId(loginId);
	}
	// 비회원 주문처리
	else {
		// out.print("비회원 주문 처리...");
		order.setOrderPw(orderPw);			// 비회원 주문일 경우, 비회원 주문 내역 조회를 위해 주문용 비밀번호 등록
	}
	
	// - 주문 내역 등록
	OrderRepository orderDAO = new OrderRepository();
	int orderNo = orderDAO.insert(order);
	
	
	// - 입출고 등록
	// - 상품 재고수 갱신
	
	// 장바구니 목록을 세션에서 가져오기
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	ProductIORepository productIODAO = new ProductIORepository();
	ProductRepository productDAO = new ProductRepository();
	for(Product product : cartList ) {
		product.setOrderNo(orderNo);
		product.setUserId(loginId);
		product.setType("OUT");
		productIODAO.insert(product);		// 출고 등록
		productDAO.update(product);					// 상품 재고수 갱신
	}
	
	// 주문 완료 후, 장바구니 목록 전체 삭제 (session 만료)
	// session.invalidate();		// 로그인 기능 적용 시, 로그아웃 처리되므로 수정
	session.setAttribute("cartList", null);
	
	
	// 배송 정보를 저장한 쿠키는 삭제
	if( cookies != null ) {
		for(int i = 0 ; i < cookies.length ; i++) {
			Cookie cookie = cookies[i];
			String cookieName = cookie.getName();
			cookie.setValue("");
			switch(cookieName) {
			 	case "ship_cartId" 			: cookie.setMaxAge(0); break;
			 	case "ship_name" 			: cookie.setMaxAge(0); break;
			 	case "ship_date" 			: cookie.setMaxAge(0); break;
			 	case "ship_country" 		: cookie.setMaxAge(0); break;
			 	case "ship_zipCode" 		: cookie.setMaxAge(0); break;
			 	case "ship_addressName" 	: cookie.setMaxAge(0); break;
			}
			response.addCookie(cookie);
		}
	}
	
	// 주문 완료 페이지로 리다이렉트
	response.sendRedirect(root + "/user/order/complete.jsp?cartId=" + ship_cartId + "&addressName=" + URLEncoder.encode(ship_addressName, "UTF-8"));
%>
