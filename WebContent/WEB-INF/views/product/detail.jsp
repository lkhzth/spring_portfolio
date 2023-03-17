<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script src="${contextPath}/resources/js/productDetail.js"></script>

<div class="container">
	<div class="jumbotron">
		<h2>상품상세페이지</h2> 
	</div>
	<div class="card">
		<div class="card-header">
			<div>
				<span class="badge badge-primary">상품번호 ${b.product_Bno}
					 <input type="hidden" class="form-control" name="bno"
						value='<c:out value="${b.product_Bno}"/>' readonly="readonly">
				</span>
			</div>
		</div>
		<div class="card-body" style="min-height:100px">
			
			${b.product_Name}<br>
			배송비 : 무료<br>전국 냉동탑차 직접배송<br>
			제조사 : 테스트컴퍼니<br>
			제품상세		${b.product_Content}<br>
			제품크기		${b.product_Size}<br>
			제품중량		${b.product_Weight}<br>
			상품금액		${b.product_Price}<br>
			상품재고		${b.product_Stock}<br>
			포장단위		10개(1BOX)단위로 주문가능
		</div>
		<div class="card-footer">
			<a href="${contextPath}/product/list"><button class="btn btn-info">상품목록</button></a>
			<sec:authorize access="isAuthenticated()"> <!-- 로그인한 사용자만 보이게 -->
				<button class="btn btn-success">주문하기</button>
				<a href="${contextPath}/member/myPage"><button class="btn btn-warning">주문내역</button></a><br>
				<div class="d-flex justify-content-end mr-3">
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')"> <!-- 관리자만 보이게 -->
						<button class="btn btn-danger modBoard">수정</button>
						<button class="btn btn-danger delBoard ml-1">삭제</button>
					</sec:authorize>
				</div>
			</sec:authorize>
		</div>
	</div>	

	<!-- 첨부파일 있을때 -->
	<c:if test="${not empty attachList.fileName_Product && attachList.fileType_Product eq 'IMAGE'}">
		<!-- 파일다운로드 -->
		<div class="media border p-3 my-2">
			<div class="media-body d-flex justify-content-between">
				<div>
					<a href="${contextPath}/productDownload?fileName=${b.product_Bno}/${attachList.fileName_Product}">
						<img src="${contextPath}/imgProductDisplay?fileName=${b.product_Bno}/${attachList.fileName_Product}" style="width: 200px">
						${attachList.fileName_Product}
					</a>			
				</div>
			</div>
		</div>							 
	</c:if>
		
	<c:if test="${not empty attachList.fileName_Product && attachList.fileType_Product eq 'OTHER'}">
		<div class="media border p-3 my-2">
			<div class="media-body d-flex justify-content-between">
				<a href="${contextPath}/productDownload?fileName=${b.product_Bno}/${attachList.fileName_Product}">
					${attachList.fileName_Product}
				</a>
			</div>
		</div>	
	</c:if>		

	<!-- 첨부파일 없을때 -->
	<c:if test="${empty attachList}">
		<div class="media border p-3 my-2">
			<div class="media-body">
				<b>등록된 첨부파일 없음</b>
			</div>
		</div>	
	</c:if>

</div>
<%@ include file="../layout/footer.jsp" %>

<script>
$(function() {
	
	$('.delBoard').on('click', function() {
		const token = $("[name='_csrf']").val()
		const header = $("[name='_csrf_header']").val()
		
		$('<form/>').attr('method','post')
			.append($('<input/>').attr('type','hidden').attr('name','_csrf').val(token))
			.attr('action','${contextPath}/product/remove?product_Bno=${b.product_Bno}')
			.appendTo('body')
			.submit();
	})
	$('.modBoard').on('click', function() {
		$('<form/>').attr('method','get')
			.attr('action','${contextPath}/product/modify')
			.append('<input type="hidden" value="${b.product_Bno}" name="product_Bno">')
			.appendTo('body')
			.submit();
	})
});

</script>
