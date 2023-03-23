<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="loginIdNow"/>
</sec:authorize>

<div class="container">
	<h1>회원수정</h1>
	<form action="${contextPath}/member/modify" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="text" name="mno" value="${bb.mno}">
		<table class="table">
			<tr>
				<td>이름</td>
				<td>
					<input type="text" class="form-control" name="memberName" value="${bb.memberName}">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" class="form-control" name="memberEmail" value="${bb.memberEmail}">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" class="form-control" name="memberAddress" value="${bb.memberAddress}">
				</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>
					<input type="text" class="form-control" name="memberPhone" value="${bb.memberPhone}">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-primary">수정</button>
				</td>
			</tr>
		</table>
	</form>
	<a href="${contextPath}/member/myPage">
		<button class="btn btn-info">마이페이지 목록으로</button>
	</a>
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
let result = "${modResult}";
if(result!=''){
	alert(result);
}
</script>
