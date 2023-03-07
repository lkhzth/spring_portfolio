<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="container">
	<div class="jumbotron">
		<h1>글쓰기</h1>
	</div>
	${cateList }		
	<form action="${contextPath}/board/write" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td class="col-2">게시판분류</td>
				<td>
					<select name="category.cid" class="form-control">
						<c:forEach items="${cateList}" var="c">
							<option value="${c.cid}">${c.cname}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" class="form-control" name="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" class="form-control" name="content"></textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" class="form-control" name="writer"></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" class="form-control" name="attachFile"></td>
			</tr>
		</table>
		<button>확인</button>
	</form>	


</div>

<%@ include file="../layout/footer.jsp"%>
