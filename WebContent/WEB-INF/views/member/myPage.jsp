<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberVO" var="loginIdNow"/>
	</sec:authorize>
	
	${loginIdNow }

<div class="container">
	<div class="jumbotron bg-warning">
		<h1>회원관리</h1>
	</div>

	<form action="${contextPath}/member/myPage?${_csrf.parameterName}=${_csrf.token}" method="post">
		<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>주소</th>
				<th>휴대폰번호</th>
				<th>회원상태</th>
				<th>회원등급</th>
				<th>회원정보수정</th>
			</tr>
			<c:choose>
				<c:when test="${memberInfo.authList[0].memberType eq mType[0]}">
					<c:forEach items="${list}" var="m" varStatus="mst">
						<tr>
							<td>
								${m.mno}
								<input type="hidden" class="form-control modifyMno" name="mno" 
								value='<c:out value="${m.mno}"/>' readonly="readonly">
							</td>
							<td>${m.memberId}</td>
							<td>${m.memberName}</td>
							<td>${m.memberEmail}</td>
							<td>${m.memberAddress}</td>
							<td>${m.memberPhone}</td>
							<td>${m.enabled}</td>
							<td>${m.authList[0].memberType}</td>
							<td>
								<div class="text-right pb-2">
									<div class="row">
										<div class="col-lg-9">
											<div class="panel panel-default">
												<div class="panel-heading">
													<i class="fa fa-comments fa-fw">
														<button type="button" class="btn btn-success btn-xs float-right modifyInfo">정보수정</button><br>
													</i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${memberInfo.mno}</td>
						<td>${memberInfo.memberId}</td>
						<td>${memberInfo.memberName}</td>
						<td>${memberInfo.memberEmail}</td>
						<td>${memberInfo.memberAddress}</td>
						<td>${memberInfo.memberPhone}</td>
						<td>${memberInfo.enabled}</td>
						<td>${loginIdNow.authList[0].memberType}</td>
						<td>
							<div class="text-right pb-2">
								<div class="row">
									<div class="col-lg-8">
										<div class="panel panel-default">
											<div class="panel-heading">
												<i class="fa fa-comments fa-fw">
													<button class="btn btn-success btn-xs float-right modifyInfo">정보수정</button><br>
												</i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>	
				</c:otherwise>
			</c:choose>
		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel"정보수정창</h5>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>이름</label><input class="form-control" name="memberName" value="${m.memberName}">
						</div>
						<div class="form-group">
							<label>이메일</label><input class="form-control" name="memberEmail" value="${m.memberEmail}">
						</div>
						<div class="form-group">
							<label>주소</label><input class="form-control" name="memberAddress" value="${m.memberAddress}">
						</div>
						<div class="form-group">
							<label>휴대폰번호</label><input class="form-control" name="memberPhone" value="${m.memberPhone}">
						</div>
					</div>
					<div class="modal-footer">
						<button id="modalModBtn" type="button" class="btn btnwarning">수정</button>
						<button id="modalCloseBtn" type="button" class="btn btndefault">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
		</table>
		
		<div class="float-right">
			<a class="btn btn-primary" href="${contextPath}">메인페이지</a>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
				<a class="btn btn-primary" href="${contextPath}/board/list">메인게시판</a>
			</sec:authorize>
		</div>
	</form>
	</div>
</div>

<%@ include file="../layout/footer.jsp" %>

<script>
$(function() {
	
	var bnoValue = '<c:out value="${m.mno}"/>';
	var modal = $("#myModal");
	// 회원리스트 수정용 모달.
	var modalInputMemberName = modal.find("input[name='memberName']");
	var modalInputMemberEmail = modal.find("input[name='memberEmail']");
	var modalInputMemberAddress = modal.find("input[name='memberAddress']");
	var modalInputMemberPhone = modal.find("input[name='memberPhone']");
	// 리스트 항목.
	var modalModBtn = $("#modalModBtn");
	// 모달에서 표시되는 수정버튼.
	
	// 정보수정 모달창 보이기
	$(".modifyInfo").on("click", function(e){
		// 수정 버튼을 클릭한다면,
		$("#myModal").modal("show"); // 모달 표시.
		
			var mno = $('.modifyMno').val();
        // 회원리스트에 포함된 값들 중에서 mno를 추출하여 변수 할당.
        
        modService.myPageDetail(mno,function(modifyMember){
        	modalInputMemberName.val(modifyMember.memberName);
        	modalInputMemberEmail.val(modifyMember.memberEmail);
        	modalInputMemberAddress.val(modifyMember.memberAddress);
        	modalInputMemberPhone.val(modifyMember.memberPhone);
            // 댓글 목록의 값들을 모달창에 할당.
            modal.data("mno", modifyMember.mno);
            
            
            // 표시되는 모달창에 rno 라는 이름으로 data-rno를 저장.
            $("#myModal").modal("show");
        });
		
	});
	
	$('.modifyInfo').click(function() {
		$('#myModal').show();
	})
	 
	$('.btndefault').click(function() {
		$("#myModal").modal("hide");
	})
	
	
	var mnoValue = $('.modifyMno').val();
	
	// 회원정보 수정처리
	$('#modalModBtn').on("click", function() {
		var modifyMember = {
				mno : mnoValue,
				modifyMemberName : $('.modal').find("input[name='memberName']").val(),
				modifymemberEmail : $('.modal').find("input[name='memberEmail']").val(),
				modifymemberAddress : $('.modal').find("input[name='memberAddress']").val(),
				modifymemberPhone : $('.modal').find("input[name='memberPhone']").val()
		};
		modService.update(modifyMember, function(result){
			alert(result);
			$('.modal').modal("hide");
			showList(-1);
		}); 
	}); 
});

 
 // 회원정보처리 js, ajax
 var modService = (function() {
		const token = $("[name='_csrf']").val()
		const header = $("[name='_csrf_header']").val()

		// 한 개의 회원정보를 읽는 기능창생성
	 function myPageDetail(mno, callback, error){
        $.get(`${contextPath}/member/` + mno, function(result){
            if(callback){
                callback(result);
            }
        }).fail(function(xhr, status, er){
            if(error){
                error(er);
            }
        });
    }
		
	function update(modifyMember, callback, error){
		$.ajax({
            type : 'put',
            url : `${contextPath}/member/` + modifyMember.mno,
            data : JSON.stringify(modifyMember),
            contentType : "application/json;charset=utf-8",
            beforeSend : function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success : function(result, status, xhr) {
                alert('성공')
            	if(callback){
                    callback(result);
                }  
            }
        });
    }	
	return {
		update : update,
		myPageDetail : myPageDetail
	};
})();
</script>

