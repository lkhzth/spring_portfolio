drop table BOARD_REPLY_TBL; 
    
create table BOARD_REPLY_TBL(
    rno number PRIMARY KEY, -- 댓글 번호
    bno number not null, -- 게시물 번호
    reply nvarchar2(1000) not null, -- 댓글 내용
    writer varchar2(50) not null, -- 댓글 작성자
    replyDate date default sysdate, -- 댓글 작성 시간
    modifyDate date default sysdate, -- 댓글 수정 시간
    constraint fk_reply_board foreign key(bno) -- 제약조건
    references BOARD_TBL(bno) on delete cascade
);

drop sequence seq_reply; 
create sequence seq_reply; 


insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '댓글내용입니다.01', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '댓글내용입니다.02', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '댓글내용입니다.03', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '댓글내용입니다.04', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '댓글내용입니다.05', 'tester');

commit;
select * from BOARD_REPLY_TBL;

