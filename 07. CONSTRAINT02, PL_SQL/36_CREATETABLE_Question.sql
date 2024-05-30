--1) 다음 구조를 갖는 테이블을 생성하세요.
--PRODUCT 테이블 - PNO NUMBER PK              : 제품번호
--                PNMAE VARCHAR2(50)          : 제품이름
--                PRI NUMBER                  : 제품단가
--PAYMENT 테이블 - MNO NUMBER PK              : 전표번호
--               PDATE DATE NOT NULL         : 판매일자
--                CNAME VARCHAR2(50) NOT NULL : 고객명
--                TOTAL NUMBER TOTAL > 0      : 총액
--PAYMENT_DETAIL - MNO NUMBER PK FK           : 전표번호
--                PNO NUMBER PK FK            : 제품번호
--                AMOUNT NUMBER NOT NULL      : 수량
--                PRICE NUMBER NOT NULL       : 단가
--                TOTAL_PRICE NUMBER NOT NULL TOTAL_PRICE > 0 : 금액

CREATE TABLE PRODUCT(
	PNO NUMBER PRIMARY KEY,		 		-- 제품번호
	PNAME VARCHAR(50), 			 		-- 제품이름
	PRI NUMBER					 		-- 제품단가
);

CREATE TABLE PAYMENT(
	MNO NUMBER PRIMARY KEY,				-- 전표번호
	PDATE DATE NOT NULL,				-- 판매일자
	CNAME VARCHAR2(50) NOT NULL,		-- 고객명
	TOTAL NUMBER CHECK (TOTAL > 0)		-- 총액 (총액은 0보다 커야 함)
);

-- PAYMENT_DETAIL 테이블 생성
CREATE TABLE PAYMENT_DETAIL(
	MNO NUMBER,							-- 전표번호
	PNO NUMBER,							-- 제품번호
	AMOUNT NUMBER NOT NULL,				-- 수량
	PRICE NUMBER NOT NULL,				-- 단가
	TOTAL_PRICE NUMBER NOT NULL CHECK (TOTAL_PRICE > 0), -- 금액 (금액은 0보다 커야 함)
	PRIMARY KEY (MNO, PNO),				-- 복합키 설정 (전표번호, 제품번호)
	FOREIGN KEY (MNO) REFERENCES PAYMENT(MNO),			 -- 외래키 설정 (PAYMENT 테이블 MNO 참조)
	FOREIGN KEY (PNO) REFERENCES PRODUCT(PNO)			 -- 외래키 설정 (PRODUCT 테이블 PNO 참조)
);