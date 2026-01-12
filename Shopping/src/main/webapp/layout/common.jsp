<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath(); 
	pageContext.setAttribute("root", root);
	String loginId = (String) session.getAttribute("loginId");
%>