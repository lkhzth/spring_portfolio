package com.jafa.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.CartResultVO;
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

	/* 장바구니 추가결과 ------> 추가*/ 
	int addCartResult(CartResultVO cartResultList);

	/* 장바구니 추가결과 ------> 삭제*/ 
	void delSelected(@Param("mno") Long mno, @Param("product_Bno") Long product_Bno);
	
	/* 장바구니결과리스트 ------> */
	CartResultVO getCartResult(@Param("mno") Long mno, @Param("product_Bno") Long product_Bno);
	
	List<CartResultVO> getCartResultMyPage(@Param("mno") Long mno);


	
}
