<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="loginIdNow"/>
</sec:authorize>

<div class="container">
	<h2>회원정보수정</h2>
	<form action="${contextPath}/member/modify" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<span class="badge badge-primary">회원번호 ${bb.mno}
			<input type="hidden" name="mno" value="${bb.mno}">
		</span>
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
