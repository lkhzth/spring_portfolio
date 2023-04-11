<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<%-- <sec:authentication property="principal.username"/> --%>

${mType[0]}<br>

${authList[0].memberType}

<div class="container">
	<div class="jumbotron">
		<h2>게시물상세</h2> 
	</div>
	<div class="card">
		<div class="card-header">
			<div>
				<span class="badge badge-primary">게시물번호 ${b.bno}
					 <input type="hidden" class="form-control" name="bno"
						value='<c:out value="${b.bno}"/>' readonly="readonly">
				</span>
				<span class="badge badge-info">${b.writer}</span>
				<span class="ml-4">${b.title}</span>
			</div>
		</div>
		<div class="card-body" style="min-height:350px">
			${b.content}
		</div>
		<div class="card-footer">
			<c:if test="${loginIdNow eq b.writer || authList[0].memberType eq mType[0]}">
				<button class="btn btn-warning modBoard">수정하기</button>
				<button class="btn btn-danger delBoard">삭제하기</button>
			</c:if>
			<a href="${contextPath}/board/list"><button class="btn btn-info">목록으로</button></a>
		</div>
	</div>	

	<!-- 첨부파일 있을때 -->
	<c:if test="${not empty attachList.fileName && attachList.fileType eq 'IMAGE'}">
		<!-- 파일다운로드 -->
		<h3>이미지 미리보기</h3>
		<div class="media border p-3 my-2">
			<div class="media-body d-flex justify-content-between">
				<div>
					<a href="${contextPath}/download?fileName=${b.bno}/${attachList.fileName}">
						<img src="${contextPath}/imgDisplay?fileName=${b.bno}/${attachList.fileName}" style="width: 200px">
						${attachList.fileName}
					</a>			
				</div>
			</div>
		</div>							 
	</c:if>
		
	<c:if test="${not empty attachList.fileName && attachList.fileType eq 'OTHER'}">
		<div class="media border p-3 my-2">
			<div class="media-body d-flex justify-content-between">
				<a href="${contextPath}/download?fileName=${b.bno}/${attachList.fileName}">
					${attachList.fileName}
				</a>
			</div>
		</div>	
	</c:if>		

	<!-- 첨부파일 없을때 -->
	<c:if test="${empty attachList}">
		<div class="media border p-3 my-2">
			<div class="media-body">
				<b>등록된 첨부파일 없음</b>
			</div>
		</div>	
	</c:if>

	<!-- 덧글 목록 시작 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw">
						<sec:authorize access="isAuthenticated()"> <!-- 권한이 있는 경우(로그인한 사용자) -->
							<button id="addReplyBtn" class="btn btn-primary btn-xs float-right">댓글작성</button>
						</sec:authorize><br>
					</i>
				</div>
				<br>
				<div class="panel-body">
					<ul class="chat">
						<li>good</li>
					</ul>
				</div>
				<div class="panel-footer"></div>
			</div>
		</div>
	</div>
	<!-- 댓글 목록 끝 -->
	
	<!-- 댓글 작성용 모달 시작 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">댓글창</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>댓글</label><input class="form-control" name="reply" value="새 댓글">
					</div>
					<div class="form-group">
						<label>작성자</label><input class="form-control" name="writer" value="${loginIdNow}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>댓글작성일</label><input class="form-control" name="replyDate" value="">
					</div>
				</div>
				<div class="modal-footer">
					<sec:authorize access="isAuthenticated()">
						<button id="modalModBtn" type="button" class="btn btnwarning">수정</button>
						<button id="modalRemoveBtn" type="button" class="btn btndanger">삭제</button>
						<button id="modalRegisterBtn" type="button" class="btn btnprimary">등록</button>
					</sec:authorize>
					<!-- 로그인 하지 않을경우 모달창에서 수정,삭제불가 로그인 후 회원,관리자일때 버튼보이도록-->
					<button id="modalCloseBtn" type="button" class="btn btndefault">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 덧글 작성 모달 끝 -->
</div>
<%@ include file="../layout/footer.jsp" %>

