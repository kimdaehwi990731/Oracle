--1) WITH 절을 이용하여 정교수만 모여있는 가상테이블 하나와 일반과목(과목명에 일반이 포함되는)들이 모여있는 가상테이블 하나를 생성하여 
--   일반과목들을 강의하는 교수의 정보 조회하세요.(과목번호, 과목명, 교수번호, 교수이름)
WITH PRO AS (
	SELECT PNO, PNAME
	FROM PROFESSOR
	WHERE ORDERS = '정교수'
)
SELECT C.CNO, C.CNAME, PRO.PNO, PRO.PNAME
FROM PRO
JOIN COURSE C ON C.PNO = PRO.PNO
WHERE C.CNAME LIKE '%일반%';

--2) WITH 절을 이용하여 급여가 3000이상인 사원정보를 갖는 가상테이블 하나와 보너스가 500이상인 사원정보를 갖는 가상테이블 하나를 생성하여
--   두 테이블에 모두 속해있는 사원의 정보를 모두 조회하세요.
WITH OVERSAL AS (
	SELECT *
	FROM EMP
	WHERE SAL >= 3000
),
OVERCOMM AS (
	SELECT *
	FROM EMP
	WHERE COMM >= 500
)
SELECT *
FROM OVERSAL
JOIN OVERCOMM ON OVERSAL.ENO = OVERCOMM.ENO;

--3) WITH 절을 이용하여 평점이 3.3이상인 학생의 목록을 갖는 가상테이블 하나와 학생별 기말고사 평균점수를 갖는 가상테이블 하나를 생성하여
--   평점이 3.3이상인 학생의 기말고사 평균 점수를 조회하세요.
WITH OVERAVG AS (
	SELECT SNO, SNAME, AVR
	FROM STUDENT
	WHERE AVR >= 3.3
),
ALLAVG AS (
	SELECT SNO, AVG(RESULT) AS "AVG_RESULT"
	FROM SCORE
	GROUP BY SNO
)
SELECT OVERAVG.SNAME, OVERAVG.AVR, ALLAVG.AVG_RESULT
FROM OVERAVG
JOIN ALLAVG ON OVERAVG.SNO = ALLAVG.SNO;

--4) WITH 절을 이용하여 부임일자가 25년이상된 교수정보를 갖는 가상테이블 하나와 과목번호, 과목명, 학생번호, 학생이름, 교수번호, 기말고사성적을
--   갖는 가상테이블 하나를 생성하여 기말고사 성적이 90이상인 과목번호, 과목명, 학생번호, 학생이름, 교수번호, 교수이름, 기말고사성적을 조회하세요.
WITH OVER25 AS (
	SELECT *
	FROM PROFESSOR
	WHERE TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY')) = 25
),
ST_CO_INFO AS (
	SELECT C.CNO, C.CNAME, ST.SNO, ST.SNAME, C.PNO, SC.RESULT
	FROM STUDENT ST
	JOIN SCORE SC ON ST.SNO = SC.SNO
	JOIN COURSE C ON SC.CNO = C.CNO
)
SELECT ST_CO_INFO.CNO, ST_CO_INFO.CNAME, ST_CO_INFO.SNO, ST_CO_INFO.SNAME, OVER25.PNO, OVER25.PNAME
FROM OVER25
JOIN ST_CO_INFO ON OVER25.PNO = ST_CO_INFO.PNO
WHERE ST_CO_INFO.RESULT >= 90;