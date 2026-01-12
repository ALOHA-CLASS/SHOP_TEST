<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="shop.dao.UserRepository" />
<%
	// 회원 정보 파라미터 받기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
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

    // 수정한 유저객체 생성
    User user = new User();
    user.setId(id);
    // 비밀번호는 만약 값이 없으면 기존비밀번호 그대로 사용, 값이 있다면 새로운 비밀번호로!
    if (pw == null || pw =="" ){
        pw = userDAO.getUserById(id).getPassword(); // 기존패스워드 가져옴
    }

    // TODO: 수정한 유저객체 속성 설정
    ❓❓❓

    // TODO: 사용자 정보 수정 메서드 호출
    int result = ❓❓❓
    if (result >0 ){
        response.sendRedirect("complete.jsp?msg=2");
    } else {
        response.sendRedirect("update.jsp");
    }

%>
