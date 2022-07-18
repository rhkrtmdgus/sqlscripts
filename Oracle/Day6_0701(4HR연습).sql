-- 조인과 GROUP BY 를 포함해서 SELECT 로 검색하는 문제를 10개 만들기

-- GROUP BY 결과로도 조인을 할 수 있습니다. 부서인원이 가장 많은 부서는? 5시 30분까지 제출하세요

-- 주석으로 검색하는 내용쓰고 
-- SELECT 쿼리 작성하세요.


-- 1. 국가 ID가 JP이고 지점 ID 갯수
SELECT LOCATION_ID, count(*) cnt 
FROM LOCATIONS l
WHERE COUNTRY_ID = 'US'
GROUP BY LOCATION_ID
ORDER BY cnt;

-- 2. 급여가 10000이상인 직원이 속한 부서의 매니저 ID조회
SELECT e.MANAGER_ID FROM EMPLOYEES e , DEPARTMENTS d 
	WHERE e.MANAGER_ID = d.MANAGER_ID AND SALARY >= 10000;

-- 3. DEPARTMENT_ID가 90인 직원의 EMPLOYEE_ID, PHONE_NUMBER, MANAGER_ID 조회하기
SELECT EMPLOYEE_ID, PHONE_NUMBER, D.MANAGER_ID FROM EMPLOYEES e, DEPARTMENTS d
	WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
	AND D.DEPARTMENT_ID = 90;

-- 4. JOB_TITLE이 Stock Clerk인 사람들의 성, 이름, 연봉 조회
SELECT j.JOB_TITLE, e.JOB_ID, e.FIRST_NAME, e.LAST_NAME, e.SALARY 
FROM EMPLOYEES e JOIN JOBS j ON e.JOB_ID = j.JOB_ID AND e.JOB_ID = 'ST_CLERK';

-- 5. 각 부서별 인원수
SELECT DEPARTMENT_ID, COUNT(*) 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID;

-- 6. 각 부서의 최고 연봉.
SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID;


-- 7. JOB_TITLE이 Accountant인 사람들의 성, 이름, 전화번호 조회
SELECT j.JOB_TITLE, e.JOB_ID, e.FIRST_NAME, e.LAST_NAME, e.PHONE_NUMBER 
FROM EMPLOYEES e JOIN JOBS j ON e.JOB_ID = j.JOB_ID AND e.JOB_ID = 'FI_ACCOUNT';

-- 8. JOB_TITLE이 Marketing Manager인 사람의 성, 이름, 이메일 조회
SELECT j.JOB_TITLE, e.JOB_ID, e.FIRST_NAME, e.LAST_NAME, e.EMAIL 
FROM EMPLOYEES e JOIN JOBS j ON e.JOB_ID = j.JOB_ID AND e.JOB_ID = 'MK_MAN'

-- 9. 급여가 3000이하인 직원들의 부서ID를 그룹화하여 해당 부서의 직원 수 조회
SELECT DEPARTMENT_ID, count(*) cnt
	FROM EMPLOYEES e 
	WHERE SALARY <= 3000
	GROUP BY DEPARTMENT_ID
	ORDER BY cnt;
	
-- 10. 업무명에 'Clerk'이 포함된 업무를 맡은 직원의 수와 평균급여 조회
SELECT JOB_title, count(*) cnt, avg(SALARY) savg
	FROM EMPLOYEES e, JOBS j 
	WHERE e.JOB_ID = j.JOB_ID 
	AND JOB_title LIKE '%Clerk%'
	GROUP BY job_title
	ORDER BY cnt;




-- 1단계 : 사용할 그룹 함수 실행하기
SELECT DEPARTMENT_ID, avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

-- 2단계 : 조인하기
SELECT * FROM DEPARTMENTS d JOIN 
(SELECT DEPARTMENT_ID, avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id;

-- 3단계 : 컬럼 지정하기
SELECT d.department_id, d.department_name,ROUND(tavg.cavg, 1) FROM departments d
JOIN (SELECT DEPARTMENT_ID, avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id ORDER BY tavg.cavg DESC;

-- 4단계 : 정렬한 결과로 특정 위치 지정 : first n 은 상위 n개를 조회
SELECT d.department_id, d.department_name,ROUND(tavg.cavg, 1) "평균급여" FROM departments d
JOIN (SELECT DEPARTMENT_ID, avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id ORDER BY tavg.cavg DESC FETCH FIRST 1 ROWS ONLY ;



	

-- 11. 서브 쿼리 필요한 예시 : 동일한 테이블 대상
-- 최소 급여를 받는 사람의 first_name, last_name 컬럼 조회하기
SELECT first_name, last_name, salary FROM EMPLOYEES e 
WHERE salary = (SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG');


--오라클의 rownum은 가상의 컬럼으로 조회된 결과에 순차적으로 오라클이 부여하는 값입니다. (순서?)
--   가상 ㅅ컬럼 사용을 위해 join이 한 번 더 필요합니다.
SELECT rownum, tcnt.* FROM (SELECT department_id, count(*) cnt FROM EMPLOYEES e 
GROUP BY department_id ORDER BY cnt DESC ) tcnt
WHERE rownum < 5;

SELECT rownum, tcnt.* FROM 
(SELECT department_id, count(*) cnt FROM EMPLOYEES e 
GROUP BY department_id ORDER BY cnt DESC ) tcnt
WHERE rownum = 1;

-- rownum 사용할 때 결과 확인이 안 되는 예시 : rownum 1부터 시작해서 찾아갈 수 있는 조건식만 가능.
-- where rownum = 3;
-- where rownum > 5;
-- 그래서 한번 더 rownum












