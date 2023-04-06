package com.jafa.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.BoardVO;
import com.jafa.domain.CartVO;
import com.jafa.domain.Category;
import com.jafa.domain.Criteria;

public interface CartRepository {
		
	/* 카트 목록 */
	public List<CartVO> getCart(Long mno);
	
	/*수량*/
	int getTotalCount(@Param("mno") String mno, @Param("product_Bno") int product_Bno);
	
	/* 카트 추가 */
	public int addCart(CartVO cart) throws Exception;
	
	/* 카트 수량 수정 */
	public int modifyCount(CartVO cart);
	
	/* 카트 삭제 */
	public int deleteCart(int cartId);
	
//	/* 카트 확인 */
//	public CartVO checkCart(CartVO cart);
}
