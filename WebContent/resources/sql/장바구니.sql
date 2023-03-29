drop TABLE cart_tbl;

CREATE TABLE cart_tbl (
  cartId NUMBER PRIMARY KEY,
  memberId VARCHAR2(50) NOT NULL,
  product_bno NUMBER NOT NULL,
  product_Count number,
  FOREIGN KEY (memberId) REFERENCES member_tbl (memberId),
  FOREIGN KEY (product_bno) REFERENCES PRODUCT_TBL (PRODUCT_BNO)
);

-- 유니크 제약조건
alter table cart_tbl add unique (memberId, product_bno);
-- cartId not null 제약조건
ALTER TABLE cart_tbl MODIFY (cartId NUMBER NOT NULL);

select * from cart_tbl;

COMMIT;




