<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

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
		</tr>
		<c:forEach items="${cart}" var="c" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${c.mno}
				<td>${c.product_Bno}
					<%-- <input type="hidden" class="cateName" value="${b.category.cname}"> --%>
				</td>
				<%-- <td><a href="${b.bno}" class="goDetail">${b.title}</a></td> --%>
				<td>${c.product_Name}</td>
				<td>${c.product_Price}</td>
				<td>${c.product_Count}</td>
				<td>${c.product_Price * c.product_Count}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="d-flex justify-content-end">
		<h1>합계 : ${totalPrice}</h1>
	</div><br>
	<div class="d-flex justify-content-end">	
		<button name="cartResult" class="btn btn-primary addCartResult">결제하기</button>
		<button name="cartResultList" class="btn btn-primary ml-2 cartResultList">주문완료내역</button> <!-- 마이페이지로 보낼것 --> 
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>

<script>
$(function() {
	// 결제하기버튼클릭
	$('.addCartResult').on('click', function() {
		const token = $("[name='_csrf']").val()
		const header = $("[name='_csrf_header']").val()
		
		$('<form/>').attr('method','post')
			.attr('action','${contextPath}/cart/addCartResult')
			.append($('<input/>').attr('type','hidden').attr('name','_csrf').val(token))
			.append('<input type="hidden" value="${mno}" name="mno">')
			.append('<input type="hidden" value="${c.product_Bno}" name="product_Bno">')
			.append('<input type="hidden" value="${totalPrice}" name="totalPrice">')
			.appendTo('body')
			.submit();
	})
	
});
</script>
