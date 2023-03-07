
DROP TABLE BOARD_TBL;
DROP SEQUENCE BOARD_BNO_SEQ;

drop table CATEGORY_BOARD;
drop sequence CATEGORY_CNO_SEQ;

-- 카테고리 테이블 
create table CATEGORY_BOARD(
    cid varchar2(15) PRIMARY KEY, 
    cname nvarchar2(10) not null
);

create sequence CATEGORY_CNO_SEQ;

insert into CATEGORY_BOARD(cid,cname) values('notice','공지');
insert into CATEGORY_BOARD(cid,cname) values('inquiry','문의');
insert into CATEGORY_BOARD(cid,cname) values('referenceRoom','자료실');
insert into CATEGORY_BOARD(cid,cname) values('paging_tester','테스트페이징');

select * from CATEGORY_BOARD;
commit;

CREATE TABLE BOARD_TBL(
    BNO NUMBER(10) constraint pk_board_tbl primary key, 
    cid varchar2(15) NOT NULL, -- 외래키
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

-- 공지 
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지01','공지내용01','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지02','공지내용02','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지03','공지내용03','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지04','공지내용04','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지05','공지내용05','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지06','공지내용06','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지07','공지내용07','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지08','공지내용08','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지09','공지내용09','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지10','공지내용10','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지11','공지내용11','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지12','공지내용12','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지13','공지내용13','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'notice','공지14','공지내용14','운영자');

-- 문의 
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'inquiry','문의01','문의내용01','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'inquiry','문의02','문의내용02','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'inquiry','문의03','문의내용03','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'inquiry','문의04','문의내용04','운영자');
-- 자료실 
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'referenceRoom','자료01','자료내용01','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'referenceRoom','자료02','자료내용02','운영자');
insert into BOARD_TBL(bno,cid,title,content,writer) values(BOARD_BNO_SEQ.nextval,'referenceRoom','자료03','자료내용03','운영자');

commit; 
select * from BOARD_TBL;

-- inner join
select  
    b.bno, c.cname, b.title, b.content, b.fileName, b.fileType, b.writer, b.writedate
    from BOARD_TBL b
    inner join CATEGORY_BOARD c on c.cid = b.cid;
commit;

-- 검색 

-- delete from category_my4 where cid='free';

SELECT * FROM BOARD_TBL;

COMMIT;

--테이블 컬럼추가
ALTER TABLE BOARD_TBL ADD REPLYCOUNT INT;

--조회수 컬럼추가
ALTER TABLE BOARD_TBL ADD VIEW_COUNT NUMBER DEFAULT 0 NOT NULL;

SELECT replyCount FROM BOARD_TBL;
-- SELECT MAX(bno)+1 as boardNo FROM BOARD_TBL;

update BOARD_TBL set replyCount = 
(select count(bno) from BOARD_REPLY_TBL where BOARD_REPLY_TBL.bno = BOARD_TBL.bno);
    
