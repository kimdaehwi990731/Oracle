--1) 성적순으로 학생의 이름을 검색하라
SELECT SNAME
	FROM STUDENT
	-- 성적: 높은 점수부터 낮은 점수 순
	ORDER BY AVR DESC;

--2) 학과별 성적순으로 학생의 정보를 검색하라
SELECT *
	FROM STUDENT
	-- 학과: 가나다 순 // 성적: 높은 점수부터 낮은 점수 순
	ORDER BY MAJOR, AVR DESC;

--3) 학년별 성적순으로 학생의 정보를 검색하라
SELECT *
	FROM STUDENT
	-- 학년: 높은 학년부터 낮은 학년 순 // 성적: 높은 점수부터 낮은 점수 순 
	ORDER BY SYEAR DESC, AVR DESC;

--4) 학과별 학년별로 학생의 정보를 성적순으로 검색하라
SELECT *
	FROM STUDENT
	-- 학과: 가나다 순 // 성적: 높은 점수부터 낮은 점수 순
	ORDER BY MAJOR, SYEAR DESC;

--5) 학점순으로 과목 이름을 검색하라
SELECT CNAME
	FROM COURSE
	-- 학점: 높은 학점부터 낮은 학점 순
	ORDER BY ST_NUM DESC;

--6) 각 학과별로 교수의 정보를 검색하라
SELECT *
	FROM PROFESSOR
	-- 학과: 가나다 순
	ORDER BY SECTION;

--7) 지위별로 교수의 정보를 검색하라
SELECT *
	FROM PROFESSOR
	-- 직위: 가나다 순
	ORDER BY ORDER;

--8) 각 학과별로 교수의 정보를 부임일자 순으로 검색하라
SELECT *
	FROM PROFESSOR
	-- 부임일자: 부임일자가 오래된 것부터 최근인 것 순
	ORDER BY HIREDATE;