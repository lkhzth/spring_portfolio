package com.jafa.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int page;
	private int perPageNum;
	
	private Category category;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int page, int perPageNum) {
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
