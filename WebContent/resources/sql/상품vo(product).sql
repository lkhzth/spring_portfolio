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
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '��ŭ���⸶ī��', '���޴����� ����ũ���� �ʸ��Ͽ� ����100% ������̽��� ���� ��ŭ���� ��ī��', 
'��ŭ���⸶ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '�ܿ�ձ���ī��', '�ε巴�� ��ũ�� ���� �����ʸ��� ������ ����Ĩ�� ������ ������ ������ְ�! �ܿ�ձ���ī��', 
'�ܿ�ձ���ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '��Ƽ��ī��Ḷī��', 'ī���� ��������ұ����� �ʸ��Ͽ� ���������ڸ� �ø� ��§��§~ ��Ƽ��ī��� ��ī��', 
'��Ƽ��ī��Ḷī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', 'Ȳġ�ī��', '¬������ ���� ġ�� ������ �ʸ��ϰ� �ٻ��� ũ��Ŀ�� �÷� �ڲٸ� ���� ���� Ȳġ�ī��', 
'Ȳġ�ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', 'ũ�������ڸ�ī��', '�޴��� ����ũ���� �ʸ��Ͽ�,���ݷ� ���ð� ���⿡�� ��ƿ���ݸ��� �÷��� ũ�������� ��ī��', 
'ũ�������ڸ�ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '������ ��ī��', '���ٰ���ī���� �ְ�� �ٴҶ� ũ���� �ʸ� �Ͽ� ���������� ���� ä��� �ٻ��ϰ� ������ ����,����,ī��� ��Űũ��ġ�� ���� ������ ��ī��', 
'������ ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '��׷��� ��ī��', '���� ��׷��� ũ���� �ʸ��Ͽ� �Ծ� ���� ������� ������ ��׷��� ��ī��', 
'��׷��� ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '���ڶ� ���ڻ��� ��ī��', '�޴��� ���ڶ�ũ�� �ʸ��Ͽ�,�پ��� ���ڸ��ø� ���ڶ���ڻ��� ��ī��', 
'���ڶ� ���ڻ��� ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '������ ��ī��', '�޴��� ������ ũ������ �ʸ��ϰ� ������ ���ڸ� ���� ������ ��ī��', 
'������ ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '������Ʈ ��ī��', '���޴����� ���Ʈũ���� �������� ȯ�������� ������Ʈ ��ī��', 
'������Ʈ ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '�����ƿ��Ʈ ��ī��', '��ŭ�� ���Ʈ ũ�� �ʸ� �ȿ� ������ �����Ƹ� ä�� �����ƿ��Ʈ ��ī��', 
'�����ƿ��Ʈ ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '��������Ĩ ��ī��', '���� ����ũ������ �ʸ��Ͽ�,������ ����Ĩ ������ �İ��� �������ִ� ����� ��������Ĩ ��ī��', 
'��������Ĩ ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '�ұ� �ٴҶ� ��ī��', '�ε巯�� �ٴҶ�� �ұ��� ������ �ܸ��� §���� ��ȭ�Ӱ� ���� �ְ��� �� �ұ� �ٴҶ� ��ī��', 
'�ұ� �ٴҶ� ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '��纣�� ��ī��', '�����ϰ� ��ŭ�� ��纣���� ���Ʈ�� �ʸ��� ��纣�� ��ī��', 
'��纣�� ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '�ν� ��ī��', '������Ӱ� ���ڶ�ũ���� �ʸ��Ͽ� ��޽����� ���� �츰 �ν���ī��', 
'�ν� ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '������ ��ī��', '����� �ᰡ��ũ������ ���� ������ ��ī��', 
'������ ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', 'ũ������� ��ī��', '�ε巯�� �ٴҶ� ũ������ �ʸ��ϰ� ���� ���� ī������¡ �� ������ ũ����ַ� ��ī��', 
'ũ������� ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '���ڿ��� ��ī��', '�߷γ� ���ڿ� ����ũ���� �ʸ��Ͽ�,�ε巴�� �޴��� ���ڿ��� ��ī��', 
'���ڿ��� ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', '������ ��ī��', '�޴��� ������ũ���� �ʸ��Ͽ�,�ٻ��� �������� �ø� ������ ��ī��', 
'������ ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');
INSERT INTO PRODUCT_TBL(PRODUCT_BNO, cateId, PRODUCT_NAME, PRODUCT_INTRO, PRODUCT_CONTENT, PRODUCT_SIZE, PRODUCT_weight, PRODUCT_PRICE, PRODUCT_STOCK)
VALUES (PRODUCT_BNO_SEQ.NEXTVAL, 'macaron', 'ũ��ġ�� ��ī��', '�Ծȿ��� �縣�� ��� ��޽����� ũ��ġ�� ��ī��', 
'ũ��ġ�� ��ī�� ��������', '7cm~7.5cm ����', '1���� 50g', '14,000��', '250��');


SELECT * FROM PRODUCT_TBL;

COMMIT;

