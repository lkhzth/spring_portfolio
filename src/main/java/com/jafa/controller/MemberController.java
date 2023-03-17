package com.jafa.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.AuthListDTO;
import com.jafa.domain.AuthVO;
import com.jafa.domain.Category;
import com.jafa.domain.MemberDTO;
import com.jafa.domain.MemberDetail;
import com.jafa.domain.MemberType;
import com.jafa.domain.MemberVO;
import com.jafa.domain.ProductCategory;
import com.jafa.repository.BoardRepository;
import com.jafa.repository.MemberRepository;
import com.jafa.repository.ProductRepository;
import com.jafa.service.MemberService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/member")
@Controller
@Log4j
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	BoardRepository boardRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@ModelAttribute("cateList")
	public List<Category> cateList(){
		return boardRepository.getCateList();
	}
	
	@ModelAttribute(value = "productCateList")
	public List<ProductCategory> productCateList(){
		return productRepository.getProductCateList();
	}
	
	@GetMapping("/all")
	public void doAll() {
		log.info("모두 접근 허용");
	}
	
	// 로그인 페이지
	@RequestMapping("/login")
	public String login(Authentication authentication, RedirectAttributes rttr) {
		log.info("로그인 페이지");
		if(authentication!=null && authentication.isAuthenticated()) {
			rttr.addFlashAttribute("loginOn", "이미 로그인한 상태입니다.");
			return "redirect:/";
		}
		return "/member/login";
	}
	
	@GetMapping("/myPage")
	@PreAuthorize("isAuthenticated()")
	public String myPage(Authentication auth, Model model) {
		// 회원페이지
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO memberVO = principal.getMemberVO();
		log.info(memberVO);
		model.addAttribute("memberInfo", memberVO);
		
		// 관리자가 보여지는 회원페이지
		List<MemberVO> memberList = memberService.memberList();
		model.addAttribute("list", memberList);
		model.addAttribute("mType", MemberType.values());
		return "/member/myPage";
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/myPage2")
	public String myPage2(@AuthenticationPrincipal MemberDetail memberDetail, Model model) {
		MemberVO memberVO = memberDetail.getMemberVO();
		List<AuthVO> authList = memberVO.getAuthList();
		List<MemberType> memberTypes = 
				authList.stream()
						.map(AuthVO::getMemberType)
						.collect(Collectors.toList());
		
		authList.stream()
		.map(AuthVO::getMemberType);
		if(memberTypes.contains(MemberType.ROLE_ADMIN)) {
			System.out.println("관리자다");
		} else  {
			System.out.println("관리자 아님");
		}
		return "/member/myPage2";
	}
	
	@GetMapping(value="/{mno}",	produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<MemberVO> myPageDetail(@PathVariable("mno") Long mno) {
		return new ResponseEntity<>(
				memberRepository.myPageDetail(mno), HttpStatus.OK);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/{mno}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody MemberVO vo,
			@PathVariable("mno") Long mno){
		vo.setMno(mno);
		MemberVO myPageDetail = memberRepository.myPageDetail(mno);
		System.out.println("mno:  " + mno);
		return memberRepository.update(myPageDetail) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 관리자 페이지에서 회원목록 조회 
	@GetMapping("/admin")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
	public void doAdmin(Model model, @AuthenticationPrincipal MemberDetail memberDetail) {
		System.out.println("*****************************************************************");
		MemberVO memberVO = memberDetail.getMemberVO();
		System.out.println("아이디 : " + memberVO.getMemberId());
		System.out.println("이메일 : " + memberVO.getMemberEmail());
		System.out.println("이메일 : " + memberVO.getMemberName());
		System.out.println("*****************************************************************");
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
	public String joinForm(MemberDTO memberDTO) {
		return "/member/join";
	}
	
	// 회원가입 처리
	@PostMapping("/join")
	public String join(@Valid MemberDTO memberDTO, Errors errors, RedirectAttributes rttr) {
		if(errors.hasErrors()) {
			System.out.println("에러!!");
			return "/member/join";
		}
		memberService.join(memberDTO);
		rttr.addFlashAttribute("message", "회원가입성공");
		return "redirect:/";
	}

	// 회원등급 변경 처리
	@PostMapping("/updateMemberType")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
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
