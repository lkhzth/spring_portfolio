<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<input type="hidden" name="page" class="page" value="${cri.page}">
<div class="container">
	<div class="jumbotron">
		<h1>게시판</h1>
	</div>

	<p class="text-center"><a href="${contextPath}/board/list">전체</a></p>
	  <ul class="nav justify-content-center">
	    <c:forEach items="${cateList}" var="c">
	    	<li class="nav-item ${cid==c.cid ? 'list-group-item-primary' : ''}">
			  	<a class="nav-link mx-4" href="${contextPath}/board/list/${c.cid}">${c.cname}</a>
		  	</li>
		</c:forEach>
	  </ul>

	<div class="row">
		<div class="col-12">
				<div class="my-3">
					<form class="form-inline searchForm">
						<select class="form-control mr-2 category">
							<%-- <option value="${c.cid}" ${cid != c.cid ? 'selected' : ''}><a href="${contextPath}/board/list">전체</a></option> --%>
							<option value="">전체</option>
							<c:forEach items="${cateList}" var="c">
			 					<option value="${c.cid}" ${cid == c.cid ? 'selected' : ''}>${c.cname}</option>
							</c:forEach>
						</select>
						<select name="type" class="form-control mr-2">
							<option value="T" ${cri.type eq 'T' ? 'selected' : ''}>제목</option>
							<option value="C" ${cri.type eq 'C' ? 'selected' : ''}>내용</option>
							<option value="W" ${cri.type eq 'W' ? 'selected' : ''}>작성자</option>
						</select>
						<div class="form-group mr-2">
							<input type="search" class="form-control" name="keyword" value="${cri.keyword}">
						</div>
						<div class="form-group mr-2">
							<button type="button" class="btn btn-primary">검색</button>
						</div>
						<div class="form-group mr-2">
							<a href="${contextPath}/board/list" class="btn btn-info">새로고침</a>
						</div>
					</form>	
				</div>
				
			<table class="table">
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th>제목</th>
					<th>첨부이미지</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${list }" var="b">
					<tr>
						<td>${b.bno}</td>
						<td>
							${b.category.cname}
							<input type="hidden" class="cateName" value="${b.category.cname}">
						</td>
						<td>
							<!-- <a href="${contextPath}/board/detail?bno=${b.bno}">${b.title}</a> -->
							<a href="${b.bno}" class="goDetail">${b.title}</a>
						</td>
						<td>${b.fileName}</td>
						<td>${b.writer}</td>
						<td>${b.writeDate}</td>
					</tr>
				</c:forEach>
			</table>
			
			<div class="mb-2">
				<a href="${contextPath}/board/write" class="btn btn-primary">글쓰기</a>
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

<%@ include file="../layout/footer.jsp"%>
