drop table BOARD_REPLY_TBL; 
    
create table BOARD_REPLY_TBL(
    rno number PRIMARY KEY, -- ��� ��ȣ
    bno number not null, -- �Խù� ��ȣ
    reply nvarchar2(1000) not null, -- ��� ����
    writer varchar2(50) not null, -- ��� �ۼ���
    replyDate date default sysdate, -- ��� �ۼ� �ð�
    modifyDate date default sysdate, -- ��� ���� �ð�
    constraint fk_reply_board foreign key(bno) -- ��������
    references BOARD_TBL(bno) on delete cascade
);

drop sequence seq_reply; 
create sequence seq_reply; 


insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '��۳����Դϴ�.01', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '��۳����Դϴ�.02', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '��۳����Դϴ�.03', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '��۳����Դϴ�.04', 'tester');
insert into BOARD_REPLY_TBL (rno, bno, reply, writer)
values(seq_reply.nextval, 2, '��۳����Դϴ�.05', 'tester');

commit;
select * from BOARD_REPLY_TBL;

