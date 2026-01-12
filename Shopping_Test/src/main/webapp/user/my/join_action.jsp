<!-- 
	회원 가입 처리
 -->
<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	User user = new User();
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pw_confirm = request.getParameter("pw_confirm");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String birth = year + "/" + month + "/" + day;
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" + email2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	

	// TODO: User 객체에 회원 가입 정보를 설정한다.

	// TODO: 회원 정보 등록 요청
	// UserRepository 객체를 생성하고 insert() 메서드를 호출하여 회원 정보를 데이터베이스에 저장한다.
	// 회원 가입이 성공하면 complete.jsp 페이지로 리다이렉트한다.
	// 실패하면 join.jsp 페이지로 리다이렉트한다.

	
%>
    
    

    
    
    
    
    
    