<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="container">
	<div class="jumbotron">
		<h1>상품등록(관리자페이지)</h1>
	</div>

	<form action="${contextPath}/product/write?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<!-- 
		 multipart/form-data는 파일업로드같은 이진데이터를 포함하는 경우 사용, 파일업로드를 위한 폼으로 인식되어 데이터전송방식이 일반폼과 다르게 처리
		 스프링시큐리티는 기본적으로 <form> 태그에서 CSRF토큰을 자동생성, multipart/form-data가 있는 폼에서는 CSRF 토큰이 <input> 요소에 포함되는 것이 아니라,
		 헤더에 포함되어 전송되어야함
		 multipart/form-data속성이 있을때 CSRF토큰을 input에 직접적으로 포함시 오류발생-> 시큐리티가 자동으로 생성하는 CSRF 토큰을 헤더에 포함하지 않아서 발생하는 문제
		 multipart/form-data속성이 있으면 CSRF 토큰을 헤더에 포함하도록 시큐리티설정을 확인하고, CSRF 토큰을 input에 직접 포함하지 않도록 수정하여 
		 CSRF 공격을 방지하면서 파일 업로드와 같은 이진 데이터를 안전하게 처리
	 -->
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
