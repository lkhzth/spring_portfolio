package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.CartResultVO;
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
	

	// 장바구니목록(회원번호 mno로 조회한 상품리스트)
	@RequestMapping(value = "/orderPage", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public String cartList(@RequestParam("mno") Long mno, Model model) {
		List<CartVO> cartList = cartRepository.getCart(mno);
		Integer totalPrice = cartList.stream().map(vo->vo.getProduct_Price()*vo.getProduct_Count())
			.reduce(0,(acc,price)-> acc+price);
		model.addAttribute("cart", cartList);
		model.addAttribute("totalPrice", totalPrice);
		return "cart/orderPage";
	}
	
	// 주문하기(상품상세페이지버튼클릭 후 실행--> 결과 장바구니페이지이동)
	@PostMapping("/addCart")
	public String addCart(CartVO cartVO, RedirectAttributes rttr) {
		System.out.println("CartController : " +cartVO);
	    cartService.addCart(cartVO);
		return "redirect:orderPage?mno="+cartVO.getMno();
	}

	// 주문완료처리(선택된 목록 cartResultVO에 저장하고 + cartVO에서 삭제처리 ==> myPage에서 cartResultVO에서 저장된 완료목록 보이게)
	@PostMapping("/delSelectedBoard")
	public String delSelBoard(Long[] bnoList ,Long mno, RedirectAttributes rttr) {
		for(Long bno : bnoList) {
			CartResultVO cartResult = cartRepository.getCartResult(mno, bno);
			cartService.orderResult(cartResult, mno, bno);
		}
		return "redirect:orderPage?mno="+mno;
	}

}
