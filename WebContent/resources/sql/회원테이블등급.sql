-- JDBC�� �̿��� ����/���� ó���� ���� ���̺� 

drop table member_tbl_auth;
drop table member_tbl; 
drop sequence member_tbl_seq;

-- ȸ�� ���̺�
create sequence member_tbl_seq;

create table member_tbl(
    mno number(10) primary key, --ȸ����ȣ
    memberId varchar2(50) unique not null, -- ȸ�� ���̵�
    password varchar2(200)not null, -- ��й�ȣ
    memberName VARCHAR2(200) not null, -- �̸�
    memberEmail varchar2(200) not null, -- �̸���
    memberAddress varchar2(1000), -- �ּ�
    memberPhone varchar2(200) not null, -- �޴�����ȣ
    enabled char(1) default(1) -- ������ Ȱ��ȭ ����
);

-- ���� ���̺�
create table member_tbl_auth(
    memberId varchar2(50) not null, -- ȸ�����̵�
    memberType varchar2(50) not null, -- ����
	ordinal number(10) not null, -- ������ �켱����
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
