-- JDBC를 이용한 인증/권한 처리를 위한 테이블 

drop table member_tbl_auth;
drop table member_tbl; 
drop sequence member_tbl_seq;

-- 회원 테이블
create sequence member_tbl_seq;

create table member_tbl(
    mno number(10) primary key, --회원번호
    memberId varchar2(50) unique not null, -- 회원 아이디
    password varchar2(200)not null, -- 비밀번호
    memberName VARCHAR2(200) not null, -- 이름
    memberEmail varchar2(200) not null, -- 이메일
    memberAddress varchar2(1000), -- 주소
    memberPhone varchar2(200) not null, -- 휴대폰번호
    enabled char(1) default(1) -- 계정의 활성화 상태
);

-- 권한 테이블
create table member_tbl_auth(
    memberId varchar2(50) not null, -- 회원아이디
    memberType varchar2(50) not null, -- 권한
	ordinal number(10) not null, -- 권한의 우선순위
    constraint fk_member_tbl_auth foreign key(memberId)
    references member_tbl(memberId)
);

CREATE TABLE persistent_logins(
	username varchar(64) NOT NULL,
	series varchar(64) PRIMARY KEY,
	token varchar(64) NOT NULL,
	last_used timestamp NOT NULL
);

create table persistent_logins (
	username varchar(64) not null,
	series varchar(64) primary key,
	token varchar(64) not null,
	last_used timestamp not null
);

select * from member_tbl;
select * from member_tbl_auth;
select * from persistent_logins;

commit;
