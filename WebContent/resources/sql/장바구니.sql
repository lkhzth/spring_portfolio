drop TABLE cart_tbl;
DROP SEQUENCE cartNum_SEQ;

CREATE TABLE cart_tbl (
  cartNum NUMBER PRIMARY KEY,
  mno NUMBER NOT NULL,
  product_bno NUMBER NOT NULL,
  product_Count NUMBER,
  FOREIGN KEY (mno) REFERENCES member_tbl (mno),
  FOREIGN KEY (product_bno) REFERENCES PRODUCT_TBL (PRODUCT_BNO)
);

CREATE SEQUENCE cartNum_SEQ;

INSERT INTO cart_tbl(cartNum, mno, product_bno, product_Count)
VALUES (cartNum_SEQ.NEXTVAL, 2, 1, 1);

--  회원번호, 상품번호 
select sum(product_count) as product_count  from cart_tbl where mno=2 and product_bno=1; 


COMMIT;




SELECT 
		  c.cartNum, c.mno, c.product_Count,
		  p.PRODUCT_BNO, p.PRODUCT_NAME, p.PRODUCT_PRICE
		FROM 
		  cart_tbl c
		JOIN member_tbl m ON c.mno = m.mno
		JOIN product_tbl p ON c.product_bno = p.PRODUCT_BNO
		where c.mno=2;







