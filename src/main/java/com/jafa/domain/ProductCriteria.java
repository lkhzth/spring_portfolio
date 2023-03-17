package com.jafa.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductCriteria {
	private int page;
	private int perPageNum;
	
	private ProductCategory productCategory;
	
	private String type;
	private String keyword;
	
	public ProductCriteria() {
		this(1, 12);
	}
	
	public ProductCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	
	// #{maxRow}
	public int getMaxRow() {
		return this.page * this.perPageNum;
	}
	
	// #{minRow}
	public int getMinRow() {
		return (this.page - 1) * this.perPageNum;
	}


}
