<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>
	
	<div class="sign-in-container">
      <form action="${contextPath}/member/join" method="post">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<spring:hasBindErrors name="memberDTO"/> <!-- name속성 : 커맨드객체이름 -->
		<h1>회원가입</h1>
		<span>환영합니다.</span>
		<div>
			<label for="memberId"></label>
			<input type="text" id="memberId" name="memberId" value="${memberDTO.memberId}" placeholder="아이디">
			<form:errors path="memberDTO.memberId" element="div" class="input-error" />
		</div>
		<div>
			<label for="password"></label>
			<input type="text" id="password" name="password" value="${memberDTO.password}" placeholder="비밀번호">
			<form:errors path="memberDTO.password" element="div" class="input-error" />
		</div>
		
		<div>
			<label for="confirmPassword"></label>
			<input type="text" id="confirmPassword" name="confirmPassword" value="${memberDTO.confirmPassword}" placeholder="비밀번호확인">
			<form:errors path="memberDTO.confirmPassword" element="div" class="input-error" />
		</div>
		
		<div>
			<label for="memberName"></label>
			<input type="text" id="memberName" name="memberName" value="${memberDTO.memberName}" placeholder="이름">
			<form:errors path="memberDTO.memberName" element="div" class="input-error" />
		</div>
		<div>
			<label for="memberEmail"></label>
			<input type="text" id="memberEmail" name="memberEmail" value="${memberDTO.memberEmail}" placeholder="이메일">
			<form:errors path="memberDTO.memberEmail" element="div" class="input-error" />
		</div>
		<div>
			<label for="memberAddress"></label>
			<input type="text" id="memberAddress" name="memberAddress" value="${memberDTO.memberAddress}" placeholder="주소">
			<form:errors path="memberDTO.memberAddress" element="div" class="input-error" />
		</div>
		<div>
			<label for="memberPhone"></label>
			<input type="text" id="memberPhone" name="memberPhone" value="${memberDTO.memberPhone}" placeholder="휴대폰번호">
			<form:errors path="memberDTO.memberPhone" element="div" class="input-error" />
		</div>
		<button class="btn btn-primary">가입하기</button>		
      </form>
    </div>

<style>
	@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css");
	
	* {
	  box-sizing: border-box;
	}
	body {
	  font-family: "Montserrat", sans-serif;
	  margin: 0;
	  padding: 0;
	}
	.wrapper {
	  width: 100%;
	  height: 100vh;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  overflow: hidden;
	}
	
	form {
	  background: #ebecf0;
	  display: flex;
	  flex-direction: column;
	  padding: 0 100px;
	  height: 85%;
	  justify-content: center;
	  align-items: center;
	  margin-top: 20px;
	}
	form input {
	  background: #eee;
	  padding: 16px;
	  margin: 8px 0;
	  width: 85%;
	  border: 0;
	  outline: none;
	  border-radius: 20px;
	  box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;
	}
	button {
	  border-radius: 20px;
	  border: none;
	  outline: none;
	  font-size: 12px;
	  font-weight: bold;
	  padding: 15px 45px;
	  margin: 14px;
	  letter-spacing: 1px;
	  text-transform: uppercase;
	  cursor: pointer;
	  transition: transform 80ms ease-in;
	}
	.sign-in-container {
	  position: absolute;
	  width: 50%;
	  height: 100%;
	  margin-left: auto;
	  margin-right: auto;
	  left: 0;
	  right: 0;
	  transition: all 0.5s;
	}
	form h1 {
	  font-weight: bold;
	  margin: 0;
	  color: #000;
	}
	span {
	  font-size: 12px;
	  color: #000;
	  letter-spacing: 0.5px;
	  margin-bottom: 10px;
	}
</style>

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
$(function() {
	let error_form = $('.input-error');
	console.log(error_form.length);
	if(error_form.length>0){
		error_form.prev().addClass('error_on')
	}
});
</script>