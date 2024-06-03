--1) 전공과 전공별 기말고사 평균 점수를 갖는 테이블
--   T_MAJOR_AVG_RES를 생성하고 SCORE테이블과 STUDENT테이블을 참조해서
--   T_MAJOR_AVG_RES에 데이터를 저장하는 프로시저 P_MAJOR_AVG_RES를 생성하세요.

-- CREATE TABLE
CREATE TABLE T_MAJOR_AVG_RES
AS SELECT ST.MAJOR, ROUND(AVG(SC.RESULT), 2) AS "AVG_RESULT"
    FROM STUDENT ST
    JOIN SCORE SC ON SC.SNO = ST.SNO
    GROUP BY ST.MAJOR;

-- CREATE PROCEDURE
CREATE OR REPLACE PROCEDURE P_MAJOR_AVG_RES
IS
    CURSOR CUR_P_MAJOR_AVG_RES IS
        SELECT ST.MAJOR, ROUND(AVG(SC.RESULT), 2) AS "AVG_RESULT"
        FROM STUDENT ST
        JOIN SCORE SC ON SC.SNO = ST.SNO
        GROUP BY ST.MAJOR;
BEGIN   
    FOR ST_SC_ROW IN CUR_P_MAJOR_AVG_RES LOOP
        INSERT INTO T_MAJOR_AVG_RES
        VALUES ST_SC_ROW;
        COMMIT;
    END LOOP;
END;
/
EXEC P_MAJOR_AVG_RES;

SELECT * FROM T_MAJOR_AVG_RES;

--2) 교수들은 부임일로부터 5년마다 안식년을 갖습니다.
--   교수들의 오늘날짜까지의 안식년 횟수를 리턴하는 함수 F_GET_VACATION_CNT를 구현하세요.
CREATE OR REPLACE FUNCTION F_GET_VACATION_CNT
(
    HIREDATE DATE,
    THIS_DATE DATE
) RETURN NUMBER
IS
    REST_CNT NUMBER;
BEGIN
    IF HIREDATE >= THIS_DATE THEN
        REST_CNT := 0;
    ELSE
        REST_CNT := FLOOR(MONTHS_BETWEEN(THIS_DATE, HIREDATE) / 60);
    END IF;
    RETURN REST_CNT;
END;
/

SELECT P.PNAME, P.HIREDATE, F_GET_VACATION_CNT(P.HIREDATE, SYSDATE) AS "REST_CNT"
FROM PROFESSOR P;
