package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.domain.AuthVO;
import com.jafa.domain.MemberType;
import com.jafa.domain.MemberVO;
import com.jafa.repository.AuthRepository;
import com.jafa.repository.MemberRepository;

@Service
public class MemberService {
	
	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	AuthRepository authRepository; 
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	// 회원가입
	@Transactional
	public void join(MemberVO vo) {
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		memberRepository.save(vo);
		AuthVO authVO = AuthVO.builder()
				.memberId(vo.getMemberId())
				.memberType(MemberType.ROLE_ASSOCIATE_MEMBER)
				.ordinal(MemberType.ROLE_ASSOCIATE_MEMBER.ordinal())
				.build();
		authRepository.save(authVO);
	}
	
	// 회원 등급변경
	@Transactional
	public void updateMemberType(AuthVO authVO) {
		authRepository.remove(authVO.getMemberId()); // 모든 등급 삭제
		MemberType memberType = authVO.getMemberType(); // 변경할 회원등급
		MemberType[] types = MemberType.values();
		for(int i = memberType.ordinal(); i < types.length; i++) {
			AuthVO vo = AuthVO.builder()
					.memberId(authVO.getMemberId())
					.memberType(types[i])
					.ordinal(types[i].ordinal())
					.build();
			authRepository.save(vo);
		}
	}

	// 회원목록조회
	public List<MemberVO> memberList() {
		return memberRepository.memberList();
	}
}
