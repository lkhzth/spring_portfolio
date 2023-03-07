package com.jafa.repository;

import com.jafa.domain.AuthVO;

public interface AuthRepository {
	// 회원등급 변경 추가 삭제
	void save(AuthVO vo);

	void remove(String memberId);
}
