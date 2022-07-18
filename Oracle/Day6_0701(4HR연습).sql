-- ���ΰ� GROUP BY �� �����ؼ� SELECT �� �˻��ϴ� ������ 10�� �����

-- GROUP BY ����ε� ������ �� �� �ֽ��ϴ�. �μ��ο��� ���� ���� �μ���? 5�� 30�б��� �����ϼ���

-- �ּ����� �˻��ϴ� ���뾲�� 
-- SELECT ���� �ۼ��ϼ���.


-- 1. ���� ID�� JP�̰� ���� ID ����
SELECT LOCATION_ID, count(*) cnt 
FROM LOCATIONS l
WHERE COUNTRY_ID = 'US'
GROUP BY LOCATION_ID
ORDER BY cnt;

-- 2. �޿��� 10000�̻��� ������ ���� �μ��� �Ŵ��� ID��ȸ
SELECT e.MANAGER_ID FROM EMPLOYEES e , DEPARTMENTS d 
	WHERE e.MANAGER_ID = d.MANAGER_ID AND SALARY >= 10000;

-- 3. DEPARTMENT_ID�� 90�� ������ EMPLOYEE_ID, PHONE_NUMBER, MANAGER_ID ��ȸ�ϱ�
SELECT EMPLOYEE_ID, PHONE_NUMBER, D.MANAGER_ID FROM EMPLOYEES e, DEPARTMENTS d
	WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
	AND D.DEPARTMENT_ID = 90;

-- 4. JOB_TITLE�� Stock Clerk�� ������� ��, �̸�, ���� ��ȸ
SELECT j.JOB_TITLE, e.JOB_ID, e.FIRST_NAME, e.LAST_NAME, e.SALARY 
FROM EMPLOYEES e JOIN JOBS j ON e.JOB_ID = j.JOB_ID AND e.JOB_ID = 'ST_CLERK';

-- 5. �� �μ��� �ο���
SELECT DEPARTMENT_ID, COUNT(*) 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID;

-- 6. �� �μ��� �ְ� ����.
SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID;


-- 7. JOB_TITLE�� Accountant�� ������� ��, �̸�, ��ȭ��ȣ ��ȸ
SELECT j.JOB_TITLE, e.JOB_ID, e.FIRST_NAME, e.LAST_NAME, e.PHONE_NUMBER 
FROM EMPLOYEES e JOIN JOBS j ON e.JOB_ID = j.JOB_ID AND e.JOB_ID = 'FI_ACCOUNT';

-- 8. JOB_TITLE�� Marketing Manager�� ����� ��, �̸�, �̸��� ��ȸ
SELECT j.JOB_TITLE, e.JOB_ID, e.FIRST_NAME, e.LAST_NAME, e.EMAIL 
FROM EMPLOYEES e JOIN JOBS j ON e.JOB_ID = j.JOB_ID AND e.JOB_ID = 'MK_MAN'

-- 9. �޿��� 3000������ �������� �μ�ID�� �׷�ȭ�Ͽ� �ش� �μ��� ���� �� ��ȸ
SELECT DEPARTMENT_ID, count(*) cnt
	FROM EMPLOYEES e 
	WHERE SALARY <= 3000
	GROUP BY DEPARTMENT_ID
	ORDER BY cnt;
	
-- 10. ������ 'Clerk'�� ���Ե� ������ ���� ������ ���� ��ձ޿� ��ȸ
SELECT JOB_title, count(*) cnt, avg(SALARY) savg
	FROM EMPLOYEES e, JOBS j 
	WHERE e.JOB_ID = j.JOB_ID 
	AND JOB_title LIKE '%Clerk%'
	GROUP BY job_title
	ORDER BY cnt;




-- 1�ܰ� : ����� �׷� �Լ� �����ϱ�
SELECT DEPARTMENT_ID, avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID ;

-- 2�ܰ� : �����ϱ�
SELECT * FROM DEPARTMENTS d JOIN 
(SELECT DEPARTMENT_ID, avg(salary) FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id;

-- 3�ܰ� : �÷� �����ϱ�
SELECT d.department_id, d.department_name,ROUND(tavg.cavg, 1) FROM departments d
JOIN (SELECT DEPARTMENT_ID, avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id ORDER BY tavg.cavg DESC;

-- 4�ܰ� : ������ ����� Ư�� ��ġ ���� : first n �� ���� n���� ��ȸ
SELECT d.department_id, d.department_name,ROUND(tavg.cavg, 1) "��ձ޿�" FROM departments d
JOIN (SELECT DEPARTMENT_ID, avg(salary) cavg FROM EMPLOYEES e GROUP BY DEPARTMENT_ID) tavg
ON d.DEPARTMENT_ID = tavg.department_id ORDER BY tavg.cavg DESC FETCH FIRST 1 ROWS ONLY ;



	

-- 11. ���� ���� �ʿ��� ���� : ������ ���̺� ���
-- �ּ� �޿��� �޴� ����� first_name, last_name �÷� ��ȸ�ϱ�
SELECT first_name, last_name, salary FROM EMPLOYEES e 
WHERE salary = (SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG');


--����Ŭ�� rownum�� ������ �÷����� ��ȸ�� ����� ���������� ����Ŭ�� �ο��ϴ� ���Դϴ�. (����?)
--   ���� ���÷� ����� ���� join�� �� �� �� �ʿ��մϴ�.
SELECT rownum, tcnt.* FROM (SELECT department_id, count(*) cnt FROM EMPLOYEES e 
GROUP BY department_id ORDER BY cnt DESC ) tcnt
WHERE rownum < 5;

SELECT rownum, tcnt.* FROM 
(SELECT department_id, count(*) cnt FROM EMPLOYEES e 
GROUP BY department_id ORDER BY cnt DESC ) tcnt
WHERE rownum = 1;

-- rownum ����� �� ��� Ȯ���� �� �Ǵ� ���� : rownum 1���� �����ؼ� ã�ư� �� �ִ� ���ǽĸ� ����.
-- where rownum = 3;
-- where rownum > 5;
-- �׷��� �ѹ� �� rownum












