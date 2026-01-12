<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	// 아이디 저장, 자동 로그인 쿠키 삭제
	// Cookie cookieRememberId = new Cookie("rememberId", "" );
	Cookie cookieRememberMe = new Cookie("rememberMe", "" );
	Cookie cookieToken = new Cookie("token", "" );
	cookieRememberMe.setPath("/");
	cookieToken.setPath("/");
	cookieRememberMe.setMaxAge(0);
	cookieToken.setMaxAge(0);
	
	// 세션 무효화
	session.invalidate();
	
	// 쿠키 전달
	// response.addCookie(cookieRememberId);
	response.addCookie(cookieRememberMe);
	response.addCookie(cookieToken);
	response.sendRedirect(request.getContextPath() + "/");
%>