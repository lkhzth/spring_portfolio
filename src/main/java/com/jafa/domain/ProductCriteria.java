package com.jafa.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductCriteria { // 검색조건클래스
	private int page; // 조회할 페이지 번호
	private int perPageNum; // 한 페이지에서 보여줄 상품개수 
	
	private ProductCategory productCategory; // 조회하려는 상품 카테고리 
	
	private String type; // 상품검색유형. 상품이름, 상품내용 두가지를 검색조건으로 설정
	private String keyword; // 상품검색 키워드
	
	public ProductCriteria() { // 기본생성자에 페이지번호를 1, 한 페이지당 보여지는 상품 12 설정
		this(1, 12);
	}
	
	public ProductCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	
	// #{maxRow}
	// 최대조회 행의 개수 계산, 매퍼에서 #{maxRow}로 사용하여 SQL 쿼리에 적용
	public int getMaxRow() {
		return this.page * this.perPageNum;
	}
	
	// #{minRow}
	//  최소 조회 행의 개수를 계산
	public int getMinRow() {
		return (this.page - 1) * this.perPageNum;
	}
}
