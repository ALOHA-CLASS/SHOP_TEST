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
	
	user.setId(id);
	user.setPassword(pw);
	user.setName(name);
	user.setGender(gender);
	user.setBirth(birth);
	user.setMail(email);
	user.setPhone(phone);
	user.setAddress(address);
	
	out.println(user.toString());

	// 회원 정보 등록 요청
	UserRepository userDAO = new UserRepository();
	int result = userDAO.insert(user);
	
	if( result > 0  ) {
		// 회원 가입 완료 페이지로 이동
		response.sendRedirect("complete.jsp?msg=1");		
	} else {
		response.sendRedirect("join.jsp");		
	}

	
%>
    
    

    
    
    
    
    
    