drop TABLE cartResult_tbl;
DROP SEQUENCE cartResultNum_SEQ;

CREATE TABLE cartResult_tbl (
  cartResultNum NUMBER PRIMARY KEY,
  mno NUMBER NOT NULL,
  product_bno NUMBER NOT NULL,
  product_Count NUMBER,
  ORDERDATE DATE DEFAULT SYSDATE,
  FOREIGN KEY (mno) REFERENCES member_tbl (mno),
  FOREIGN KEY (product_bno) REFERENCES PRODUCT_TBL (PRODUCT_BNO)
);

CREATE SEQUENCE cartResultNum_SEQ;

select * from cartResult_tbl;

COMMIT;


SELECT 
		  c.mno, c.product_Count,
		  p.PRODUCT_BNO, p.PRODUCT_NAME, p.PRODUCT_PRICE
		FROM 
		  cartResult_tbl c
		JOIN product_tbl p ON c.product_bno = p.PRODUCT_BNO
		where c.mno=2;


