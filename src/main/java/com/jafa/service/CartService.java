package com.jafa.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.domain.CartResultVO;
import com.jafa.domain.CartVO;
import com.jafa.repository.CartRepository;

@Service
public class CartService {

	@Autowired
	private CartRepository cartRepository;
	
    /* 카트 목록 조회 */
    public List<CartVO> getCart(Long mno) {
        return cartRepository.getCart(mno);
    }

    /* 중복상품 조회한 후 추가/삭제 */
    @Transactional
    public void addCart(CartVO cartVO) {
    	// 기존상품이 있는지 조회(쿼리문 작성 ) 
    	int result = cartRepository.existProduct(cartVO.getMno(), cartVO.getProduct_Bno());

    	if(result>=1){ // 기존 물품이 있을 때
    		cartRepository.updateCart(cartVO);
    	} else {  // 기존 물품이 없을 때 
    		//  인서트
    		// 기존 상품이 없을 때 : 인서트
            // cartVO의 상품 개수를 1로 설정
            // 인서트 쿼리문 실행
            cartRepository.addCart(cartVO);
    	}
    }
    
    @Transactional
	public void orderResult(CartResultVO cartResult, Long mno, Long bno) {
    	cartRepository.addCartResult(cartResult);
		cartRepository.delSelected(mno, bno);
    }
    
    
}
