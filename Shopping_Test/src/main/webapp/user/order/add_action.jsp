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
	// TODO: 컨텍스트 경로 얻기
	// 힌트: request.getContextPath() 메소드 사용
	String root = "";

	// TODO: 쿠키에 저장된 배송정보를 저장할 변수 선언 및 초기화
	// 힌트: ship_cartId, ship_name, ship_date, ship_country, ship_zipCode, ship_addressName, ship_phone
	String ship_cartId = "";
	String ship_name = "";
	String ship_date = "";
	String ship_country = "";
	String ship_zipCode = "";
	String ship_addressName = "";
	String ship_phone = "";
	
	// TODO: request에서 쿠키 배열 가져오기
	// 힌트: request.getCookies() 메소드 사용
	Cookie[] cookies = null;
	
	// TODO: Order 객체 생성
	// 힌트: new Order() 생성자 사용
	Order order = null;
	
	// TODO: 쿠키 배열이 null이 아니면 반복문으로 각 쿠키 처리
	// 힌트: cookies != null 조건 확인
	
		// TODO: 반복문으로 모든 쿠키를 순회
		// 힌트: for(int i = 0; i < cookies.length; i++)
		
			// TODO: i번째 쿠키 객체 가져오기
			// Cookie cookie = cookies[i];
			
			// TODO: 쿠키 이름 가져오기
			// 힌트: cookie.getName() 메소드 사용
			String cookieName = "";
			
			// TODO: 쿠키 값 디코딩하기
			// 힌트: URLDecoder.decode(cookie.getValue(), "UTF-8") 사용
			String cookieValue = "";
			
			// TODO: switch문으로 쿠키 이름에 따라 해당 변수에 값 할당 및 order 객체에 설정
			// 힌트: case "ship_cartId": ship_cartId = cookieValue; order.setCartId(cookieValue); break;
			// 힌트: case "ship_name": order.setShipName() 메소드 사용
			// 힌트: case "ship_date": order.setDate() 메소드 사용
			// 힌트: case "ship_country": order.setCountry() 메소드 사용
			// 힌트: case "ship_zipCode": order.setZipCode() 메소드 사용
			// 힌트: case "ship_addressName": order.setAddress() 메소드 사용
			// 힌트: case "ship_phone": order.setPhone() 메소드 사용
			
			
		
	

	// TODO: 세션에서 로그인 아이디 가져오기
	// 힌트: session.getAttribute("loginId")를 String 타입으로 캐스팅
	String loginId = null;
	
	// TODO: loginId가 null이면 빈 문자열("")로 설정
	// 힌트: 삼항 연산자 사용 (loginId != null ? loginId : "")
	
	
	
	// TODO: 회원/비회원 주문 처리를 위한 파라미터 가져오기
	// 힌트: request.getParameter("login") - 로그인 여부
	String loginStr = "";
	
	// TODO: totalPrice 파라미터 가져오기
	// 힌트: request.getParameter("totalPrice") - 총 주문 금액
	String totalPrice = "";
	
	// TODO: 총 금액을 저장할 변수 선언 및 초기화
	int total = 0;
	
	// TODO: totalPrice가 null이 아니고 비어있지 않으면 int로 변환
	// 힌트: if(totalPrice != null && !totalPrice.isEmpty())
	// 힌트: Integer.parseInt(totalPrice) 사용
	
	
	
	// TODO: orderPw 파라미터 가져오기 (비회원 주문용 비밀번호)
	// 힌트: request.getParameter("orderPw")
	String orderPw = "";
	TODO: 주문 내역 등록
	// 힌트: OrderRepository 객체 생성 (new OrderRepository())
	OrderRepository orderDAO = null;
	
	// TODO: 주문 정보를 DB에 등록하고 주문번호 반환받기
	// 힌트: orderDAO.insert(order) 메소드 사용
	// 힌트: 반환값은 int 타입의 orderNo 변수에 저장
	int orderNo = 0;
	
	
	// TODO: 입출고 등록 및 상품 재고수 갱신
	
	// TODO: 세션에서 장바구니 목록 가져오기
	// 힌트: session.getAttribute("cartList")를 List<Product> 타입으로 캐스팅
	List<Product> cartList = null;
	
	// TODO: ProductIORepository 객체 생성 (입출고 처리용)
	// 힌트: new ProductIORepository()
	ProductIORepository productIODAO = null;
	
	// TODO: ProductRepository 객체 생성 (상품 재고 처리용)
	// 힌트: new ProductRepository()
	ProductRepository productDAO = null;
	
	// TODO: 장바구니의 모든 상품을 반복하며 처리
	// 힌트: for(Product product : cartList) 향상된 for문 사용
	
		// TODO: 상품에 주문번호 설정
		// 힌트: product.setOrderNo(orderNo)
		
		// TODO: 상품에 사용자 ID 설정
		// 힌트: product.setUserId(loginId)
		
		// TODO: 상품 입출고 타입을 "OUT"으로 설정
		// 힌트: product.setType("OUT")
		
		// TODO: 출고 등록
		// 힌트: productIODAO.insert(product) 메소드 사용
		
		// TODO: 상품 재고수 갱신
		// 힌트: productDAO.update(product) 메소드 사용
		
	
		// TODO: order 객체에 주문 비밀번호 설정
		//TODO: 주문 완료 후, 세션에서 장바구니 목록 삭제
	// 힌트: session.setAttribute("cartList", null) 사용
	// 참고: session.invalidate()를 사용하면 로그인까지 해제되므로 주의!
	
	
	
	// TODO: 배송 정보를 저장한 쿠키들을 삭제
	// 힌트: 쿠키 배열이 null이 아니면 반복문 실행
	
		// TODO: 모든 쿠키를 반복
		// 힌트: for(int i = 0; i < cookies.length; i++)
		
			// TODO: i번째 쿠키 객체 가져오기
			// Cookie cookie = cookies[i];
			
			// TODO: 쿠키 이름 가져오기
			// String cookieName = cookie.getName();
			
			// TODO: 쿠키 값을 빈 문자열로 설정
			// 힌트: cookie.setValue("")
			
			// TODO: switch문으로 배송 관련 쿠키만 삭제
			// 힌트: case "ship_cartId": cookie.setMaxAge(0); break;
			// 힌트: case "ship_name": cookie.setMaxAge(0); break;
			// 힌트: case "ship_date": cookie.setMaxAge(0); break;
			// 힌트: case "ship_country": cookie.setMaxAge(0); break;
			// 힌트: case "ship_zipCode": cookie.setMaxAge(0); break;
			// 힌트: case "ship_addressName": cookie.setMaxAge(0); break;
			// 참고: setMaxAge(0)은 쿠키를 즉시 삭제합니다
			
			
			// TODO: 변경된 쿠키를 응답에 추가
			// 힌트: response.addCookie(cookie)
			
		
	
	
	// TODO: 주문 완료 페이지로 리다이렉트
	// 힌트: response.sendRedirect() 메소드 사용
	// 힌트: URL 형식: root + "/user/order/complete.jsp?cartId=" + ship_cartId + "&addressName=" + URLEncoder.encode(ship_addressName, "UTF-8")
	// 힌트: URLEncoder.encode()는 한글을 URL에서 사용 가능한 형식으로 인코딩합니다
	
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
