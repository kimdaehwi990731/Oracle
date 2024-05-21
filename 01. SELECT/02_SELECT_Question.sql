--1) 각 학생의 평점을 검색하라(별칭을 사용)
SELECT SNAME AS "학생명", AVR AS "평점"
	FROM STUDENT;

--2) 각 과목의 학점를 검색하라(별칭을 사용)
SELECT CNAME AS "과목명", ST_NUM AS "학점"
	FROM COURSE;

--3) 각 교수의 지위를 검색하라(별칭을 사용)
SELECT PNAME AS "교수명", ORDERS AS "직위"
	FROM PROFESSOR;

--4) 급여를 10%인상했을 때 연간 지급되는 급여를 검색하라(별칭을 사용)
SELECT ENAME AS "사원명", (SAL + (SAL * 0.1)) AS "급여(10%인상 적용 기준)"
	FROM EMP;

--5) 현재 학생의 평균 평점은 4.0만점이다. 이를 4.5만점으로 환산해서 검색하라(별칭을 사용)
SELECT SNAME AS "학생명", (AVR * 4.5 / 4) AS "평점(최고 점수 4.5점 환산치 적용 기준)"
	FROM STUDENT;