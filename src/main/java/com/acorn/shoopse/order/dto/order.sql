CREATE TABLE AGENCY
(
	A_CODE               NUMBER NOT NULL ,
	COMPANY              VARCHAR2(100) NULL ,
	NAME                 VARCHAR2(100) NULL ,
	PHONE                VARCHAR2(100) NULL ,
	EMAIL                VARCHAR2(100) NULL ,
	REGDATE              DATE DEFAULT  SYSDATE  NOT NULL 
);

CREATE UNIQUE INDEX XPK납품 ON AGENCY
(A_CODE   ASC);

ALTER TABLE AGENCY
	ADD CONSTRAINT  XPK납품 PRIMARY KEY (A_CODE);

CREATE TABLE NOT_USER
(
	MEM_NUM              NUMBER NOT NULL 
);

CREATE UNIQUE INDEX XPK비회원 ON NOT_USER
(MEM_NUM   ASC);

ALTER TABLE NOT_USER
	ADD CONSTRAINT  XPK비회원 PRIMARY KEY (MEM_NUM);

CREATE TABLE ONLINE_DEPOSIT
(
	D_NUMBER             NUMBER NOT NULL ,
	D_DATE               DATE NULL ,
	D_AMOUNT             NUMBER NULL ,
	D_BANK               VARCHAR2(100) NULL ,
	O_NO                 NUMBER NOT NULL ,
	D_NAME               VARCHAR2(100) NULL 
);

CREATE UNIQUE INDEX XPK온라인입금 ON ONLINE_DEPOSIT
(D_NUMBER   ASC,O_NO   ASC);

ALTER TABLE ONLINE_DEPOSIT
	ADD CONSTRAINT  XPK온라인입금 PRIMARY KEY (D_NUMBER,O_NO);

CREATE TABLE ORDER_REQ_ADDR
(
	O_NO                 NUMBER NOT NULL ,
	RES_NAME             VARCHAR2(100) NULL ,
	RES_PHONE            VARCHAR2(100) NULL ,
	RES_ADDRESS          VARCHAR2(100) NULL 
);

CREATE UNIQUE INDEX XPK배송지 ON ORDER_REQ_ADDR
(O_NO   ASC);

ALTER TABLE ORDER_REQ_ADDR
	ADD CONSTRAINT  XPK배송지 PRIMARY KEY (O_NO);

CREATE TABLE ORDER_SUB
(
	O_NO                 NUMBER NOT NULL ,
	P_CODE               VARCHAR2(6) NOT NULL ,
	O_COUNT              NUMBER NULL ,
	O_SUB_TOTAL_PRICE    NUMBER NULL ,
	O_SUB_PRICE          NUMBER NULL ,
	P_NO                 NUMBER NOT NULL 
);

CREATE UNIQUE INDEX XPK주문상세 ON ORDER_SUB
(O_NO   ASC,P_NO   ASC,P_CODE   ASC);

ALTER TABLE ORDER_SUB
	ADD CONSTRAINT  XPK주문상세 PRIMARY KEY (O_NO,P_NO,P_CODE);

CREATE TABLE ORDER_TB
(
	O_NO                 NUMBER NOT NULL ,
	O_DATE               DATE DEFAULT  SYSDATE  NULL ,
	O_TOTAL_COUNT        NUMBER NULL ,
	O_TOTAL_PRICE        NUMBER NULL ,
	MEM_NUM              NUMBER NOT NULL ,
	DELIVERY_FLAG        CHAR(1) DEFAULT  '1'  NULL  CONSTRAINT  ODF CHECK (DELIVERY_FLAG IN(1,2)),
	O_STATUS             CHAR(1) DEFAULT  '0'  NULL  CONSTRAINT  OST CHECK (O_STATUS IN('1','2','3','4','5'))
);

CREATE UNIQUE INDEX XPK주문 ON ORDER_TB
(O_NO   ASC);

ALTER TABLE ORDER_TB
	ADD CONSTRAINT  XPK주문 PRIMARY KEY (O_NO);

CREATE TABLE PRODUCT_KIND
(
	P_KIND_CODE          VARCHAR2(4) NOT NULL ,
	PARENT_KIND_CODE     VARCHAR2(2) NULL ,
	KIND_NAME            VARCHAR2(15) NULL 
);

CREATE UNIQUE INDEX XPK상품분류 ON PRODUCT_KIND
(P_KIND_CODE   ASC);

ALTER TABLE PRODUCT_KIND
	ADD CONSTRAINT  XPK상품분류 PRIMARY KEY (P_KIND_CODE);

