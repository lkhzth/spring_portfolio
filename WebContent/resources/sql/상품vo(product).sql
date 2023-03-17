DROP TABLE PRODUCT_TBL;
DROP SEQUENCE PRODUCT_BNO_SEQ;

drop table CATEGORY_PRODUCT;
drop sequence CATEGORY_CProductNO_SEQ;

-- 상품카테고리 테이블 
create table CATEGORY_PRODUCT(
    cateId varchar2(15) PRIMARY KEY, 
    cateName nvarchar2(10) not null
);

create sequence CATEGORY_CProductNO_SEQ;

insert into CATEGORY_PRODUCT(cateId,cateName) values('macaron','마카롱');
insert into CATEGORY_PRODUCT(cateId,cateName) values('cake','케익');
insert into CATEGORY_PRODUCT(cateId,cateName) values('promotion','홍보물');

select * from CATEGORY_PRODUCT;
commit;


-- 상품테이블
CREATE TABLE PRODUCT_TBL(
    PRODUCT_BNO NUMBER(10) constraint pk_product_tbl PRIMARY KEY, -- 상품번호
    cateId VARCHAR2(30) NOT NULL, -- 상품카테고리
    PRODUCT_NAME VARCHAR2(500) NOT NULL, -- 상품이름
    PRODUCT_INTRO VARCHAR2(4000) NOT NULL, -- 상품이름소개
    PRODUCT_CONTENT VARCHAR2(4000) NOT NULL, -- 상품상세
    PRODUCT_SIZE VARCHAR2(4000) NOT NULL, -- 상품크기
    PRODUCT_weight VARCHAR2(4000) NOT NULL, -- 상품중량
    PRODUCT_PRICE VARCHAR2(100) NOT NULL, -- 상품가격
    PRODUCT_STOCK VARCHAR2(100) NOT NULL, -- 상품재고
    fileName_Product varchar2(100), -- 첨부파일 이름
    fileType_Product varchar2(20), -- 첨부파일 타입
    constraint fk_cateId foreign key(cateId) 
    references CATEGORY_PRODUCT(cateId) on delete cascade
    -- 그외 배송비 제조사 최소주문수량은 jsp로
);

CREATE SEQUENCE PRODUCT_BNO_SEQ;

INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '오레오마카롱', '상품이름소개', '오레오마카롱상세페이지', '6', '30g', '13000', '240');

SELECT * FROM PRODUCT_TBL;

COMMIT;

