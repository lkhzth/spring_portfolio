DROP TABLE PRODUCT_TBL;
DROP SEQUENCE PRODUCT_BNO_SEQ;

drop table CATEGORY_PRODUCT;
drop sequence CATEGORY_CProductNO_SEQ;

-- ��ǰī�װ� ���̺� 
create table CATEGORY_PRODUCT(
    cateId varchar2(15) PRIMARY KEY, 
    cateName nvarchar2(10) not null
);

create sequence CATEGORY_CProductNO_SEQ;

insert into CATEGORY_PRODUCT(cateId,cateName) values('macaron','��ī��');
insert into CATEGORY_PRODUCT(cateId,cateName) values('cake','����');
insert into CATEGORY_PRODUCT(cateId,cateName) values('promotion','ȫ����');

select * from CATEGORY_PRODUCT;
commit;


-- ��ǰ���̺�
CREATE TABLE PRODUCT_TBL(
    PRODUCT_BNO NUMBER(10) constraint pk_product_tbl PRIMARY KEY, -- ��ǰ��ȣ
    cateId VARCHAR2(30) NOT NULL, -- ��ǰī�װ�
    PRODUCT_NAME VARCHAR2(500) NOT NULL, -- ��ǰ�̸�
    PRODUCT_INTRO VARCHAR2(4000) NOT NULL, -- ��ǰ�̸��Ұ�
    PRODUCT_CONTENT VARCHAR2(4000) NOT NULL, -- ��ǰ��
    PRODUCT_SIZE VARCHAR2(4000) NOT NULL, -- ��ǰũ��
    PRODUCT_weight VARCHAR2(4000) NOT NULL, -- ��ǰ�߷�
    PRODUCT_PRICE VARCHAR2(100) NOT NULL, -- ��ǰ����
    PRODUCT_STOCK VARCHAR2(100) NOT NULL, -- ��ǰ���
    fileName_Product varchar2(100), -- ÷������ �̸�
    fileType_Product varchar2(20), -- ÷������ Ÿ��
    constraint fk_cateId foreign key(cateId) 
    references CATEGORY_PRODUCT(cateId) on delete cascade
    -- �׿� ��ۺ� ������ �ּ��ֹ������� jsp��
);

CREATE SEQUENCE PRODUCT_BNO_SEQ;

INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '��������ī��', '��ǰ�̸��Ұ�', '��������ī�ջ�������', '6', '30g', '13000', '240');

SELECT * FROM PRODUCT_TBL;

COMMIT;

