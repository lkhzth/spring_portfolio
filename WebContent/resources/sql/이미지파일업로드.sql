drop table attach_imgFile; 
drop sequence attachNo_imgFile_seq; 

create sequence attachNo_imgFile_seq; 
create table attach_imgFile(
    attachNo number(10) primary key,
    bno number(10), 
    filePath varchar2(500) not null, -- ÷������ ���
    fileName varchar2(100) not null, -- ÷������ �̸�
    fileType varchar2(20) not null, -- ÷������ Ÿ��
    constraint fk_attachImgFile foreign key(bno)
    references BOARD_TBL(bno) on delete cascade
);
 
select * from attach_imgFile;
commit;

select count(*) as cnt from attach_imgFile where bno=1;  

-- ����Ŭ �Լ� : ������ ���� �Լ� 
drop function get_attachNo_seq;
create function get_attachNo_seq return number is
begin
 return attachNo_imgFile_seq.nextval;
end;