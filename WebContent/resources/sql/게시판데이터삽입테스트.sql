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