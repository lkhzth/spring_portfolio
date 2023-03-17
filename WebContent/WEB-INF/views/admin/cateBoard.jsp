<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
	<div class="jumbotron ">
		<h1>게시판생성페이지(관리자)</h1>
	</div>
	<div class="row">
		<div class="col-6">
			<h3>게시판 현황</h3>
			<table class="table">
				<tr>
					<th>아이디</th>
					<th colspan="2">이름</th>
				</tr>
				<c:forEach items="${cateList}" var="c">
					<tr>
						<td>${c.cid}</td>
						<td>${c.cname}</td>
						<td><a href="${c.cid}" class="delCate">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-6">
			<h3>게시판 추가</h3>
			<form action="${contextPath}/admin/addCate?${_csrf.parameterName}=${_csrf.token}" method="post">
				<table class="table">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="cid" class="form-control"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="cname" class="form-control"></td>
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
	  $('.delCate').on('click', function (e) {
	    e.preventDefault();
	    let cid = $(this).attr('href');
	    let form = $('<form/>', {
	      action: '${contextPath}/admin/delCate?cid=' + cid,
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
	/* 기존코드에서 header에서 가지고 온 토큰으로 삭제구현못함
		gpt통해 폼 데이터를 생성할 때 action과 method 속성을 설정하고,
		CSRF 토큰과 헤더를 추가하는 input 요소를 생성하여 폼 데이터에
		추가. 폼 데이터에 CSRF 토큰을 추가하면 보안성이 높아집니다.*/
	/* $(function () {
		const token = $("[name='_csrf']").val()
		const header = $("[name='_csrf_header']").val()

		let form = $('<form/>')
		$('.delCate').on('click', function (e) {
			e.preventDefault()
			let cid = $(this).attr('href')
			form.attr('action', '${contextPath}/admin/delCate?cid='+cid)
				.attr('method', 'post')
				.append('<input type="hidden" value="${c.cid}" name="cid">')
				.appendTo('body')
				.submit()
		})
	}); */
</script>

<%@ include file="../layout/footer.jsp"%>