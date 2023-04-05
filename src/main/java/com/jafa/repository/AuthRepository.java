package com.jafa.repository;

import com.jafa.domain.AuthVO;

public interface AuthRepository {

	void save(AuthVO vo); // 회원등급변경 + 추가

	void remove(String memberId); // 회원등급변경 + 삭제
}
