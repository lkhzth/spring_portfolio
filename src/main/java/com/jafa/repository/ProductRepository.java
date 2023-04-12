package com.jafa.repository;

import java.util.List;

import com.jafa.domain.ProductCategory;
import com.jafa.domain.ProductCriteria;
import com.jafa.domain.ProductVO;

public interface ProductRepository {
		
	// 상품카테고리
	List<ProductCategory> getProductCateList();

	void saveProductCate(ProductCategory productCategory);

	void delProductCate(String cateId);

	// 상품CRUD
	// 목록
	List<ProductVO> list(ProductCriteria productCriteria);
	
	// 글쓰기
	void write(ProductVO vo);

	// 상세
	ProductVO detail(Long product_Bno);
	
	// 삭제
	void remove(Long product_Bno);
		
	// 수정
	void modify(ProductVO vo);
	void modifyOnlyContent(ProductVO vo);

	// 페이징처리
	int getTotalCount(ProductCriteria productCriteria);
}
