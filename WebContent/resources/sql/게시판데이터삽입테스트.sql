-- ��Ʈ������ �Խ��ǵ����� ���� �׽�Ʈ
DECLARE
    I INT;
BEGIN
    FOR I IN 1 .. 100
    LOOP
        INSERT INTO BOARD_TBL(bno,cid,title,content,writer)
        VALUES (BOARD_BNO_SEQ.NEXTVAL,'paging_tester','����¡����'||I,'����¡����'||I,'����¡�׽���');
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
        VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'testPaging', '����¡��ǰ����||I', '����¡��ǰ�Ұ�'||I, '����¡��ǰ����'||I, 
                '����¡��ǰ������'||I, '����¡��ǰ�߷�'||I, '0'||I, '����¡��ǰ���'||I);
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
        VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'testPaging', '����¡��ǰ����'||I, '����¡��ǰ�Ұ�'||I, '����¡��ǰ����'||I, 
                '����¡��ǰ������'||I, '����¡��ǰ����'||I, 100, '���ϸ�'||I);
    END LOOP;
END;

DELETE FROM PRODUCT_TBL
WHERE cateId = 'testPaging';

