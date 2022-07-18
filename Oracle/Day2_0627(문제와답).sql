/*
1. hire_date가 2006년 1월 1일 이전인 직원의 이름,성,이메일

2. lastname이 'Jones' 인 직원의 모든 컬럼

3. salary 가 5000 이상인 직원의 이름,성,JOB_ID 조회

4. JOB_ID 에 ACCOUNT 가 들어가는 직원의 이름,성,salary 조회

5. 부서_ID 가 50 ,60, 80,90 인 직원의 직원_ID, 이름,성 조회
*/


SELECT * FROM EMPLOYEES e WHERE HIRE_DATE < '2006-01-01';
SELECT * FROM EMPLOYEES e WHERE LAST_NAME = 'Jones';

--대소문자 검사는 조건식에 주의해야 합니다.
--컬럼 값을 대소문자 변환 후 조건 값 비교 > 대소문자 무관하게 검사하는 방법
SELECT * FROM EMPLOYEES e WHERE UPPER(LAST_NAME) = 'Jones';
SELECT * FROM EMPLOYEES e WHERE LOWER(LAST_NAME) = 'Jones';


SELECT * FROM EMPLOYEES e WHERE SALARY >= 5000;
SELECT * FROM EMPLOYEES e WHERE JOB_ID LIKE '%ACCOUNT%';
SELECT * FROM EMPLOYEES e WHERE DEPARTMENT_ID IN (50, 60, 80, 90);

SELECT  * FROM EMPLOYEES e WHERE DEPARTMENT_ID = '60'; --컬럼 형식에 따라 number로 전환?

--통계함수 : count, avg, max, min / 통계 함수는 그룹 함수라고도 합니다.
         -- 해당 함수 결과 값을 구하기 위해 특정 컬럼 사용하여 여러 데이터를 그룹화한 후 실행
SELECT COUNT(*) FROM EMPLOYEES e ;   -- 테이블 전체 데이터 갯수 : 107
SELECT MAX(salary) FROM EMPLOYEES e ; -- salary 컬럼의 최대값 : 24000
SELECT MIN(salary) FROM EMPLOYEES e ; -- salary 컬럼의 최소값 : 2100
SELECT AVG(salary) FROM EMPLOYEES e ; -- 평균값  
SELECT SUM(salary) FROM EMPLOYEES e ; -- 합계 

--위 5개 통계함수를 job_id = 'it_prog' 값을 조건식으로 똑같이 실행해 보기

SELECT COUNT(*) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT AVG(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT SUM(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';


SELECT JOB_ID, COUNT(*) FROM EMPLOYEES e 
WHERE JOB_ID = 'IT_PROG'; -- 오류 : 단일 그룹의 그룹 함수가 아닙니다.

-- 오늘의 요약 : create table, insert into, select ~ where ~ 기본 형식
-- 참고 : 별칭 (alias)
SELECT * FROM EMPLOYEES e ;  -- EMPLOYEES 테이블의 별칭 e
SELECT * FROM DEPARTMENTS d ; -- DEPARTMENT 테이블의 별칭 d 
-- 위에서는 굳이 별칭이 필요없습니다. 




