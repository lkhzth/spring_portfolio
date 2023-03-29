package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jafa.domain.CartDTO;
import com.jafa.domain.MemberDetail;
import com.jafa.service.CartService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart")
@Log4j

public class CartController {

	@Autowired
	CartService cartService;
	
	@PostMapping("/add")
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public String addCartPOST(CartDTO cart,  @AuthenticationPrincipal MemberDetail memberDetail) {

		String memberId = memberDetail.getUsername();
		if(memberId == null) {
		return "5";
		}
		
		// 로그인한 사용자의 정보 가져오기
//		String memberId = memberDetail.getUsername();
		System.out.println(memberId);

		// 카트 등록
		cart.setMemberId(memberId);
		int result = cartService.addCart(cart);
		return result + "";
	}
	
}
