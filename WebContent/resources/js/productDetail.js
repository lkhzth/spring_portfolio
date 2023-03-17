console.log('productDetail.js');

$(function(){
	let pageValue = getSearchParam('page');
	let typeValue = getSearchParam('type');
	let keywordValue = getSearchParam('keyword');
	
	$('.list').on('click', function(){
		let detailForm = $('<form>');
		detailForm.empty();
		detailForm.attr('method', 'get')	
			.attr('action', `${contextPath}/product/list`)
			.append(getInputHiddenTag("page",pageValue))
		if(typeValue != null && keywordValue != null){
			detailForm.append(getInputHiddenTag('type', typeValue))
				.append(getInputHiddenTag('keyword', keywordValue))
		}
			detailForm.appendTo('body')
			.submit();
	});
});