CREATE TABLE PRODUCT_REVIEW
(
	P_CODE               VARCHAR2(6) NOT NULL ,
	MEM_NUM              NUMBER NOT NULL ,
	REVIEW               VARCHAR2(100) NULL ,
	STAR                 CHAR(5) NULL ,
	TITLE                VARCHAR2(100) NOT NULL 
);

CREATE UNIQUE INDEX XPK상품평 ON PRODUCT_REVIEW
(P_CODE   ASC,MEM_NUM   ASC);

ALTER TABLE PRODUCT_REVIEW
	ADD CONSTRAINT  XPK상품평 PRIMARY KEY (P_CODE,MEM_NUM);

CREATE TABLE PRODUCT_SUB
(
	P_NO                 NUMBER NOT NULL ,
	P_SIZE               VARCHAR2(4) NULL ,
	P_STOCK              NUMBER NULL ,
	P_CODE               VARCHAR2(6) NOT NULL 
);

CREATE UNIQUE INDEX XPK상품상세 ON PRODUCT_SUB
(P_NO   ASC,P_CODE   ASC);

ALTER TABLE PRODUCT_SUB
	ADD CONSTRAINT  XPK상품상세 PRIMARY KEY (P_NO,P_CODE);

CREATE TABLE PRODUCT_SUB_IMG
(
	P_SUB_IMG            VARCHAR2(100) NOT NULL ,
	P_CODE               VARCHAR2(6) NULL 
);

CREATE UNIQUE INDEX XPK상품서브이미지 ON PRODUCT_SUB_IMG
(P_SUB_IMG   ASC);

ALTER TABLE PRODUCT_SUB_IMG
	ADD CONSTRAINT  XPK상품서브이미지 PRIMARY KEY (P_SUB_IMG);

CREATE TABLE PRODUCT_TB
(
	P_CODE               VARCHAR2(6) NOT NULL ,
	P_NAME               VARCHAR2(100) NULL ,
	P_BRAND              VARCHAR2(100) NULL ,
	P_PRICE              NUMBER NULL ,
	POINT                NUMBER NULL ,
	P_REGDATE            DATE NULL ,
	P_KIND_CODE          VARCHAR2(4) NOT NULL ,
	P_COMMENT            VARCHAR2(50) NULL ,
	P_DETAIL_COMMENT     CLOB NULL ,
	P_MAIN_IMG           VARCHAR2(100) NULL 
);

CREATE UNIQUE INDEX XPK상품 ON PRODUCT_TB
(P_CODE   ASC);

ALTER TABLE PRODUCT_TB
	ADD CONSTRAINT  XPK상품 PRIMARY KEY (P_CODE);

CREATE TABLE USERS
(
	MEM_NUM              NUMBER NOT NULL ,
	ID                   VARCHAR2(100) NOT NULL ,
	PWD                  VARCHAR2(100) NOT NULL ,
	ADDR                 VARCHAR2(100) NOT NULL ,
	REGDATE              DATE DEFAULT  SYSDATE  NULL ,
	POINT                NUMBER NULL ,
	NAME                 VARCHAR2(100) NOT NULL ,
	PHONE                VARCHAR2(100) NULL ,
	EMAIL                VARCHAR2(100) NULL 
);

CREATE UNIQUE INDEX XPK회원 ON USERS
(MEM_NUM   ASC);

ALTER TABLE USERS
	ADD CONSTRAINT  XPK회원 PRIMARY KEY (MEM_NUM);

CREATE TABLE USERS_TB
(
	MEM_NUM              NUMBER NOT NULL ,
	MEM_FLAG             CHAR(1) NOT NULL  CONSTRAINT  CMF CHECK (MEM_FLAG IN(1,2,3))
);

CREATE UNIQUE INDEX XPK고객 ON USERS_TB
(MEM_NUM   ASC);

ALTER TABLE USERS_TB
	ADD CONSTRAINT  XPK고객 PRIMARY KEY (MEM_NUM);

CREATE TABLE WEARING_SUB
(
	W_NO                 NUMBER NOT NULL ,
	P_CODE               VARCHAR2(6) NOT NULL ,
	W_COUNT              NUMBER NULL ,
	W_PRICE              NUMBER NULL ,
	P_NO                 NUMBER NOT NULL 
);

CREATE UNIQUE INDEX XPK입고상세 ON WEARING_SUB
(W_NO   ASC,P_CODE   ASC,P_NO   ASC);

ALTER TABLE WEARING_SUB
	ADD CONSTRAINT  XPK입고상세 PRIMARY KEY (W_NO,P_CODE,P_NO);

CREATE TABLE WEARING_TB
(
	W_NO                 NUMBER NOT NULL ,
	W_DATE               DATE NULL ,
	W_TOTAL_COUNT        NUMBER NULL ,
	W_TOTAL_PRICE        NUMBER NULL ,
	A_CODE               NUMBER NOT NULL 
);

