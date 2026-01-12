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
			/**
			TODO: 요청 파라미터 msg 의 값에 따라 위의 화면과 같이 메시지를 출력한다.
			- 0: 로그인
			- 1: 회원 가입
			- 2: 회원 수정
			- 3: 회원 탈퇴
			*/
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







