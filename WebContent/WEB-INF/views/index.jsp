<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>
<script src="${contextPath}/resources/js/slide.js"></script>
	<div class="one-time">
		<div><img src="${contextPath}/resources/images/main01.png"></div>
		<div><img src="${contextPath}/resources/images/main02.png"></div>
	</div>

<div class="container">
	<div>
		<spring:message code="main.greeting" arguments="${name},${welcome}"/>
	</div>
</div>

<script src="${contextPath}/resources/js/productList.js"></script>

<input type="hidden" name="page" class="page" value="${cri.page}">
<div class="container-xxl mx-5">
	
	<p class="text-center"><a href="${contextPath}/product/list">전체</a></p>
	  <ul class="nav justify-content-center">
	    <c:forEach items="${productCateList}" var="c">
	    	<li style="border-radius:15px; border:2px solid #d8d8d7" class="nav-item ${cateId==c.cateId ? 'list-group-item-primary' : ''}">
			  	<a class="nav-link mx-4" href="${contextPath}/product/list/${c.cateId}">${c.cateName}</a>
		  	</li>
		</c:forEach>
	  </ul>

	<div class="row">
		<div class="col-12">
				<div class="my-3">
					<form class="form-inline searchForm justify-content-center">
						<select class="form-control category">
							<option value="">전체</option>
							<c:forEach items="${productCateList}" var="c">
			 					<option value="${c.cateId}" ${cateId == c.cateId ? 'selected' : ''}>${c.cateName}</option>
							</c:forEach>
						</select>
						<select name="type" class="form-control mr-2">
							<option value="N" ${cri.type eq 'N' ? 'selected' : ''}>상품이름</option>
							<option value="C" ${cri.type eq 'C' ? 'selected' : ''}>상품내용</option>
						</select>
						<div class="form-group mr-2">
							<input type="search" class="form-control" name="keyword" value="${cri.keyword}">
						</div>
						<div class="form-group mr-2">
							<button type="button" class="btn btn-primary">검색</button>
						</div>
						<div class="form-group mr-2">
							<a href="${contextPath}/product/list" class="btn btn-info">새로고침</a>
						</div>
						<div class="form-group mr-2 ml-5">
							<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
								<a href="${contextPath}/product/write" class="btn btn-success">상품등록(관리자)</a>
							</sec:authorize>
						</div>
					</form>	
				</div>

				<div class="row text-center">
				    <c:forEach items="${list}" var="b" varStatus="status">
				        <div class="col-md-3">
				            <a href="${b.product_Bno}" class="goDetail">
				                <img src="${contextPath}/imgProductDisplay?fileName=${b.product_Bno}/${b.fileName_Product}" style="width: 100%">
				                <p class="text-center">${b.product_Name}</p>
				            </a>
				            <span class="text-center" style="font-size:12px">${b.product_Intro}</span>
				        </div>
				        <c:if test="${status.index % 4 == 3}">
	            </div><div class="row text-center">
				        </c:if>
				    </c:forEach>
				</div>
			
			<div class="d-flex justify-content-center">
				<ul class="pagination text-center">
					<c:if test="${p.prev}">
						<li class="page-item">
							<a class="page-link" href="${p.startPage - 1}">이전페이지</a>
						</li>
					</c:if>
					
					<c:forEach begin="${p.startPage}" end="${p.endPage}" var="pageNum">
						<li class="page-item ${cri.page == pageNum ? 'active' : ''}">
							<a class="page-link" href="${pageNum}">${pageNum}</a>
						</li>
					</c:forEach>
					
					<c:if test="${p.next}">
						<li class="page-item">
							<a class="page-link" href="${p.endPage + 1}">다음페이지</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
		</div> 
	</div>
</div>	

<%@ include file="layout/footer.jsp" %>

<script>
let message = "${message}";
if(message!='') alert(message);

let loginOn = "${loginOn}";
if(loginOn!='') alert(loginOn);

</script>
