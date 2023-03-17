<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="container">
	<div class="jumbotron">
		<h1>상품등록(관리자페이지)</h1>
	</div>

	<form action="${contextPath}/product/write?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td class="col-2">게시판분류</td>
				<td>
					<select name="productCategory.cateId" class="form-control">
						<c:forEach items="${productCateList}" var="c">
							<option value="${c.cateId}">${c.cateName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><input type="text" class="form-control" name="product_Name"></td>
			</tr>
			<tr>
				<td>상품이름소개</td>
				<td><input type="text" class="form-control" name="product_Intro"></td>
			</tr>
			<tr>
				<td>상품내용</td>
				<td><textarea rows="10" class="form-control" name="product_Content"></textarea></td>
			</tr>
			<tr>
				<td>상품크기</td>
				<td><input type="text" class="form-control" name="product_Size"></td>
			</tr>
			<tr>
				<td>상품중량</td>
				<td><input type="text" class="form-control" name="product_Weight"></td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><input type="text" class="form-control" name="product_Price"></td>
			</tr>
			<tr>
				<td>상품재고</td>
				<td><input type="text" class="form-control" name="product_Stock"></td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td><input type="file" class="form-control" name="attachFile"></td>
			</tr>
		</table>
		<button>확인</button>
	</form>	
</div>

<%@ include file="../layout/footer.jsp"%>
