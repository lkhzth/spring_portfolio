<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberVO" var="loginIdNow"/>
</sec:authorize>
<!-- 컨트롤러에서 쓰임이 없을시 login된 아이디불러올때 선언 loginIdNow -> ${loginIdNow} -->
<!-- memberController myPage에서 가져온 modelAdd-->
<%-- 	memberVO : ${memberVO.authList}<br><!-- 현재 로그인상태의 유저등급 -->
=======================================================<br>
	authList : ${authList}<br><!-- 전체 등급리스트 -->
==================================================<br>
	${memberVO.authList[0].memberType}
====================================================<br>
	로그인 아이디 : ${memberVO.memberId}
=============================================<br>
	${mType[0]}
==============================================<br> --%>

<div style="padding: 0 220px">
	<div class="jumbotron-center bg-white">
		<c:choose>
			<c:when test="${memberVO.authList[0].memberType eq mType[0]}">
				<h1 class="text-center my-5">전체회원정보(관리자)</h1>
			</c:when>
			<c:otherwise>
				<h1 class="text-center my-5">마이페이지</h1>
			</c:otherwise>
		</c:choose>
	</div>

	<%-- <form action="${contextPath}/member/updateMember" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
		----> 회원수정시 관리자와 일반회원의 코드가 달라 전체 div를 form으로 만들지 않고 제이쿼리를 사용하여 클래스선택자로 controller로 양식제출	
	--%> 
		<div class="jumbotron-center bg-white">
			<h3>회원상세정보</h3>
		</div>
		<table class="table" >
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>주소</th>
				<th>휴대폰번호</th>
				<th>회원상태</th>
				<th>회원등급</th>
				<th>회원상세</th>
			</tr>
			<c:choose>
				<c:when test="${memberVO.authList[0].memberType eq mType[0]}">
					<c:forEach items="${list}" var="m" varStatus="mst">
						<tr>
							<td>
								${m.mno}
							</td>
							<td>${m.memberId}</td>
							<td>${m.memberName}</td>
							<td>${m.memberEmail}</td>
							<td>${m.memberAddress}</td>
							<td>${m.memberPhone}</td>
							<td>${m.enabled}</td>
							<td>${m.authList[0].memberType}</td>
							<td>
								<button name="mno" class="btn btn-warning adminMod" data-mno="${m.mno}">회원정보수정</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>
							${memberVO.mno}
						</td>
						<td>${memberVO.memberId}</td>
						<td>${memberVO.memberName}</td>
						<td>${memberVO.memberEmail}</td>
						<td>${memberVO.memberAddress}</td>
						<td>${memberVO.memberPhone}</td>
						<td>${memberVO.enabled}</td>
						<td>${memberVO.authList[0].memberType}</td>
						<td>
							<button name="mno" class="btn btn-warning userMod" data-mno="${memberVO.mno}">회원정보수정</button>
						</td>
					</tr>	
				</c:otherwise>
			</c:choose>
		</table><br>
		
		<div class="jumbotron-center bg-white">
			<h3>주문결제완료목록</h3>
		</div>
		<table class="table mt-3">
			<tr>
				<th>구매번호</th>
				<th>상품번호</th>
				<th>상품이름</th>
				<th>상품단가</th>
				<th>상품수량</th>
				<th>상품가격</th>
				<th>구매날짜</th>
				<th>주문상태</th>
			</tr>
			<c:forEach items="${cart}" var="c" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${c.product_Bno}</td>
					<td>${c.product_Name}</td>
					<td>${c.product_Price}</td>
					<td>${c.product_Count}</td>
					<td>${c.product_Price * c.product_Count}</td>
					<td>
						<fmt:formatDate value="${c.orderDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>주문완료</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="float-right">
			<a class="btn btn-primary" href="${contextPath}">메인페이지</a>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
				<a class="btn btn-primary" href="${contextPath}/board/list">메인게시판</a>
			</sec:authorize>
		</div>
	<!-- </form> -->
	</div>
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
$(function(){
	
	$('.adminMod').on('click', function() {
		const token = $("[name='_csrf']").val()
		const header = $("[name='_csrf_header']").val()
		
		let mno = $(this).data('mno');
		$('<form/>').attr('method','get')
			.attr('action','${contextPath}/member/myPageDetail')
			.append('<input type="hidden" value="'+mno+'" name="mno">')
			.append($('<input/>').attr('type','hidden').attr('name','_csrf').val(token))
			.appendTo('body')
			.submit();
	});
	
	$('.userMod').on('click', function() {
		const token = $("[name='_csrf']").val()
		const header = $("[name='_csrf_header']").val()
		
		$('<form/>').attr('method','get')
			.attr('action','${contextPath}/member/myPageDetail')
			.append('<input type="hidden" value="${memberVO.mno}" name="mno">')
			.append($('<input/>').attr('type','hidden').attr('name','_csrf').val(token))
			.appendTo('body')
			.submit();
	}); 
});

</script>
