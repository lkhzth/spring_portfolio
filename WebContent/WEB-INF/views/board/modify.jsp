<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<div class="container">
	<h1>글수정</h1>
	<form action="${contextPath}/board/modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bno" value="${b.bno}">
		<table class="table">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" class="form-control" name="title" value="${b.title}">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" class="form-control" name="content">${b.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${b.writer}</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<c:if test="${empty b.fileName}">
						<b>첨부파일 없음</b>
						<input type="file" name="attachFile" class="form-control">
					</c:if>
					<c:if test="${not empty b.fileName}">
						<div>
							<span>파일 삭제 : <input type="checkbox" name="delChk" class="delChk"></span>
							<input type="file" name="attachFile" class="form-control attachFile">
						</div>
						<c:if test="${b.fileType eq 'IMAGE'}">
							<a href="${contextPath}/download?fileName=${b.bno}/${b.fileName}">
								<img src="${contextPath}/imgDisplay?fileName=${b.bno}/${b.fileName}">
								
							</a>
						</c:if>
						<c:if test="${b.fileType eq 'OTHER'}">
							<a href="${contextPath}/download?fileName=${b.bno}/${b.fileName}">
								${b.fileName}
							</a>
						</c:if>
					</c:if>
				</td>
			</tr>0
			<tr>
				<td colspan="2">
					<button class="btn btn-primary">수정</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
	$(function() {
		$('.delChk').change(function() {
			if($(this).prop('checked')) {
				// 체크
				$('.attachFile').hide();
			} else {
				// 언체크
				$('.attachFile').show();
			}
		})
		
		$('.attachFile').change(function() {
			let fileFormVal = $(this).val();
			if(fileFormVal != '') {
				$('.delChk').hide();
			} else {
				$('.delChk').show();
			}
		})
	});
</script>
