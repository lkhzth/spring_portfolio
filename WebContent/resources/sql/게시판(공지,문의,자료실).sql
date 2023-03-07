
DROP TABLE BOARD_TBL;
DROP SEQUENCE BOARD_BNO_SEQ;

drop table CATEGORY_BOARD;
drop sequence CATEGORY_CNO_SEQ;

-- ī�װ� ���̺� 
create table CATEGORY_BOARD(
    cid varchar2(15) PRIMARY KEY, 
    cname nvarchar2(10) not null
);

create sequence CATEGORY_CNO_SEQ;

insert into CATEGORY_BOARD(cid,cname) values('notice','����');
insert into CATEGORY_BOARD(cid,cname) values('inquiry','����');
insert into CATEGORY_BOARD(cid,cname) values('referenceRoom','�ڷ��');
insert into CATEGORY_BOARD(cid,cname) values('paging_tester','�׽�Ʈ����¡');

select * from CATEGORY_BOARD;
commit;

CREATE TABLE BOARD_TBL(
    BNO NUMBER(10) constraint pk_board_tbl primary key, 
    cid varchar2(15) NOT NULL, -- �ܷ�Ű
    TITLE VARCHAR2(500) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    WRITER VARCHAR2(100) NOT NULL,
    fileName VARCHAR2(100),
    fileType VARCHAR2(30),
    WRITEDATE DATE DEFAULT SYSDATE,
    constraint fk_cid foreign key(cid) 
    references CATEGORY_BOARD(cid) on delete cascade
);

CREATE SEQUENCE BOARD_BNO_SEQ;

-- ���� 
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����01','��������01','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����02','��������02','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����03','��������03','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����04','��������04','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����05','��������05','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����06','��������06','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����07','��������07','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����08','��������08','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����09','��������09','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����10','��������10','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����11','��������11','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����12','��������12','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����13','��������13','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','����14','��������14','���');

-- ���� 
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'inquiry','����01','���ǳ���01','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'inquiry','����02','���ǳ���02','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'inquiry','����03','���ǳ���03','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'inquiry','����04','���ǳ���04','���');
-- �ڷ�� 
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'referenceRoom','�ڷ�01','�ڷ᳻��01','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'referenceRoom','�ڷ�02','�ڷ᳻��02','���');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'referenceRoom','�ڷ�03','�ڷ᳻��03','���');

commit; 
select * from BOARD_TBL;

-- inner join
select  
    b.bno, c.cname, b.title, b.content, b.fileName, b.fileType, b.writer, b.writedate
    from BOARD_TBL b
    inner join CATEGORY_BOARD c on c.cid = b.cid;
commit;

-- �˻� 

-- delete from category_my4 where cid='free';

SELECT * FROM BOARD_TBL;

COMMIT;

--���̺� �÷��߰�
ALTER TABLE BOARD_TBL ADD REPLYCOUNT INT;

--��ȸ�� �÷��߰�
ALTER TABLE BOARD_TBL ADD VIEW_COUNT NUMBER DEFAULT 0 NOT NULL;

SELECT replyCount FROM BOARD_TBL;
-- SELECT MAX(bno)+1 as boardNo FROM BOARD_TBL;

update BOARD_TBL set replyCount = 
(select count(bno) from BOARD_REPLY_TBL where BOARD_REPLY_TBL.bno = BOARD_TBL.bno);
    
