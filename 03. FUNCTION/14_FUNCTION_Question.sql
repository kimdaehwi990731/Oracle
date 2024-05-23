--<단일 행 함수를 이용하세요>
--1) 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색하세요
SELECT (LAST_DAY(HIREDATE) - HIREDATE) AS "부임한 달에 근무한 일수"
FROM PROFESSOR;

--2) 교수들의 오늘까지 근무한 주가 몇 주인지 검색하세요 -- 정확하지 않음
SELECT ROUND(((TRUNC(SYSDATE, 'DD') - TRUNC(HIREDATE, 'DD')) / 7)) AS "부임부터 근무해온 주"
FROM PROFESSOR;

--3) 1991년에서 1995년 사이에 부임한 교수를 검색하세요
SELECT *
FROM PROFESSOR
WHERE HIREDATE BETWEEN TO_DATE('19910101', 'YYYYMMDD') AND TO_DATE('19951231', 'YYYYMMDD')
ORDER BY HIREDATE;

--4) 학생들의 4.5 환산 평점을 검색하세요(단 소수 이하 둘째자리까지)
SELECT ROUND((AVR * 4.5 / 4), 2) 
FROM STUDENT;

--5) 사원들의 오늘까지 근무 기간이 몇 년 몇 개월 며칠인지 검색하세요
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, HDATE) / 12) AS "YEARS"
    ,TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, HDATE), 12)) AS "MONTHS"
    , ROUND(SYSDATE - ADD_MONTHS(HDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HDATE)))) AS "DAYS"
FROM EMP;