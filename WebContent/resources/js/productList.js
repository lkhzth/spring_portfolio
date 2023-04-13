console.log('productList.js');

$(function() {
	let typeValue = getSearchParam('type');
	let keywordValue = getSearchParam('keyword');
	let category = $('.category').val();
	
	// 검색
	$('.searchForm button').on('click', function() {
		let category = $('.searchForm').find('.category').val(); 
		// 클래스선택자searchForm인 form안에 있는 클래스선택자category인 select요소 값 가져옴
		$('.searchForm')
			.attr(
				"action", `${contextPath}/product/list/${category}`
			).submit(); 
	});
	
	// 페이지 이동
	$('.pagination a').on('click', function(e) { // 선택자pagination내 a태그 선택
		e.preventDefault();
		let pageForm = $('<form>');
		pageForm.empty(); // form 안의 내용 비움
		// 속성추가
		pageForm.attr({ 
			'method' : 'get',
			'action' : `${contextPath}/product/list/${category}`
		}).append(getInputHiddenTag('page', $(this).attr('href'))) 
		// hidden input태그생성, 페이지번호 두가지를 form에 추가. ->클릭된 링크의 href값이 페이지번호표시
		
		// 검색 조건이 존재할 경우, 해당 조건을 hidden input 태그로 추가
		if(typeValue != null && keywordValue != null) {
			pageForm.append(getInputHiddenTag('type', typeValue))
			.append(getInputHiddenTag('keyword', keywordValue))
		}
		pageForm.appendTo('body').submit();
	});
	
	// 상세페이지
	$('.goDetail').on('click', function(e) {
	
		e.preventDefault();
		let cateName = $(this).closest('td').prev().find('.cateName'); 
		/* 
			클릭된 요소(this)를 기준으로 가장 가까운 td를 찾고, 
			그 이전(prev()) td요소내에서 클래스명이 cateName인 요소를 찾은 값을 cateName 변수에 저장(카테고리이름) 
		*/		
		console.log(cateName.val());
		
		let goDetailForm = $('<form>');
		goDetailForm.empty(); // 모든 자식요소삭제
		goDetailForm.attr({
			'method' : 'get',
			'action' : `${contextPath}/product/detail`
		}).append(getInputHiddenTag('product_Bno', $(this).attr('href')))
		.append($('.page'))
		if(typeValue != null && keywordValue != null) {
			goDetailForm.append(getInputHiddenTag('type', typeValue))
			.append(getInputHiddenTag('keyword', keywordValue))
		}
		goDetailForm.appendTo('body').submit();
	})
});