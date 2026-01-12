<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
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
	<% 
		if( loginId == null || loginId.equals("") ) {
			response.sendRedirect(root + "/");
		}
		
		boolean login = false;
		if( loginId != null && !loginId.isEmpty() ) {
			login = true;
		}
		
	%>
	
	<jsp:include page="/layout/header.jsp" />
	
	<div class="row m-0 mypage">
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
			    <ul class="nav nav-pills flex-column mb-auto">
			      <!-- 로그인 시 -->
			      <% if( login ) { %>
			      <li class="nav-item">
			        <a href="${ root }/user/my/update.jsp" class="nav-link active" aria-current="page">
			          마이 페이지
			        </a>
			      </li>
			      <li class="nav-item">
			        <a href="${ root }/user/my/update.jsp" class="nav-link link-body-emphasis">
			          회원정보 수정
			        </a>
			      </li>
			      <% } %>
			      <li>
			        <a href="${ root }/user/my/order.jsp" class="nav-link link-body-emphasis">
			          주문내역
			        </a>
			      </li>
			    </ul>
			    <hr>
			  </div>
		</div>
		
		<div class="col-md-9 ms-sm-auto col-lg-10 p-0 m-0">
			<div class="px-4 py-3 my-3 text-center">
				<h1 class="display-5 fw-bold text-body-emphasis">마이 페이지</h1>
			</div>
			
			<!-- 마이 페이지 -->
			<div class="container shop m-auto mb-5">
				<div class="btn-box d-grid gap-2">
					<a href="${ root }/user/my/update.jsp" class="btn btn-outline-primary btn-lg px-4 gap-3">회원정보 수정</a>
					<a href="${ root }/user/my/order.jsp" class="btn btn-outline-primary btn-lg px-4 gap-3">주문내역</a>
				</div>
			</div>
			
			<jsp:include page="/layout/footer.jsp" />
		</div>
	</div>
	
	<jsp:include page="/layout/script.jsp" />
	
</body>
</html>