<script>
$(function() {
	
	$('.delBoard').on('click', function() {
		const token = $("[name='_csrf']").val()
		const header = $("[name='_csrf_header']").val()
		
		$('<form/>').attr('method','post')
			.append($('<input/>').attr('type','hidden').attr('name','_csrf').val(token))
			.attr('action','${contextPath}/board/remove?bno=${b.bno}')
			.appendTo('body')
			.submit();
	})
	$('.modBoard').on('click', function() {
		$('<form/>').attr('method','get')
			.attr('action','${contextPath}/board/modify')
			.append('<input type="hidden" value="${b.bno}" name="bno">')
			.appendTo('body')
			.submit();
	})
	
	var bnoValue = '<c:out value="${b.bno}"/>';
		var modal = $("#myModal");
		// 덧글 용 모달.
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		// 덧글 작성일 항목.
		var modalRegisterBtn = $("#modalRegisterBtn");
		// 모달에서 표시되는 덧글쓰기 버튼.
		var modalInputReply = modal.find("input[name='reply']");
		// 덧글 내용
		var modalInputWriter = modal.find("input[name='writer']"); 
		// 덧글작성자
		
		// 덧글 입력 모달창 보이기
		$("#addReplyBtn").on("click", function(e){
			// 덧글 쓰기 버튼을 클릭한다면,
			if($("input[name=writer]").prop("readonly")){
//				modal.find("input").removeAttr("readonly");
//				modal.find("input").val("");
				modal.find("input[name=reply]").val("");
				modal.find("input[name=writer]").val();
			} else {
				modal.find("input[name=reply]").val("");
			}
			// 모달의 모든 입력창을 초기화
			modalInputReplyDate.closest("div").hide();
			// closest : 선택 요소와 가장 가까운 요소를 지정.
			// 즉, modalInputReplyDate 요소의 가장 가까운 div를 찾아서 숨김.(날짜창 숨김)
			modal.find("button[id != 'modalCloseBtn']").hide();
			// 모달창에 버튼이 4개 인데, 닫기 버튼을 제외하고 숨기기.
			modalRegisterBtn.show(); // 등록 버튼은 보여라.
			$("#myModal").modal("show"); // 모달 표시.
		});
		
		// 모달창 닫기
		$("#modalCloseBtn").on("click", function(e){
			modal.modal("hide");
			// 모달 닫기 라는 버튼을 클릭한다면 모달창을 숨김.
		});
		
			
		// 덧글 쓰기
		modalRegisterBtn.on("click", function(e){
			// 덧글 등록 버튼을 눌렀다면,
			var reply = {
					reply : modalInputReply.val(),
					writer : modalInputWriter.val(),
					bno : bnoValue
			}; // ajax로 전달할 reply 객체 선언 및 할당.
			replyService.add(reply, function(result){
				alert(result); 
				// ajax 처리후 결과 리턴.
				modal.find("input[name=reply]").val("");
				// 모달창 초기화
				modal.modal("hide"); // 모달창 숨기기
				
				// 댓글작성시 즉시 목록 갱신용 함수 호출
				showList(-1);
				// -1 이나 99나 현재는 영향이 없지만 차후 덧글의 페이징 처리에서 -1 사용 예정
			});
		}); // 덧글 쓰기버튼처리 끝.
		
		// 덧글 목록 보이기.
		replyService.getList({
			bno : bnoValue,
			page : 1
		}, function(list){
			for(var i=0, len = list.length || 0; i<len; i++){
				console.log(list[i]);
			}
		});
			
	var replyUL = $(".chat");
		function showList(page){
			replyService.getList(
					{
						bno : bnoValue,
						page : page || 1
					},
					// 익명함수 : 이름이 없으며 즉시 실행
					function(list) {
						var str = "";
						
						if (list ==null || list.length == 0 ){
							replyUL.html("");
							return;
						} // 목록이 없을때 처리 끝.
						
						for (var i = 0, len = list.length || 0; i<len; i++){
							str += "<li class='left ";
							str += "clearfix' data-rno='";
							str += list[i].rno+"'>";
							str += "<div><div class='header' ";
							str += "><strong class='";
							str += "primart-font'>";
							str += list[i].writer+ "</strong>";
							str += "<small class='float-sm-right '>";
							str += replyService.displayTime(list[i].replyDate)
							+ "</small></div>";
							str += "<p>" + list[i].reply;
							str += "</p></div></li>";
						}
						replyUL.html(str); 
					}); // end
		} // end_showlist
		showList(1);
		// 덧글 목록 표시 끝
		
	// 댓글 수정 삭제버튼 추가
	var modalModBtn=$("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	// 댓글 정보 확인
       $(".chat").on("click", "li", function(e){
           // 클래스 char 을 클릭하는데, 하위 요소가 li라면,
           var rno = $(this).data("rno");
           // 덧글에 포함된 값들 중에서 rno를 추출하여 변수 할당.
           
           replyService.get(rno,function(reply){
               modalInputReply.val(reply.reply);
               modalInputWriter.val(reply.writer)
               			.attr("readonly", "readonly");
               modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
                       .attr("readonly", "readonly"); 
               // 댓글 목록의 값들을 모달창에 할당.
               modal.data("rno", reply.rno);
               // 표시되는 모달창에 rno 라는 이름으로 data-rno를 저장.
               modal.find("button[id != 'modalCloseBtn']").hide();
               modalModBtn.show();
               modalRemoveBtn.show();
               // 버튼 보이기 설정.
               $("#myModal").modal("show");
           }); // 끝_덧글 읽기.
       });
	
     // 댓글 수정 처리
	modalModBtn.on("click", function(e) {
		var reply = {
				rno : modal.data("rno"),
				reply : modalInputReply.val()
		};
		replyService.update(reply, function(result){
			alert(result);
			modal.modal("hide");
			showList(-1);
		});
	}); // 댓글 수정 끝
	
	// 덧글 삭제 처리.
	modalRemoveBtn.on("click", function(e){
		var rno = modal.data("rno");
		replyService.remove(rno, function(result){
			alert(result);
			modal.modal("hide");
			showList(-1);
		});
	});
		
});

</script>
