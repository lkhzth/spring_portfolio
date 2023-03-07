package com.jafa.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyVO {
	
	private Long rno;
	private Long bno;
	private String reply;
	private String writer;
	private Date replyDate;
	private Date modifyDate;
	
}


/*
 * rno 댓글 번호 
 * bno 게시물 번호 
 * reply 댓글 내용 
 * writer 댓글 작성자 
 * replyDate 댓글 작성 시간 
 * modifyDate date default sysdate, -- 댓글 수정 시간
 */



