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