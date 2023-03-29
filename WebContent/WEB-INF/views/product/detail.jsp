<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberVO" var="loginIdNow"/>
</sec:authorize>

<script src="${contextPath}/resources/js/productDetail.js"></script>

<div class="container mt-5">
    <div class="row">
        <div class="col-lg-7">
            <article>
                <header class="mb-4">
                    <h1 class="fw-bolder mb-1">${b.product_Name}</h1>
                    <span class="text-center" style="font-size:15px">${b.product_Intro}</span>
                    <span class="badge badge-primary">상품번호 ${b.product_Bno}
                    	<input type="hidden" class="form-control" name="bno"
						value='<c:out value="${b.product_Bno}"/>' readonly="readonly">
                    </span>
                </header>
                <div>
	            	<figure class="mb-4">
	                	<img class="img-fluid rounded" src="${contextPath}/imgProductDisplay?fileName=${b.product_Bno}/${b.fileName_Product}"  style="width: 90%">
	                </figure>
		        </div>
            </article>
        </div>
        
        <div class="col-lg-5 px-5">
           	<div class="d-flex justify-content-end mr-3">
				<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')"> <!-- 관리자만 보이게 -->
					<button class="btn btn-info modBoard">수정</button>
					<button class="btn btn-danger delBoard ml-1">삭제</button>
				</sec:authorize>
			</div>
            <div class="card my-3">
                <div class="card-header">상세정보</div>
                <div class="card-body">
                    <div class7="">
                        <table class="table" style="margin-bottom : -20px; font-size: 15px;">
                        	<tr><td>배송비 : 무료</td></tr>
                            <tr><td>전국 냉동탑차 직접배송</td></tr>
                            <tr><td>제조사 : (주)라뒤르</td></tr>
                            <tr><td>제품크기 : ${b.product_Size}</td></tr>
                            <tr><td>제품중량 : ${b.product_Weight}</td></tr>
                            <tr><td>상품금액 : ${b.product_Price}</td></tr>
                            <tr><td>상품재고 : ${b.product_Stock}</td></tr>
                            <tr><td>포장단위10개(1BOX)단위로 주문가능</td></tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">결제하기</div>
				<div class="card-body">
					<c:choose>
						<c:when test="${loginIdNow.authList[0].memberType eq mType[0] || loginIdNow.authList[0].memberType eq mType[1]}">
							<a href="${contextPath}/member/myPage"><button class="btn btn-primary px-5">주문하기</button></a>
							<a href="${contextPath}/member/myPage"><button class="btn btn-white px-5" style="border : 1px solid blue;">주문내역</button></a>
						</c:when>
						<c:when test="${loginIdNow.authList[0].memberType eq mType[2] || loginIdNow.authList[0].memberType eq mType[3]}">
							
							<button name="order" class="btn btn-primary px-5 buyBtn">주문하기</button>
							<a href="${contextPath}/member/myPage"><button class="btn btn-white px-5" style="border : 1px solid blue;">주문내역</button></a>
						</c:when>
						<c:otherwise>
							<a href="${contextPath}/member/login"><button class="btn btn-primary px-5">주문하기</button></a>
							<a href="${contextPath}/member/login"><button class="btn btn-white px-5" style="border : 1px solid blue;">주문내역</button></a>
						</c:otherwise>
					</c:choose>
				</div>
            </div>
            
            <div class="line"></div>
			<div class="button">
				<div class="button_quantity">
					주문수량
					<input type="text" class="quantity_input" value="1">
					<span>
						<button class="plus_btn">+</button>
						<button class="minus_btn">-</button>
					</span>
				</div>
				<div class="button_set">
					<a class="btn_cart">장바구니담기</a>
					<a class="btn_buy">바로구매</a>
				</div>
			</div>
            
        </div>
    </div>
</div>
<p class="text-center" style="font-size:17px; font-weight: bold">${b.product_Content}</p>

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
	
	// 수량 버튼 조작
	let quantity = $(".quantity_input").val();
	$(".plus_btn").on("click", function(){
		$(".quantity_input").val(++quantity);
	});
	$(".minus_btn").on("click", function(){
		if(quantity > 1){
			$(".quantity_input").val(--quantity);	
		}
	});

	// 서버로 전송할 데이터
	const form = {
			memberId : '${loginIdNow.memberId}',
			product_Bno : '${b.product_Bno}',
			product_Count : ''
	}	
	
	// 장바구니 추가 버튼
	$(".btn_cart").on("click", function(e){
		
		console.log(form);
		const token = $("[name='_csrf']").val()
		const header = $("[name='_csrf_header']").val()
		form.product_Count = $(".quantity_input").val();

		$.ajax({
			url: `${contextPath}/cart/add`,
			type: 'POST',
			data: form,
			beforeSend : function(xhr) {
                xhr.setRequestHeader(header, token);
            },
			success: function(result){
				cartAlert(result);
			}
		})
	});
	
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}
	
	
	
	/* $('.buyBtn').on('click', function() {
		$('<form/>').attr('method','get')
			.attr('action','${contextPath}/product/order')
			.append('<input type="hidden" value="${b.product_Bno}" name="product_Bno">')
			.appendTo('body')
			.submit();
	}); */

	
	
	
});
</script>
