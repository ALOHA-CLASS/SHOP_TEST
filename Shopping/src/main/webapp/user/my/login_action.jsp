<!-- 로그인 처리 -->
<%@page import="java.util.UUID"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	UserRepository userDAO = new  UserRepository();
	User loginUser = userDAO.login(id, pw);
	
	// 로그인 실패
	if( loginUser == null ) {
		response.sendRedirect("login.jsp?error=0");		
		return;
	}
	
	
	// 로그인 성공
	// - 세션에 아이디 등록
	session.setAttribute("loginId", id);
	session.setAttribute("orderList", null);
	
	String rememberId = request.getParameter("remember-id");		// 아이디 저장 파라미터
	String rememberMe = request.getParameter("remember-me");		// 자동 로그인 파라미터
	Cookie cookieRememberId = new Cookie("rememberId", "" );
	Cookie cookieRememberMe = new Cookie("rememberMe", "" );
	Cookie cookieToken = new Cookie("token", "" );
	cookieRememberMe.setPath("/");
	cookieToken.setPath("/");
	cookieRememberMe.setMaxAge(7*24*60*60);
	cookieToken.setMaxAge(7*24*60*60);
	Cookie cookieLoginId = new Cookie("loginId", "" );
	
	// 아이디 저장
	if( rememberId != null && rememberId.equals("on") ) {
		// 아이디 저장 - 쿠키 생성
		cookieRememberId.setValue(URLEncoder.encode( rememberId, "UTF-8"));
		cookieLoginId.setValue(URLEncoder.encode( id, "UTF-8"));
	} 
	else {
		// 아이디 저장 - 쿠키 삭제
		cookieRememberId.setMaxAge(0);
		cookieLoginId.setMaxAge(0);
	}
	
	// 자동 로그인
	if( rememberMe != null && rememberMe.equals("on") ) {
		String tokenValue = userDAO.refreshToken(id);
		// 자동 로그인 - 쿠키 생성
		cookieRememberMe.setValue(URLEncoder.encode( rememberMe, "UTF-8"));
		cookieToken.setValue(URLEncoder.encode( tokenValue, "UTF-8"));
	} else {
		// 자동 로그인 - 쿠키 삭제
		cookieRememberMe.setMaxAge(0);
		cookieToken.setMaxAge(0);
	}
	
	
	// 쿠키 전달
	response.addCookie(cookieRememberId);
	response.addCookie(cookieRememberMe);
	response.addCookie(cookieToken);
	response.addCookie(cookieLoginId);
	
	// 로그인 성공 페이지로 이동
	response.sendRedirect("complete.jsp?msg=0");		

%>





