package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.Criteria;
import com.jafa.domain.ReplyVO;
import com.jafa.repository.ReplyRepository;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyRepository replyRepository;

	@Override
	public int register(ReplyVO vo) {
		log.info("register" + vo);
		return replyRepository.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("get" + rno);
		return replyRepository.read(rno);
	}

	@Override
	public int modify(ReplyVO reply) {
		log.info("modify" + reply);
		return replyRepository.update(reply);
	}

	@Override
	public int remove(Long rno) {
		log.info("remove" + rno);
		return replyRepository.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply list " + bno);
		return replyRepository.getListWithPaging(cri, bno);
	}

}
