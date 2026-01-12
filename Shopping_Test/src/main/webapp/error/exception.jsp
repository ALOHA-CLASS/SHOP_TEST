<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예외 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">Error</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">시스템 에러</p>
			<h5>시스템 작업 처리 중 예외가 발생하였습니다.</h5>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<!-- a 태그 버튼 -->
				<a href="${ root }/index.jsp" class="btn btn-primary btn-lg px-4 gap-3">메인 화면</a>
			</div>
		</div>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />

</body>
</html>