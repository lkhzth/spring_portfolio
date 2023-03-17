package com.jafa.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductPagination {
	private ProductCriteria productCriteria;
	private int startPage;
	private int endPage;
	private int tempEndPage;
	private int displayPageNum;
	
	private boolean prev;
	private boolean next;
	
	public ProductPagination(ProductCriteria productCriteria, int totalCount) {
		this.productCriteria = productCriteria;
		this.displayPageNum = 12;
		
		endPage = (int) Math.ceil(productCriteria.getPage() / (double)displayPageNum) * displayPageNum;
		startPage = endPage - displayPageNum + 1;
		tempEndPage = (int) Math.ceil((double)totalCount / productCriteria.getPerPageNum());
		
		prev = startPage != 1;
		next = endPage < tempEndPage;
		
		if(endPage > tempEndPage) endPage = tempEndPage;
	
	}
}
