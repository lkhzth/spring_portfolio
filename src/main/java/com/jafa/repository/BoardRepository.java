package com.jafa.repository;

import java.util.List;

import com.jafa.domain.BoardVO;
import com.jafa.domain.Category;
import com.jafa.domain.Criteria;

public interface BoardRepository {
		
	// 게시판카테고리
	List<Category> getCateList();
	// 카테고리생성
	void saveCate(Category category);
	// 카테고리삭제
	void delCate(String cid);

	// 게시판
	// 목록
	List<BoardVO> list(Criteria criteria);
	
	// 글쓰기
	void write(BoardVO vo);

	// 상세
	BoardVO detail(Long bno);
	
	// 삭제
	void remove(Long bno);
		
	// 수정
	void modify(BoardVO vo);
	void modifyOnlyContent(BoardVO vo);

	// 페이징처리
	int getTotalCount(Criteria criteria);
	
	
}
