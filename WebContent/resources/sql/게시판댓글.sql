drop table BOARD_REPLY_TBL; 
    
create table BOARD_REPLY_TBL(
    rno number PRIMARY KEY, -- ´ñ±Û ¹øÈ£
    bno number not null, -- °Ô½Ã¹° ¹øÈ£
    reply nvarchar2(1000) not null, -- ´ñ±Û ³»¿ë
    writer varchar2(50) not null, -- ´ñ±Û ÀÛ¼ºÀÚ
    replyDate date default sysdate, -- ´ñ±Û ÀÛ¼º ½Ã°£
    modifyDate date default sysdate, -- ´ñ±Û ¼öÁ¤ ½Ã°£
    constraint fk_reply_board foreign key(bno) -- Á¦¾àÁ¶°Ç
    references BOARD_TBL(bno) on delete cascade
);

drop sequence seq_reply; 
create sequence seq_reply; 


insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '´ñ±Û³»¿ëÀÔ´Ï´Ù.01', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '´ñ±Û³»¿ëÀÔ´Ï´Ù.02', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '´ñ±Û³»¿ëÀÔ´Ï´Ù.03', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '´ñ±Û³»¿ëÀÔ´Ï´Ù.04', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '´ñ±Û³»¿ëÀÔ´Ï´Ù.05', 'tester');

commit;
select * from BOARD_REPLY_TBL;

