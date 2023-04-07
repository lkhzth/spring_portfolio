package com.jafa.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.CartVO;

public interface CartRepository {
		
	/* 카트 목록 */
	List<CartVO> getCart(Long mno);
	
	/*수량*/
	Long getTotalCount(@Param("mno") Long mno, @Param("product_Bno") Long product_Bno);
	
	/* 카트 추가 */
	int addCart(CartVO cartVO);

	/* 상품이 저장되어있는지 확인 */
	int existProduct(@Param("mno")Long mno, @Param("product_Bno")Long product_Bno);

	/* 카트 수량 수정 */
	int updateCart(CartVO cartVO);
	
//	/* 카트 삭제 */
//	int deleteCart(int cartId);
	
}
