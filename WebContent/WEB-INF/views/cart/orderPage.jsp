<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">

	<div class="jumbotron-white mt-5">
		<h1 class="text-left">장바구니페이지</h1>
	</div>

${cart}

			<%-- <table class="table mt-3">
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
						<td><a href="${b.bno}" class="goDetail">${b.title}</a></td>
						<td>${b.fileName}</td>
						<td>${b.writer}</td>
						<td>${b.writeDate}</td>
					</tr>
				</c:forEach>
			</table> --%>
		</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>