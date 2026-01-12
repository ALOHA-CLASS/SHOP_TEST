<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>   
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원 정보</h1>
		
	</div>
	<!-- 회원 가입/수정/탈퇴 완료 -->
	<div class="container mb-5">
		<%
			String msg = request.getParameter("msg");
			msg = msg == null ? "" : msg;
			String text = "쇼핑몰 사이트 입니다.";
			// 0 : 로그인
			// 1 : 회원 가입
			// 2 : 회원 수정
			// 3 : 회원 삭제
			switch(msg) {
				case "0" :
					text = loginId + "님 환영 합니다."; 
					break; 
				case "1" : text = "회원 가입이 완료되었습니다."; break; 
				case "2" : text = "회원 정보가 수정되었습니다."; break; 
				case "3" : text = "회원 정보가 삭제되었습니다."; break; 
			}
		%>
		<h1 class="text-center"><%= text %></h1>
		<div class="btn-box d-flex justify-content-center p-5">
			<a href="${ root }/" class="btn btn-lg btn-primary">메인 화면</a>
		</div>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>







