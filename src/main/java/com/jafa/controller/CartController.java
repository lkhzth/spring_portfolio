package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jafa.domain.CartVO;
import com.jafa.repository.CartRepository;
import com.jafa.service.CartService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart")
@Log4j

public class CartController {

	@Autowired
	CartService cartService;
	
	@Autowired
	CartRepository cartRepository;
	
	
//	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
//	@PreAuthorize("isAuthenticated()")
//	public String cartList(Model model) {
//	    List<CartVO> cartList = cartRepository.getCart();
//	    model.addAttribute("cart", cartList);    
//	    return "cart/cartList";
//	}
	
	@RequestMapping(value = "/orderPage", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public String cartList(@RequestParam("mno") Long mno, Model model) {
	
		
		List<CartVO> cartList = cartRepository.getCart(mno);
		for(CartVO vo :cartList) {
			System.out.println(cartRepository.getTotalCount(vo.getMno(), vo.getProduct_bno()));
			vo.setTotal_Count(cartRepository.getTotalCount(vo.getMno(), vo.getProduct_bno()));
		}
	
		
		model.addAttribute("cart", cartList);
		return "cart/orderPage";
	}
	// 상세
	
		
	
	
	
//	@PostMapping("/add")
//	@ResponseBody
//	@PreAuthorize("isAuthenticated()")
//	public String addCartPOST(CartVO cart,  @AuthenticationPrincipal MemberDetail memberDetail) {
//
//		String memberId = memberDetail.getUsername();
//		if(memberId == null) {
//		return "5";
//		}
//		
//		// 로그인한 사용자의 정보 가져오기
////		String memberId = memberDetail.getUsername();
//		System.out.println(memberId);
//
//		// 카트 등록
//		cart.setMemberId(memberId);
//		int result = cartService.addCart(cart);
//		return result + "";
//	}
	
}
