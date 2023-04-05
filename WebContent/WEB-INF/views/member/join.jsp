<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<section class="vh-100" style="">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px; box-shadow: 10px 5px 5px black;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">회원가입</p>
				
				<form class="mx-1 mx-md-4" action="${contextPath}/member/join" method="post">
			      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<spring:hasBindErrors name="memberDTO"/> <!-- name속성 : 커맨드객체이름 -->
					<div class="d-flex flex-row align-items-center mb-4">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label" for="memberId"></label>
							<input class="form-control" type="text" id="memberId" name="memberId" value="${memberDTO.memberId}" placeholder="아이디">
							<form:errors path="memberDTO.memberId" element="div" class="input-error" />
						</div>
					</div>
					<div class="d-flex flex-row align-items-center mb-4">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label" for="password"></label>
							<input class="form-control" type="text" id="password" name="password" value="${memberDTO.password}" placeholder="비밀번호">
							<form:errors path="memberDTO.password" element="div" class="input-error" />
						</div>
					</div>
					<div class="d-flex flex-row align-items-center mb-4">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label" for="confirmPassword"></label>
							<input class="form-control" type="text" id="confirmPassword" name="confirmPassword" value="${memberDTO.confirmPassword}" placeholder="비밀번호확인">
							<form:errors path="memberDTO.confirmPassword" element="div" class="input-error" />
						</div>
					</div>
					<div class="d-flex flex-row align-items-center mb-4">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label" for="memberName"></label>
							<input class="form-control" type="text" id="memberName" name="memberName" value="${memberDTO.memberName}" placeholder="이름">
							<form:errors path="memberDTO.memberName" element="div" class="input-error" />
						</div>
					</div>
					<div class="d-flex flex-row align-items-center mb-4">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label" for="memberEmail"></label>
							<input class="form-control" type="text" id="memberEmail" name="memberEmail" value="${memberDTO.memberEmail}" placeholder="이메일">
							<form:errors path="memberDTO.memberEmail" element="div" class="input-error" />
						</div>
					</div>
					<div class="d-flex flex-row align-items-center mb-4">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label" for="memberAddress"></label>
							<input class="form-control" type="text" id="memberAddress" name="memberAddress" value="${memberDTO.memberAddress}" placeholder="주소">
							<form:errors path="memberDTO.memberAddress" element="div" class="input-error" />
						</div>
					</div>
					<div class="d-flex flex-row align-items-center mb-4">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label" for="memberPhone"></label>
							<input class="form-control" type="text" id="memberPhone" name="memberPhone" value="${memberDTO.memberPhone}" placeholder="휴대폰번호">
							<form:errors path="memberDTO.memberPhone" element="div" class="input-error" />
						</div>
					</div>
                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button class="btn btn-primary btn-lg">가입하기</button>
                  </div>
                </form>
                
              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                <img  style="border-radius: 15%; opacity: 0.8;" src="https://cdn.pixabay.com/photo/2020/02/19/20/15/macarons-4863165_960_720.jpg"
                  class="img-fluid" alt="Sample image">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="../layout/footer.jsp" %>

 <style>
.input-error{
	font-size: 13px;
	font-weight: bold;
	color: red;
}
.error_on{
	border-color: red;
}
</style>

<script>

let logining = "${logining}";
if(logining) alert(logining);

$(function() {
	let error_form = $('.input-error');
	console.log(error_form.length);
	if(error_form.length>0){
		error_form.prev().addClass('error_on')
	}
});
</script>