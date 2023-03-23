<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="my-5">
		<h1>상품 카테고리 생성(관리자)</h1><hr>
	</div>
	<div class="row">
		<div class="col-6 mt-3">
			<h3>상품 카테고리 분류</h3>
			<table class="table">
				<tr>
					<th>상품아이디</th>
					<th colspan="2">상품이름</th>
				</tr>
				<c:forEach items="${productCateList}" var="cp">
	<!-- 리스트안들어옴 
		 롬복동작안함->> 최초 카테고리아이디를 cProductId로 생성했을때 property속성못받음
		 결국 다시 cateId로 db컬럼바꿈
		 결론 : 롬복동작하려면 앞소문자 2개이상으로 컬럼작성해야함
	-->
					<tr>
						<td>${cp.cateId}</td>
						<td>${cp.cateName}</td>
						<td><a href="${cp.cateId}" class="delProductCate">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-6 mt-3">
			<h3>상품카테고리 추가</h3>
			<form action="${contextPath}/admin/addProductCate?${_csrf.parameterName}=${_csrf.token}" method="post">
				<table class="table">
					<tr>
						<th>상품아이디</th>
						<td><input type="text" name="cateId" class="form-control"></td>
					</tr>
					<tr>
						<th>상품이름</th>
						<td><input type="text" name="cateName" class="form-control"></td>
						<td></td>
					</tr>
				</table>
				<button class="btn btn-primary">등록</button>
			<a class="btn btn-success my-3" href="${contextPath}">메인페이지</a>
			</form>
		</div>
	</div>
</div>
<script>
	$(function () {
	  $('.delProductCate').on('click', function (e) {
	    e.preventDefault();
	    let cpid = $(this).attr('href');
	    let form = $('<form/>', {
	      action: '${contextPath}/admin/delProductCate?cateid=' + cpid,
	      method: 'post',
	    });
	    let csrfTokenInput = $('<input/>', {
	      type: 'hidden',
	      name: '_csrf',
	      value: $("[name='_csrf']").val(),
	    });
	    let csrfHeaderInput = $('<input/>', {
	      type: 'hidden',
	      name: '_csrf_header',
	      value: $("[name='_csrf_header']").val(),
	    });
	    form.append(csrfTokenInput, csrfHeaderInput).appendTo('body').submit();
	  });
	});
</script>

<%@ include file="../layout/footer.jsp"%>