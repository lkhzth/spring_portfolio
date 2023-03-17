package com.jafa.repository;

import java.util.List;

import com.jafa.domain.MemberDTO;
import com.jafa.domain.MemberVO;

public interface MemberRepository {
	// 회원가입
	void save(MemberDTO memberDTO);
	
	// 로그인 체크
	MemberVO read(String memberId);

	// 회원목록
	List<MemberVO> memberList();

	// 마이페이지 회원정보 상세
	MemberVO myPageDetail(Long mno);

	// 마이페이지 회원정보 수정
	public int update(MemberVO memberVO);

	
	
}
