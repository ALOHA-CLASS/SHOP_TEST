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
	<% 
		String prev = request.getParameter("prev");
	%>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">이미 로그인된 상태입니다.</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4"><span id="time"></span> 초 후 메인 화면으로 이동합니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<a href="${ root }/" class="btn btn-lg btn-primary">메인 화면</a>
				<a href="${ root }/user/my/logout.jsp" class="btn btn-outline-danger btn-lg px-4">로그아웃</a>
			</div>
		</div>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
	
	<script>
	
		let root = "${ root }"
		// 5초 타이머를 설정합니다.
		const timer1 = setTimeout(stopAfter5Seconds, 5000);
		const timer2 = setInterval(repeatEverySecond, 1000);
		
		function stopAfter5Seconds() {
		  // 5초 후에 동작을 중지합니다.
		  location.href = root + "/"
		  clearInterval(timer);
		}
		
		let count = 5
		document.getElementById('time').textContent = count
		function repeatEverySecond() {
			document.getElementById('time').textContent = count
			count--
		}
	</script>
</body>
</html>










