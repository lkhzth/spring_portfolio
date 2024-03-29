package com.jafa.repository;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jafa.AppTest;
import com.jafa.domain.ReplyVO;

public class ReplyRepositoryTest extends AppTest{

	@Autowired
	ReplyRepository replyRepository;
	
	@Test
	
	public void test1() {
		replyRepository.read(1L);
	}

	@Test
	@Ignore
	public void test2() {
		replyRepository.insert(ReplyVO.builder()
					.bno(1L)
					.reply("댓글")
					.writer("작성자").build());
	}

	@Test
	@Ignore
	public void test3() {
		replyRepository.delete(4L);
	}
}
