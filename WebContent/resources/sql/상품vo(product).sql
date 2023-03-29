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
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '상큼딸기마카롱', '새콤달콤한 딸기크림을 필링하여 리얼100% 딸기다이스를 입힌 상큼딸기 마카롱', 
'상큼딸기마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '겨울왕국마카롱', '부드럽고 밀크한 순수 우유필링에 달콤한 초코칩과 눈꽃을 토핑한 비쥬얼최고! 겨울왕국마카롱', 
'겨울왕국마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '솔티드카라멜마카롱', '카라멜과 프랑스산소금으로 필링하여 프레젤과자를 올린 단짠단짠~ 솔티드카라멜 마카롱', 
'솔티드카라멜마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '황치즈마카롱', '짭조름한 진한 치즈 맛으로 필링하고 바삭한 크래커를 올려 자꾸만 손이 가는 황치즈마카롱', 
'황치즈마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '크러쉬초코마카롱', '달달한 초코크림을 필링하여,초콜렛 코팅과 벨기에산 렌틸초콜릿을 올려준 크러쉬초코 마카롱', 
'크러쉬초코마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '돼지바 마카롱', '마다가스카르산 최고급 바닐라 크림을 필링 하여 딸기잼으로 속을 채우고 바삭하고 달콤한 초코,딸기,카라멜 쿠키크런치를 입힌 돼지바 마카롱', 
'돼지바 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '얼그레이 마카롱', '진한 얼그레이 크림을 필링하여 입안 가득 향긋함이 퍼지는 얼그레이 마카롱', 
'얼그레이 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '누텔라 과자상자 마카롱', '달달한 누텔라크림 필링하여,다양한 과자를올린 누텔라과자상자 마카롱', 
'누텔라 과자상자 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '오레오 마카롱', '달달한 오레오 크림으로 필링하고 오레오 과자를 넣은 오레오 마카롱', 
'오레오 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '딸기요거트 마카롱', '새콤달콤한 요거트크림과 딸기잼의 환상의조합 딸기요거트 마카롱', 
'딸기요거트 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '복숭아요거트 마카롱', '상큼한 요거트 크림 필링 안에 달콤한 복숭아를 채운 복숭아요거트 마카롱', 
'복숭아요거트 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '말차초코칩 마카롱', '진한 말차크림으로 필링하여,달콤한 초코칩 씹히는 식감도 느낄수있는 고급진 말차초코칩 마카롱', 
'말차초코칩 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '소금 바닐라 마카롱', '부드러운 바닐라와 소금을 조합한 단맛과 짠맛의 조화롭게 만들어낸 최고의 맛 소금 바닐라 마카롱', 
'소금 바닐라 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '블루베리 마카롱', '달콤하고 상큼한 블루베리와 요거트로 필링한 블루베리 마카롱', 
'블루베리 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '로쉐 마카롱', '헤이즐넛과 누텔라크림을 필링하여 고급스러운 맛을 살린 로쉐마카롱', 
'로쉐 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '인절미 마카롱', '고소한 콩가루크림으로 만든 인절미 마카롱', 
'인절미 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '크렘브륄레 마카롱', '부드러운 바닐라 크림으로 필링하고 꼬끄 위에 카라멜라이징 한 달콤한 크렘브뤨레 마카롱', 
'크렘브륄레 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '초코우유 마카롱', '발로나 초코와 우유크림을 필링하여,부드럽고 달달한 초코우유 마카롱', 
'초코우유 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '로투스 마카롱', '달달한 로투스크림을 필링하여,바삭한 로투스를 올린 로투스 마카롱', 
'로투스 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '크림치즈 마카롱', '입안에서 사르르 녹는 고급스러운 크림치즈 마카롱', 
'크림치즈 마카롱 상세페이지', '7cm~7.5cm 내외', '1개당 50g', '14,000원', '250개');


SELECT * FROM PRODUCT_TBL;

COMMIT;

