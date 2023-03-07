package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.AuthListDTO;
import com.jafa.domain.AuthVO;
import com.jafa.domain.Category;
import com.jafa.domain.Criteria;
import com.jafa.domain.MemberDetail;
import com.jafa.domain.MemberType;
import com.jafa.domain.MemberVO;
import com.jafa.domain.Pagination;
import com.jafa.service.MemberService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/member")
@Controller
@Log4j
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	// 로그인 페이지
	@RequestMapping("/login")
	public String loginForm() {
		return "member/login";
	}
	
	@GetMapping("/myPage")
	public String myPage(Authentication auth, Model model) {
		// 회원페이지
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO memberVO = principal.getMemberVO();
		log.info(memberVO);
		model.addAttribute("memberInfo", memberVO);
		return "/member/myPage";
	}
	
	@GetMapping("/admin")
	public void doAdmin(Model model) {
		// 관리자만 허용
		List<MemberVO> memberList = memberService.memberList();
		model.addAttribute("list", memberList);
		model.addAttribute("mType", MemberType.values());
	}
	
	// 접근 거부 처리
	@GetMapping("/accessError")
	public void accessError() {
		log.info("접근이 거부됨.");
		// member/accessError.jsp 생성
	}
	
	// 회원가입 폼
	@GetMapping("/join")
	public void joinForm() {
	}
	
	// 회원가입 처리
	@PostMapping("/join")
	public String join(MemberVO vo, RedirectAttributes rttr) {
		memberService.join(vo);
		rttr.addFlashAttribute("message", "회원가입성공");
		return "redirect:/";
	}

	// 회원등급 변경 처리
	@PostMapping("/updateMemberType")
	public String updateMemberType(AuthListDTO authListDTO, RedirectAttributes rttr) {
		List<AuthVO> authList = authListDTO.getAuthList();
		for(AuthVO vo : authList) {
			if(vo.getMemberId()!=null && vo.getMemberType()!=null) {
				memberService.updateMemberType(vo);
			}
		}
		rttr.addFlashAttribute("updateMember", "등급변경");
		return "redirect:/member/admin";
	}
	
}
