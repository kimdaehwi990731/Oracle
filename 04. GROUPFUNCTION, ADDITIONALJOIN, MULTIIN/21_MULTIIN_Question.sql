--1) 다중 컬럼 IN절을 이용해서 기말고사 성적이 80점 이상인 과목번호, 학생번호, 기말고사 성적을 모두 조회하세요.
SELECT SC.CNO, S.SNO, SC."RESULT"
FROM STUDENT S
JOIN SCORE SC ON S.SNO = SC.SNO
WHERE (SC.CNO, SC."RESULT") IN (
	SELECT SSC.CNO, SSC."RESULT"
	FROM SCORE SSC
	WHERE SSC."RESULT" >= 80
);


--2) 다중 컬럼 IN절을 이용해서 화학과나 물리학과면서 학년이 1, 2, 3학년인 학생의 정보를 모두 조회하세요.
SELECT *
FROM STUDENT
WHERE (MAJOR, SYEAR) IN (('화학', 1), ('화학', 2), ('화학', 3), ('물리', 1), ('물리', 2), ('물리', 3));

--3) 다중 컬럼 IN절을 사용해서 부서가 10, 20, 30이면서 보너스가 1000이상인 사원의 사원번호, 사원이름, 부서번호, 부서이름, 업무, 급여, 보너스를 
--   조회하세요.(서브쿼리 사용)
SELECT E.ENO, E.ENAME, D.DNO, D.DNAME, E.JOB, E.SAL, E.COMM
FROM EMP E
JOIN DEPT D ON D.DNO = E.DNO
WHERE (E.DNO, E.COMM) IN (
	SELECT EM.DNO, EM.COMM
	FROM EMP EM
	WHERE (EM.DNO IN (10, 20, 30)) AND (E.COMM >= 1000)
);

--4) 다중 컬럼 IN절을 사용하여 기말고사 성적의 최고점이 100점인 과목의 과목번호, 과목이름, 학생번호, 학생이름,  기말고사 성적을 조회하세요.(서브쿼리 사용)
SELECT C.CNO, C.CNAME, S.SNO, S.SNAME, SC."RESULT"
FROM SCORE SC
JOIN COURSE C ON C.CNO = SC.CNO
JOIN STUDENT S ON S.SNO = SC.SNO
WHERE (C.CNO, SC."RESULT") IN (
    SELECT 
        CC.CNO, 
        MAX(SSC."RESULT") AS MAX_RESULT
    FROM COURSE CC
    JOIN SCORE SSC ON CC.CNO = SSC.CNO
    GROUP BY CC.CNO
    HAVING MAX(SSC."RESULT") = 100
);