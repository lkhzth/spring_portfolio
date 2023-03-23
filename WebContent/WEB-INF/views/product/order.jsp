<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
	<h1>주문결제창</h1>
	<form action="${contextPath}/product/modify?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<input type="hidden" name="product_Bno" value="${b.product_Bno}">
		<table class="table">
			<tr>
				<td>상품이름</td>
				<td>
					<input type="text" class="form-control" name="product_Name" value="${b.product_Name}">
				</td>
			</tr>
			<tr>
				<td>상품이름소개</td>
				<td>
					<input type="text" class="form-control" name="product_Intro" value="${b.product_Intro}">
				</td>
			</tr>
			<tr>
				<td>상품내용</td>
				<td>
					<textarea rows="10" class="form-control" name="product_Content">${b.product_Content}</textarea>
				</td>
			</tr>
			<tr>
				<td>상품크기</td>
				<td>
					<input type="text" class="form-control" name="product_Size" value="${b.product_Size}">
					<!-- 부적합한 열유형 1111 name값 오타 -->
				</td>
			</tr>
			<tr>
				<td>상품중량</td>
				<td>
					<input type="text" class="form-control" name="product_Weight" value="${b.product_Weight}">
				</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td>
					<input type="text" class="form-control" name="product_Price" value="${b.product_Price}">
				</td>
			</tr>
			<tr>
				<td>상품재고</td>
				<td>
					<input type="text" class="form-control" name="product_Stock" value="${b.product_Stock}">
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<c:if test="${empty b.fileName_Product}">
						<b>첨부파일 없음</b>
						<input type="file" name="attachFile" class="form-control">
					</c:if>
					<c:if test="${not empty b.fileName_Product}">
						<div>
							<span>파일 삭제 : <input type="checkbox" name="delChk" class="delChk"></span>
							<input type="file" name="attachFile" class="form-control attachFile">
						</div>
						<c:if test="${b.fileType_Product eq 'IMAGE'}">
								<img src="${contextPath}/imgProductDisplay?fileName=${b.product_Bno}/${b.fileName_Product}">
						</c:if>
						<c:if test="${b.fileType_Product eq 'OTHER'}">
								${b.fileName_Product}
						</c:if>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-primary">수정</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
	$(function() {
		$('.delChk').change(function() {
			if($(this).prop('checked')) {
				// 체크
				$('.attachFile').hide();
			} else {
				// 언체크
				$('.attachFile').show();
			}
		})
		
		$('.attachFile').change(function() {
			let fileFormVal = $(this).val();
			if(fileFormVal != '') {
				$('.delChk').hide();
			} else {
				$('.delChk').show();
			}
		})
	});
</script>
