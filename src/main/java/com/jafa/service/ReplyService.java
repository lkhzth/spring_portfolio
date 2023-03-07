package com.jafa.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.Criteria;
import com.jafa.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	public ReplyVO get(Long rno);
	public int modify(ReplyVO reply);
	public int remove(Long rno);
	public List<ReplyVO> getList(
			@Param("cri") Criteria cri, @Param("bno") Long bno);
	
}
