<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberVO" var="loginIdNow"/>
</sec:authorize>

<div class="container">

	<div class="jumbotron-white mt-5">
		<h1 class="text-left">장바구니페이지</h1>
	</div>

	<table class="table mt-3">
		<tr>
			<th>구매번호</th>
			<th>회원번호</th>
			<th>상품번호</th>
			<th>상품이름</th>
			<th>상품단가</th>
			<th>상품수량</th>
			<th>상품가격</th>
			<th>주문선택</th>
		</tr>
		<c:forEach items="${cart}" var="c" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${c.mno}
				<td>${c.product_Bno}</td>
				<td>${c.product_Name}</td>
				<td>${c.product_Price}</td>
				<td>${c.product_Count}</td>
				<td>${c.product_Price * c.product_Count}</td>
				<td class="col-2">
					<input type="checkbox" class="form-control bno_ckbox" value="${c.product_Bno}">
				</td>
			</tr>
		</c:forEach>
	</table>
	<div class="d-flex justify-content-end">
		<h1>합계 : ${totalPrice}</h1>
	</div><br>
	<div class="d-flex justify-content-end">	
		<button name="cartResult" class="btn btn-info selDel">결제하기</button>
		<button name="cartResultList" class="btn btn-primary ml-2 cartResultList">주문완료내역</button> <!-- 마이페이지로 보낼것 --> 
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>

<script>
$(function() {
	
	let bnoSet = new Set();
	$('.bno_ckbox').on('change', function () {
		let bno = $(this).val();
		
		let isChecked = $(this).prop('checked')
		if(isChecked){
			console.log(bno + "번 체크");		
			bnoSet.add(bno)
		} else {
			console.log(bno + "번 체크해제");
			bnoSet.delete(bno)
		}
		console.log(bnoSet);
	});
	
	// 결제하기버튼클릭
	$('.selDel').on('click', function () {
		if(bnoSet.size<=0){
			alert('하나이상의 주문을 선택하세요');/* 0보다 작거나 같을시 alert창 */
			return;
		}
		
		const token = $("[name='_csrf']").val()
		const header = $("[name='_csrf_header']").val()
		
		let delForm = $('<form/>')
		// 변환 : Set -> 배열 -> 문자열
		let bnoListStr = Array.from(bnoSet).join()
		delForm.attr('method','post')
			.attr('action','${contextPath}/cart/delSelectedBoard?bnoList=' + bnoListStr)
			.append($('<input/>').attr('type','hidden').attr('name','_csrf').val(token))
			.append('<input type="hidden" value="${loginIdNow.mno}" name="mno">')
			.append('<input type="hidden" value="' + Array.from(bnoSet).join(',') + '" name="product_Bno">')
			.append('<input type="hidden" value="${totalPrice}" name="totalPrice">')
			.appendTo('body')
			.submit()
		alert(bnoSet.size + '가지목록 주문완료.');
	})
	
	
});
</script>
