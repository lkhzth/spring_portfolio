console.log('reply.js');

var replyService = (function() {
	
	const token = $("[name='_csrf']").val()
	const header = $("[name='_csrf_header']").val()
	
	// 댓글추가
	function add(reply, callback, error) {
		// reply : 댓글 객체
		// callback : 댓글 등록 후 수행할 메소드. 비동기
		// 주문과 동시에 처리할 내용도 전달. 페이지 이동없이 새로운 내용 갱신.
		console.log(reply);

		$.ajax({
			type: 'post',
			url: `${contextPath}/reply/new`,
			data: JSON.stringify(reply),
			// 전달 받은 객체를 json으로 변환.
			contentType: "application/json; charset=utf-8",
			beforeSend : function(xhr) {
                xhr.setRequestHeader(header, token);
            },
			success: function(result) {
				if (callback) {
					callback(result);
				}
			},
			error: function(er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function getList(param, callback, error){
		console.log("getList");
		var bno = param.bno;
		var page = param.page || 1;
		// 페이지 번호가 있으면 페이지 번호 전달 없으면 1전달.
		$.getJSON(`${contextPath}/reply/pages/` + bno + "/" + page,
				function(data){
					if(callback){
						callback(data);
					}
				}).fail(function(xhr, status, err){
					// xhr : xml  htpp request의 약자.
					// 현재는 사용되지않고 형식만 맞춰줌
					if (error){
						error(er);	
					}
				});
	}

	 function displayTime(timeValue){
            var today = new Date(); // 현재 시간
            var gap = today.getTime() - timeValue;
            // 시간차이 연산.
            var dateObj = new Date(timeValue);
            // 덧글이 등록된 시간을 변수에 할당.
            var str = "";
            
            if(gap<(1000*60*60*24)){
                // 시간차이가 24시간 미만이 라면,
                var hh = dateObj.getHours();
                var mi = dateObj.getMinutes();
                var ss = dateObj.getSeconds();
                
                return [ (hh>9?'':'0')+hh, ':'
             ,(mi>9?'':'0')+mi
             ,':',(ss>9?'':'0')+ss].join('');
 
                // 배열 요소를 문자열로 변환. join
                // 시간에 포맷을 맞추기 위해서
                // 0~9 까지는 앞에 0을 추가 표시.
            }else{
                var yy = dateObj.getFullYear();
                var mm = dateObj.getMonth()+1;
                var dd = dateObj.getDate();
                
                return [yy, '/', (mm>9?'':'0')+mm, '/',
                    (dd>9?'':'0')+dd].join('');
            }
        }

	// 한 개의 덧글을 읽는 기능창생성
	 function get(rno, callback, error){
        $.get(`${contextPath}/reply/` + rno, function(result){
            if(callback){
                callback(result);
            }
        }).fail(function(xhr, status, er){
            if(error){
                error(er);
            }
        });
    }

	// 댓글 수정 처리
	 function update(reply, callback, error){
        // console.log("rno: " + reply.rno);
        $.ajax({
            type : 'put',
            url : `${contextPath}/reply/` + reply.rno,
            data : JSON.stringify(reply),
            contentType : "application/json;charset=utf-8",
            beforeSend : function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success : function(result, status, xhr) {
                if(callback){
                    callback(result);
                }
            }
        });
    }

	// 댓글 삭제 처리
	function remove(rno, callback, error){
        	
    	$.ajax({
    		type : 'delete',
    		url : `${contextPath}/reply/` + rno,
    		beforeSend : function(xhr) {
                xhr.setRequestHeader(header, token);
            },
    		success : function(deleteResult, status, xhr) {
    			if (callback) {
    				callback(deleteResult);
    			}
    		},
    		error : function(xhr, status, er) {
    			if (error){
    				error(er);
    			}
    		}
    	});
    }

	return {
		add : add, // 변수명.호출명 예) replyService.add
		getList : getList,
		displayTime : displayTime,
		get : get,
		update : update,
		remove : remove
	}; // 변수명.호출명 ex)replyService.add
})(); // 즉시 실행 함수: 명시하는 것과 동시에 메모리에 등록.