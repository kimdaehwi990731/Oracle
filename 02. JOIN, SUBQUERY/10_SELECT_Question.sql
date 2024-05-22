--1) 학생중에 동명이인을 검색한다
SELECT S.SNO, S.SNAME
	FROM STUDENT S
	JOIN STUDENT ST ON (S.SNAME = ST.SNAME) AND (S.SNO != ST.SNO)
	ORDER BY SNAME;

--2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
SELECT C.CNAME
	FROM PROFESSOR P
	LEFT JOIN COURSE C ON C.PNO = P.PNO
	ORDER BY P."SECTION";

--3) 이번 학기 등록된 모든 과목과 담당 교수 정보를 학점 순으로 검색한다
SELECT *
	FROM COURSE C
	FULL JOIN PROFESSOR P ON P.PNO = C.PNO
	ORDER BY C.ST_NUM;
