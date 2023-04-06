package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    /* 카트 추가 */
    public int addCart(CartVO cart) throws Exception {
        return cartRepository.addCart(cart);
    }

    /* 카트 수량 수정 */
    public int modifyCount(CartVO cart) {
        return cartRepository.modifyCount(cart);
    }

    /* 카트 삭제 */
    public int deleteCart(int cartId) {
        return cartRepository.deleteCart(cartId);
    }

}
