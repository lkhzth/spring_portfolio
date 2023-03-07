<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron bg-warning">
		<h1>회원관리</h1>
	</div>

	<table class="table">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>주소</th>
					<th>휴대폰번호</th>
				</tr>
				<%-- <c:forEach items="${list }" var="b">
					<tr>
						<td>${b.bno}</td>
						<td>
							${b.category.cname}
							<input type="hidden" class="cateName" value="${b.category.cname}">
						</td>
						<td>
							<!-- <a href="${contextPath}/board/detail?bno=${b.bno}">${b.title}</a> -->
							<a href="${b.bno}" class="goDetail">${b.title}</a>
						</td>
						<td>${b.fileName}</td>
						<td>${b.writer}</td>
						<td>${b.writeDate}</td>
					</tr>
				</c:forEach> --%>
			</table>
	
</div>

<%@ include file="../layout/footer.jsp" %>
