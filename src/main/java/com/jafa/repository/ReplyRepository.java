package com.jafa.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.Criteria;
import com.jafa.domain.ReplyVO;

public interface ReplyRepository {
	
	public ReplyVO read(Long rno);

	public int insert(ReplyVO vo);
	
	public int update(ReplyVO reply);

	public int delete(Long rno);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	// 페이지 정보와 게시물 번호를 전달.
	
}
