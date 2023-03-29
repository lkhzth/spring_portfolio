<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="container">
	<div class="jumbotron">
		<h1>글쓰기</h1>
	</div>

${loginId}

	<form action="${contextPath}/board/write?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<!-- 모든 요청에 토큰을 발급하여 서버에서 검증하는 방어 방법, 발급된 토큰을 서버로 전달하지 않으면 요청이 허락되지 않기 때문에 효과적(접근거부핸들러실행) 
			 로그인할때 세션에 난수를 담아서 서버에 저장,해당 로그인아이디가 쓰기,수정요청할때 토큰을 함께 보내 서버에 저장된 세션안의 토큰의 난수와 비교하여 맞으면 요청실행
			 안맞으면 접근거부핸들러-csrf방어 
			 multipart있을경우 input으로 요청불가
			 form 이 multipart(이미지전송) 형식일때 필터에서 getParameter 로 파라미터를 가져올 수가 없어서 토큰을 확인못해서 컨트롤러로 넘어가기전에 오류생김(이미지인식불가)
			 request의 형식이 바뀌어 인식을 못함
			 스프링시큐리티의 경우 Filter를 기반으로 동작하는데 enctype="multipart/form-data"로 파일업로드하는경우 기본적으로 Filter Chain을 타지 않는 제약사항이 발생
			 
			 gpt질문결과
			 multipart/form-data는 파일 업로드를 위한 인코딩 방식으로, 이 방식을 사용하면 HTTP 요청에서 파일 데이터를 별도의 바이너리 데이터로 분리하여 전송
			 이에 따라 일반적인 HTTP 요청과는 다른 형태의 요청이 생성되므로, CSRF(Cross-Site Request Forgery) 공격 방어를 위한 토큰 검사 등의 보안 기능을 사용하는 경우 별도의 처리가 필요
			보안 기능을 사용하는 경우, 일반적으로 웹 애플리케이션에서는 CSRF 토큰을 HTTP 요청의 본문이나 HTTP 헤더에 포함하여 전송,
			파일 업로드와 같은 multipart/form-data 인코딩을 사용하는 경우, 이 방법으로는 토큰을 전송불가 일반적으로는 multipart/form-data 인코딩을 사용하는 요청에서 
			CSRF 토큰을 전송하기 위해, URL Query String에 포함시켜 보내는 방법을 사용
			method가 post요청이고 controller에서도 postMapping으로 요청을 받음, 요청 데이터가 HTTP 본문에 포함되어 전송되기 때문에, 요청 URL에 데이터가 포함안됨 
		-->
		
		<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
		<!-- ?bno=1 -->
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
				<td><input type="text" class="form-control" name="writer" value="${loginIdNow}" readonly="readonly"></td>
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
