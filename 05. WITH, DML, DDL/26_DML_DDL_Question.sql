--1) STUDENT 테이블을 참조하여 ST_TEMP 테이블을 만들고 모든 학생의 성적을 4.5만점 기준으로 수정하세요
CREATE TABLE ST_TEMP AS SELECT * FROM STUDENT;
COMMIT;

UPDATE ST_TEMP
SET AVR = AVR * 4.5 / 4;
COMMIT;

--2) PROFESSOR 테이블을 참조하여 PF_TEMP 테이블을 만들고 모든 교수의 부임일자를 100일 앞으로 수정하세요
CREATE TABLE PF_TEMP AS SELECT * FROM PROFESSOR;
COMMIT;

UPDATE PF_TEMP
SET HIREDATE = HIREDATE - 100;
COMMIT;

--3) ST_TEMP 테이블에서 화학과 2학년 학생의 정보를 삭제하세요
DELETE FROM ST_TEMP
WHERE (ST_TEMP.MAJOR = '화학') AND (ST_TEMP.SYEAR = 2);
COMMIT;

--4) PF_TEMP 테이블에서 조교수의 정보를 삭제하세요
DELETE FROM PF_TEMP
WHERE PF_TEMP.ORDERS = '조교수';
COMMIT;

--5) EMP 테이블을 참조하여 EMP2 테이블을 만들고 DNO = 30인 사원의 보너스를 15프로 상승시킨 값으로 변경하시고
-- 	 DNO = 10인 사원의 보너스를 5프로 상승시킨 값으로 변경, 
--   DNO = 20인 사원의 급여를 10프로 상승시킨 값으로 변경하세요.
CREATE TABLE EMP2 AS SELECT * FROM EMP;
COMMIT;

UPDATE EMP2
SET COMM = COMM * 1.15
WHERE DNO = 30;
COMMIT;

UPDATE EMP2
SET COMM = COMM * 1.05
WHERE DNO = 10;
COMMIT;

UPDATE EMP2
SET SAL = SAL * 1.2
WHERE DNO = 20;
COMMIT;

--6) 화학과 2학년 학생중 기말고사 성적의 등급이 A, B인 정보를 갖는 테이블 SCORE_STGR을 생성하세요.(SNO, SNAME, MAJOR, SYEAR, CNO, CNAME RESULT, GRADE)
CREATE TABLE SCORE_STGR AS (
	SELECT ST.SNO, ST.SNAME, ST.MAJOR, C.CNO, C.CNAME, SC.RESULT, SCG.GRADE
	FROM STUDENT ST
	JOIN SCORE SC ON SC.SNO = ST.SNO
	JOIN SCGRADE SCG ON SC.RESULT BETWEEN SCG.LOSCORE AND SCG.HISCORE
	JOIN COURSE C ON SC.CNO = C.CNO
	WHERE (ST.MAJOR = '화학') AND (ST.SYEAR = 2) AND (SCG.GRADE IN ('A', 'B'))
);
COMMIT;

--7) 생물학과 학생중 평점이 2.7이상인 학생이 수강중인 과목의 정보를 갖는 테이블 ST_COURSEPF를 생성하세요. (SNO, SNAME, CNO, CNAME, PNO, PNAME, AVR)
CREATE TABLE ST_CORSEPF AS (
SELECT ST.SNO, ST.SNAME, ST.MAJOR, C.CNO, C.CNAME, C.PNO, P.PNAME, ST.AVR
	FROM STUDENT ST
	JOIN SCORE SC ON SC.SNO = ST.SNO
	JOIN COURSE C ON SC.CNO = C.CNO
	JOIN PROFESSOR P ON P.PNO = C.PNO
	WHERE (ST.MAJOR = '생물') AND (ST.AVR >= 2.7)
);
COMMIT;