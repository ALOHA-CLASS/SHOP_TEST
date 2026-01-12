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
			// response.sendRedirect(root + "/");
			login = true;
		}
		
		UserRepository userDAO = new UserRepository();
		User loginUser = userDAO.getUserById(loginId);
		
		// 이메일 : 아이디@도메인 분리
		String mail = loginUser.getMail();
		String[] temp = {"",""};
		String[] email = (mail != null && mail.length() > 0) ? mail.split("@") : temp;
		String email1 = email[0];
		String email2 = email[1];
		
		// 생일 : 연/월/일 분리
		String birthStr = loginUser.getBirth();
		String[] temp2 = {"","",""};
		String[] birth = (birthStr != null && !birthStr.isEmpty() && birthStr.contains("/") ) ? birthStr.split("/") : temp2;
		String year = "";
		String month = "";
		String day = "";
		if( birth != null && birth.length == 3 ) {
			year = birth[0];
			month = birth[1];
			day = birth[2];
		} else {
			year = "";
			month = "";
			day  = "";
		}
		
		String phone = loginUser.getPhone();
		phone =	phone == null ? "" : phone;
		loginUser.setPhone(phone);
		
		String address = loginUser.getAddress();
		address = address == null ? "" : address;
		loginUser.setAddress(address);
	%>
	
	<jsp:include page="/layout/header.jsp" />
	
	<div class="row m-0 mypage">
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
			    <ul class="nav nav-pills flex-column mb-auto">
			      <!-- 로그인 시 -->
			      <% if( login ) { %>
		    	  <li class="nav-item">
			        <a href="${ root }/user/my/index.jsp" class="nav-link link-body-emphasis">
			          마이 페이지
			        </a>
			      </li>
			      <li class="nav-item">
			        <a href="${ root }/user/my/update.jsp" class="nav-link active" aria-current="page">
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
				<h1 class="display-5 fw-bold text-body-emphasis">회원 정보 수정</h1>
			</div>
			
			<!-- 회원 가입 영역 -->
			<div class="container shop m-auto mb-5">
				<form action="update_action.jsp" name="updateForm" method="post" >
				
					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2" id="">아이디</label>
						<input type="text" class="form-control col-md-10" 
							   name="id" placeholder="아이디" required
							   value="<%= loginUser.getId() %>">
					</div>
					
					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2" id="">이름</label>
						<input type="text" class="form-control col-md-10" 
							   name="name" placeholder="이름" required
							   value="<%= loginUser.getName() %>">
					</div>
					
					<div class="input-group mb-3 row">
						<div class="col-md-2 p-0">
							<label class="input-group-text" id="">성별</label>
						</div>
						<div class="col-md-10 d-flex align-items-center">
							<input type="hidden" name="temp-gender" value="<%= loginUser.getGender() %>"
								   id="temp-gender" />
							<div class="radio-box d-flex">
								<div class="radio-item mx-5">
									<input type="radio" class="form-check-input" name="gender" value="여" id="gender-female"> 
									<label for="gender-female">여자</label>
								</div>
								
								<div class="radio-item mx-5">
									<input type="radio" class="form-check-input " name="gender" value="남" id="gender-male"> 
									<label for="gender-male">남자</label>
								</div>
								
							</div>
						</div>
					</div>
					
					
					<div class="input-group mb-3 row">
						<div class="col-md-2 p-0">
							<label class="input-group-text" id="">생일</label>
						</div>
						<div class="col-md-10 d-flex align-items-center">
							<div class="row">
								<div class="col">
									<input type="text" class="form-control" name="year" placeholder="출생년도 " size="6" 
										   value="<%= year %>">
								</div>
								
								<div class="col">
									<input type="hidden" name="tempMonth" value="<%= month %>" id="temp-month">
									<select name="month" class="h-100 form-select" >
										<option value="01">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<option value="06">6월</option>
										<option value="07">7월</option>
										<option value="08">8월</option>
										<option value="09">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option>
									</select>
								</div>
								
								<div class="col">
									<input type="text" class="form-control" name="day" placeholder="일자" size="4" 
										   value="<%= day %>">
								</div>
							</div>
						</div>
					</div>
					
					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2" id="">이메일</label>
						
						<div class="row col-md-10 align-items-center">
							<div class="col-4 px-0">
								<input type="text" class="form-control col-md-10" 
									   name="email1" placeholder="이메일"
									   value="<%= email1 %>">
							</div>
							<div class="col-auto">
								@
							</div>
							<div class="col-4 px-0">
								<input type="hidden" name="tempEmail2" value="<%= email2 %>" id="temp-email2">
								<select name="email2" class="form-select">
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="kakao.com">kakao.com</option>
								</select>
							</div>
						</div>
					</div>
					
					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2" id="">전화번호</label>
						<input type="text" class="form-control col-md-10" 
							   name="phone" placeholder="전화번호"
							   value="<%= loginUser.getPhone() %>">
					</div>
					
					<div class="input-group mb-3 row">
						<label class="input-group-text col-md-2" id="">주소</label>
						<input type="text" class="form-control col-md-10" 
							   name="address" placeholder="주소"
							   value="<%= loginUser.getAddress() %>">
					</div>
					
					
					<div class="d-flex justify-content-between mt-5 mb-5">
						<a href="javascript: ;" onclick="alertDel()" class="btn btn-lg btn-danger" >탈퇴</a>
						<input type="submit" class="btn btn-lg btn-primary" value="수정" />
					</div>	
					
					
				</form>
			
			</div>
			
			<jsp:include page="/layout/footer.jsp" />
		</div>
	</div>
	
	
	
	<jsp:include page="/layout/script.jsp" />
	
	

	<script>
		
		let form = document.updateForm
		
		// 성별 선택
		let tempGender = document.getElementById('temp-gender')
		let radioFemale = document.getElementById('gender-female')
		let radioMale = document.getElementById('gender-male')
		// alert(tempGender.value)
		if( tempGender.value == '남' )		radioMale.checked = true
		if( tempGender.value == '여' )		radioFemale.checked = true
		
		
		// 생일 월 (select) 선택
		let tempMonth = document.getElementById('temp-month')
		let selectMonth = form.month
		selectMonth.value = tempMonth.value
		
		
		// 메일 도메인 (select) 선택
		let tempEmail2 = document.getElementById('temp-email2')
		let selectEmail2 = form.email2
		selectEmail2.value = tempEmail2.value
		
		
		// 탈퇴 체크
		function alertDel() {

			let form = document.updateForm

			let check = confirm('정말 탈퇴하시겠습니까?')

			if( check ) {
				form.action = 'delete_action.jsp'
				form.submit()
			}

		}
	
	</script>
</body>
</html>








