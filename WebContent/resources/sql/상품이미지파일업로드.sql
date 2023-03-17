drop table attach_Product_imgFile; 
drop sequence attachNo_Product_imgFile_seq; 

create sequence attachNo_Product_imgFile_seq; 
create table attach_Product_imgFile(
    attachNo_Product number(10) primary key,
    PRODUCT_BNO number(10), 
    filePath_Product varchar2(500), -- 첨부파일 경로
    fileName_Product varchar2(100), -- 첨부파일 이름
    fileType_Product varchar2(20), -- 첨부파일 타입
    constraint fk_attachProductImg foreign key(PRODUCT_BNO)
    references PRODUCT_TBL(PRODUCT_BNO) on delete cascade
);
 
select * from attach_Product_imgFile;
commit;

select count(*) as cnt from attach_Product_imgFile where bno_Product=1;  

-- 오라클 함수 : 시퀀스 생성 함수 
drop function get_attachNo_Product_seq;
create function get_attachNo_Product_seq return number is 
begin
 return attachNo_Product_imgFile_seq.nextval;
end;