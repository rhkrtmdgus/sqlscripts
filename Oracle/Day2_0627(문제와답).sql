/*
1. hire_date�� 2006�� 1�� 1�� ������ ������ �̸�,��,�̸���

2. lastname�� 'Jones' �� ������ ��� �÷�

3. salary �� 5000 �̻��� ������ �̸�,��,JOB_ID ��ȸ

4. JOB_ID �� ACCOUNT �� ���� ������ �̸�,��,salary ��ȸ

5. �μ�_ID �� 50 ,60, 80,90 �� ������ ����_ID, �̸�,�� ��ȸ
*/


SELECT * FROM EMPLOYEES e WHERE HIRE_DATE < '2006-01-01';
SELECT * FROM EMPLOYEES e WHERE LAST_NAME = 'Jones';

--��ҹ��� �˻�� ���ǽĿ� �����ؾ� �մϴ�.
--�÷� ���� ��ҹ��� ��ȯ �� ���� �� �� > ��ҹ��� �����ϰ� �˻��ϴ� ���
SELECT * FROM EMPLOYEES e WHERE UPPER(LAST_NAME) = 'Jones';
SELECT * FROM EMPLOYEES e WHERE LOWER(LAST_NAME) = 'Jones';


SELECT * FROM EMPLOYEES e WHERE SALARY >= 5000;
SELECT * FROM EMPLOYEES e WHERE JOB_ID LIKE '%ACCOUNT%';
SELECT * FROM EMPLOYEES e WHERE DEPARTMENT_ID IN (50, 60, 80, 90);

SELECT  * FROM EMPLOYEES e WHERE DEPARTMENT_ID = '60'; --�÷� ���Ŀ� ���� number�� ��ȯ?

--����Լ� : count, avg, max, min / ��� �Լ��� �׷� �Լ���� �մϴ�.
         -- �ش� �Լ� ��� ���� ���ϱ� ���� Ư�� �÷� ����Ͽ� ���� �����͸� �׷�ȭ�� �� ����
SELECT COUNT(*) FROM EMPLOYEES e ;   -- ���̺� ��ü ������ ���� : 107
SELECT MAX(salary) FROM EMPLOYEES e ; -- salary �÷��� �ִ밪 : 24000
SELECT MIN(salary) FROM EMPLOYEES e ; -- salary �÷��� �ּҰ� : 2100
SELECT AVG(salary) FROM EMPLOYEES e ; -- ��հ�  
SELECT SUM(salary) FROM EMPLOYEES e ; -- �հ� 

--�� 5�� ����Լ��� job_id = 'it_prog' ���� ���ǽ����� �Ȱ��� ������ ����

SELECT COUNT(*) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT AVG(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT SUM(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';


SELECT JOB_ID, COUNT(*) FROM EMPLOYEES e 
WHERE JOB_ID = 'IT_PROG'; -- ���� : ���� �׷��� �׷� �Լ��� �ƴմϴ�.

-- ������ ��� : create table, insert into, select ~ where ~ �⺻ ����
-- ���� : ��Ī (alias)
SELECT * FROM EMPLOYEES e ;  -- EMPLOYEES ���̺��� ��Ī e
SELECT * FROM DEPARTMENTS d ; -- DEPARTMENT ���̺��� ��Ī d 
-- �������� ���� ��Ī�� �ʿ�����ϴ�. 




