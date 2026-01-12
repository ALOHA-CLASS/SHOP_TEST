<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.OrderRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// TODO: 주문 조회 기능 구현
	// 1. 파라미터 수집(전화번호, 주문비밀번호)
	// 2. DB에서 주문내역 조회
	// 3. 세션에 주문내역 저장
	// 4. 주문내역 페이지로 리다이렉트
	// ----------------------------------------------------

	// TODO:
	// 1. 파라미터 수집(전화번호, 주문비밀번호)
	// - 파라미터: phone, orderPw
	// - DB에서 주문내역 조회
	
	
	// TODO:
	// 2. DB에서 주문내역 조회
	// - OrderRepository의 list(phone, orderPw) 메서드 사용
	// - 리턴타입: List<Product>
	// - 파라미터: 전화번호, 주문비밀번호
	// - 리턴값: 주문내역 리스트
	
	
	// TODO:
	// 3. 세션에 주문내역 저장
	// - 세션키: orderPhone, orderList
	// - 세션값: 전화번호, 주문내역 리스트
	
	
	// TODO:
	// 4. 주문내역 페이지로 리다이렉트
	// - 리다이렉트 URL: /user/my/order.jsp

%>