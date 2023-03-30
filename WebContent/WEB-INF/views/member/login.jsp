<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<section class="vh-100" style="background-color: ;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem; box-shadow: 10px 5px 5px black;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="https://cdn.pixabay.com/photo/2022/04/02/14/39/macarons-7107136_960_720.jpg"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form action="${contextPath}/member/login" method="post">
                  <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span class="h1 fw-bold mb-0">로그인</span>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="text" id="loginId" placeholder="ID" name="loginId" value="${loginId}" class="form-control form-control-lg"/>
                    <label class="form-label" for="loginId">ID를 입력하세요</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="text" id="loginPwd" placeholder="PASSWORD" name=loginPwd class="form-control form-control-lg" />
                    <label class="form-label" for="loginPwd">Password를 입력하세요</label>
                  </div>
				<c:if test="${not empty errorMessage }">
					<div class="alert alert-danger">
						<strong>${errorMessage}</strong>
					</div>
				</c:if>
                  <div class="pt-1 mb-4">
                  	로그인상태유지 : <input type="checkbox" name="remember-me">
                    <button class="btn btn-dark btn-lg btn-block">Login</button>
					<!-- csrf 토큰 -->
		 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                  </div>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">ID가 없으신가요? 
                  	<a href="${contextPath}/member/join" style="color: blue; font-weight: bold">회원가입</a>
                  </p>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%@ include file="../layout/footer.jsp" %>


