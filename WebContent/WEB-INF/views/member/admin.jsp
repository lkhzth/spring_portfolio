<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="my-5">
		<h1>회원등급변경(관리자)</h1>
	</div>
	<form action="${contextPath}/member/updateMemberType" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<table class="table">
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>회원등급</th>
				<th>회원상태</th>
			</tr>
			
			<c:forEach items="${list}" var="m" varStatus="mst">
			<c:if test="${m.authList[0].memberType == mType[0] || m.authList[0].memberType != mType[0]}"><!-- ADMIN등급을 표시하지 않음 -->
			<%-- <c:if test="${m.authList[0].memberType!=mType[0]}"> --%>
				<tr>
					<td>${m.mno}</td>
					<td>${m.memberId}
						<input type="hidden" name="authList[${mst.index}].memberId" value="${m.memberId}">
					</td>
					<td>
						<select name="authList[${mst.index}].memberType">
						<c:forEach items="${mType}" var="type">
							<option value="${type}" ${m.authList[0].memberType==type ? 'selected':''}>${type.name}</option>
						</c:forEach>
						</select>
					</td>
					<td>${m.enabled ? '활성':'비활성' }</td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
		<div class="text-right pb-2">
			<button class="btn btn-success">등급변경</button>
		</div>
		<div class="float-right">
			<a class="btn btn-primary" href="${contextPath}">메인페이지</a>
			<a class="btn btn-primary" href="${contextPath}/board/list">메인게시판</a>
			<a class="btn btn-primary" href="${contextPath}/admin/home">게시판 카테고리 생성</a>
		</div>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
let updateMember = "${updateMember}";
if(updateMember!='') alert(updateMember);
</script>