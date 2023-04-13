-- 포트폴리오 게시판데이터 삽입 테스트
DECLARE
    I INT;
BEGIN
    FOR I IN 1 .. 100
    LOOP
        INSERT INTO BOARD_TBL(bno,cid,title,content,writer)
        VALUES (BOARD_BNO_SEQ.NEXTVAL,'paging_tester','페이징제목'||I,'페이징내용'||I,'페이징테스터');
    END LOOP;
END;


/* DECLARE
    I INT;
BEGIN
    FOR I IN 1 .. 111
    LOOP
        INSERT INTO 
            PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, 
            PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
        VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'testPaging', '페이징상품제목||I', '페이징상품소개'||I, '페이징상품내용'||I, 
                '페이징상품사이즈'||I, '페이징상품중량'||I, '0'||I, '페이징상품재고'||I);
    END LOOP;
END; */


DECLARE
    I INT;
BEGIN
    FOR I IN 1 .. 150
    LOOP
        INSERT INTO 
            PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, 
            PRODUCT_SIZE, PRODUCT_WEIGHT, PRODUCT_STOCK, fileName_Product)
        VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'testPaging', '페이징상품제목'||I, '페이징상품소개'||I, '페이징상품내용'||I, 
                '페이징상품사이즈'||I, '페이징상품무게'||I, 100, '파일명'||I);
    END LOOP;
END;

DELETE FROM PRODUCT_TBL
WHERE cateId = 'testPaging';