CREATE UNIQUE INDEX XPK입고 ON WEARING_TB
(W_NO   ASC);

ALTER TABLE WEARING_TB
	ADD CONSTRAINT  XPK입고 PRIMARY KEY (W_NO);

ALTER TABLE NOT_USER
	ADD (CONSTRAINT R_14 FOREIGN KEY (MEM_NUM) REFERENCES USERS_TB (MEM_NUM));

ALTER TABLE ONLINE_DEPOSIT
	ADD (CONSTRAINT R_37 FOREIGN KEY (O_NO) REFERENCES ORDER_TB (O_NO));

ALTER TABLE ORDER_REQ_ADDR
	ADD (CONSTRAINT R_19 FOREIGN KEY (O_NO) REFERENCES ORDER_TB (O_NO));

ALTER TABLE ORDER_SUB
	ADD (CONSTRAINT R_11 FOREIGN KEY (O_NO) REFERENCES ORDER_TB (O_NO));

ALTER TABLE ORDER_SUB
	ADD (CONSTRAINT R_12 FOREIGN KEY (P_CODE) REFERENCES PRODUCT_TB (P_CODE));

ALTER TABLE ORDER_SUB
	ADD (CONSTRAINT R_36 FOREIGN KEY (P_NO, P_CODE) REFERENCES PRODUCT_SUB (P_NO, P_CODE));

ALTER TABLE ORDER_TB
	ADD (CONSTRAINT R_16 FOREIGN KEY (MEM_NUM) REFERENCES USERS_TB (MEM_NUM));

ALTER TABLE PRODUCT_KIND
	ADD (CONSTRAINT R_1 FOREIGN KEY (PARENT_KIND_CODE) REFERENCES PRODUCT_KIND (P_KIND_CODE) ON DELETE SET NULL);

ALTER TABLE PRODUCT_REVIEW
	ADD (CONSTRAINT R_5 FOREIGN KEY (P_CODE) REFERENCES PRODUCT_TB (P_CODE));

ALTER TABLE PRODUCT_REVIEW
	ADD (CONSTRAINT R_6 FOREIGN KEY (MEM_NUM) REFERENCES USERS (MEM_NUM));

ALTER TABLE PRODUCT_SUB
	ADD (CONSTRAINT R_35 FOREIGN KEY (P_CODE) REFERENCES PRODUCT_TB (P_CODE));

ALTER TABLE PRODUCT_SUB_IMG
	ADD (CONSTRAINT R_38 FOREIGN KEY (P_CODE) REFERENCES PRODUCT_TB (P_CODE) ON DELETE SET NULL);

ALTER TABLE PRODUCT_TB
	ADD (CONSTRAINT R_2 FOREIGN KEY (P_KIND_CODE) REFERENCES PRODUCT_KIND (P_KIND_CODE));

ALTER TABLE USERS
	ADD (CONSTRAINT R_13 FOREIGN KEY (MEM_NUM) REFERENCES USERS_TB (MEM_NUM));

ALTER TABLE WEARING_SUB
	ADD (CONSTRAINT R_33 FOREIGN KEY (W_NO) REFERENCES WEARING_TB (W_NO));

ALTER TABLE WEARING_SUB
	ADD (CONSTRAINT R_34 FOREIGN KEY (P_CODE) REFERENCES PRODUCT_TB (P_CODE));

ALTER TABLE WEARING_SUB
	ADD (CONSTRAINT R_41 FOREIGN KEY (P_NO, P_CODE) REFERENCES PRODUCT_SUB (P_NO, P_CODE));

ALTER TABLE WEARING_TB
	ADD (CONSTRAINT R_31 FOREIGN KEY (A_CODE) REFERENCES AGENCY (A_CODE));
	
ALTER TABLE users ADD UNIQUE (id);	

CREATE SEQUENCE p_code_seq;

INSERT INTO product_tb
VALUES (
         p_code_seq.NEXTVAL,
         '베어맥스 트리플 블랙', 
         '나이키', 
         239000, 
         2390, 
         SYSDATE,
         '0101',
         'comment', 
         'detail_comment',
         'nike_beypermax.jpg'
      );
SELECT * FROM USERS;      
CREATE SEQUENCE mem_num_seq;
INSERT INTO USERS
VALUES (2, 'root', 'dpdlzhs1!', '종로', SYSDATE, 1000, '관리자', '010-3360-0304', '24thelf@naver.com');
select mem_num_seq.NEXTVAL FROM dual;
select * from users_tb;
insert into users_tb
values (mem_num_seq.NEXTVAL, '3')

select LAST_NUMBER from user_sequences
where SEQUENCE_NAME = 'MEM_NUM_SEQ';
