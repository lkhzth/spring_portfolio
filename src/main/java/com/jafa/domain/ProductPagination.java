package com.jafa.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductPagination {
	private ProductCriteria productCriteria; // ProductCriteria객체의 필드값들(검색조건,페이지정보 등)을 가져옴
	private int startPage; // 페이징 시작페이지 번호저장
	private int endPage; // 페이징 끝페이지 번호저장
	private int tempEndPage; // 전체페이지수를 계산후 저장
	private int displayPageNum; // 한 화면에 표시할 페이지수 설정 
	
	private boolean prev; // 이전페이지로 이동가능여부를 저장
	private boolean next; // 다음페이지로 이동가능여부를 저장
	
	public ProductPagination(ProductCriteria productCriteria, int totalCount) {
		this.productCriteria = productCriteria;
		this.displayPageNum = 10;
		// 생성자 : ProductCriteria객체와 총 상품개수를 전달받고 페이징을 하도록 필드들의 값 계산
		
		endPage = (int) Math.ceil(productCriteria.getPage() / (double)displayPageNum) * displayPageNum;
		startPage = endPage - displayPageNum + 1;
		
		tempEndPage = (int) Math.ceil((double)totalCount / productCriteria.getPerPageNum());
		/*
		  총 상품개수 totalCount를 한 페이지당 보여줄 상품 개수인 productCriteria.getPerPageNum()로 나눈 후, 
		  올림 연산(Math.ceil())을 통해 소수점 이하를 올림하여 정수로 계산
		*/
		
		prev = startPage != 1;
		next = endPage < tempEndPage;
		
		if(endPage > tempEndPage) endPage = tempEndPage;
	}
}
