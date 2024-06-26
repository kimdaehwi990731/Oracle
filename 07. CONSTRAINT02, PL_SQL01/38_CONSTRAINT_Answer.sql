--1) SCORE 테이블과 동일한 구조를 갖는 SCORE_CHK를 생성하고 RESULT 60이상 90이하만 입력 가능하도록 하세요.
CREATE TABLE SCORE_CHK1(
    CNO NUMBER,
    SNO NUMBER,
    RESULT NUMBER,
    CONSTRAINT CHK_SCORE_RES1 CHECK(RESULT BETWEEN 60 AND 90)
);

INSERT INTO SCORE_CHK1
VALUES (1, 2, 91);

--2) STUDENT 테이블과 동일한 구조를 갖는 STUDENT_COPY 테이블을 생성하면서 SNO은 PK로 SNAME은 NOT NULL로 
--SYEAR의 DEFAULT는 1로 설정하세요.
CREATE TABLE STUDENT_COPY1(
    SNO NUMBER,
    SNAME VARCHAR2(20) NOT NULL,
    MAJOR VARCHAR2(10),
    SYEAR NUMBER(1) DEFAULT 1,
    CONSTRAINT PK_ST_SNO1 PRIMARY KEY(SNO)
);

INSERT INTO STUDENT_COPY1(
    SNO,
    SNAME,
    MAJOR
) VALUES (
    2,
    'B',
    NULL
);

SELECT *
    FROM STUDENT_COPY1;

--3) COURSE 테이블과 동일한 구조를 갖는 COURSE_CONTSRAINT 테이블을 생성하면서 CNO, CNAME을 PK로 
--PNO은 PROFESSOR_PK의 PNO을 참조하여 FK로 설정하고 ST_NUM은 DEFAULT 2로 설정하세요.
CREATE TABLE COURSE_CONSTRAINT1(
    CNO NUMBER,
    CNAME VARCHAR2(10),
    ST_NUMBER NUMBER(1) DEFAULT 2,
    PNO NUMBER,
    CONSTRAINT PK_COURSE_CONST_CNO_CNAME PRIMARY KEY(CNO, CNAME),
    CONSTRAINT FK_COURSE_CONST_PNO FOREIGN KEY(PNO)
        REFERENCES PROFESSOR_PK1(PNO)
);

SELECT *
    FROM PROFESSOR_PK1;
    
INSERT INTO PROFESSOR_PK1
VALUES (4, 'D', 'ENG', 'REGULAR', SYSDATE);

INSERT INTO COURSE_CONSTRAINT1(
    CNO,
    CNAME,
    PNO
) VALUES (
    4,
    'GRAMMER',
    4
);

SELECT *
    FROM COURSE_CONSTRAINT1;