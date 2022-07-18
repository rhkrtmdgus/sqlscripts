-- ���̺� ����� create table, ������ ���� �׽�Ʈ


-- ���ڿ� Ÿ��
-- CHAR(����) : �������� , ������ ����Ʈ 
-- VARCHAR(����) : ����Ŭ���� ���������� ������� �ʴ� �����ڷ���.
-- VARCHAR2(����) : ���������� ���� ����Ʈ, ���̴� �ִ�����̰� ������ �޸𸮴� ������ũ�⸸ŭ ����մϴ�.
--				�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ


CREATE TABLE tbl_member(
	mno NUMBER,
	name nvarchar2(50),
	email varchar2(100),
	join_date date
);


--1. DML insert ���� (������ �� row �߰�) 
--��� �÷��� �����͸� �����ϴ� ����(�÷��� ����), ��¥�� date �ڵ� ��ȯ
INSERT INTO tbl_member VALUES (1, '����', 'momo@naver.com', '2022-03-02');

--�Ϻ� �÷��� �����͸� �����ϴ� ���� (�÷��� ����)
INSERT INTO tbl_member (mno, name)  -- ������ ����� �÷��� ����
VALUES (2, '�̳���');

--2. DML SELECT ���� (������ �� row ��ȸ)
--select ��ȸ�� �÷� ��� from ���̺��̸� [where ���ǽ�]; ��� �÷��� *�� ��ü * : ���ϵ�ī��?
SELECT name FROM TBL_MEMBER;
SELECT name, JOIN_DATE FROM TBL_MEMBER;
SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_MEMBER WHERE name = '�ִ���';
SELECT * FROM TBL_MEMBER WHERE mno > 2;
SELECT * FROM TBL_MEMBER WHERE JOIN_DATE  > '2022-03-03';

--null �� ��ȸ
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NULL;
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NOT NULL;

--���ڿ��� �κа˻� : like ����
SELECT * FROM TBL_MEMBER tm WHERE NAME LIKE '%����'; --%�� don't care (�������� ������)
SELECT * FROM TBL_MEMBER tm WHERE NAME LIKE '����%'; --����~ ���õȰ� ��� �� ���� (�������� �����ϴ�)
SELECT * FROM TBL_MEMBER tm WHERE NAME LIKE '%����%'; -- ~����~ �� �ڷ� ����ϰ� �־ ����

--or ���� : MNO ���� 1 �Ǵ� 2 �Ǵ� 4
SELECT * FROM TBL_MEMBER tm WHERE MNO = 1 OR MNO = 2 OR MNO = 4;

--����Ŭ�� or ��ü ������ : in (���� �÷� �������� �� ��)
SELECT * FROM TBL_MEMBER tm  WHERE MNO IN (1, 2, 4);
SELECT * FROM TBL_MEMBER tm  WHERE MNO NOT IN  (1, 2, 4);
SELECT * FROM TBL_MEMBER tm  WHERE NAME IN  ('����', '�ִ���');
















INSERT INTO TBL_MEMBER 
VALUES (3, '�ִ���', 'dahy@naver.com', '2022-03-04 16:47'); -- ���� : ��¥�������� �ڵ���ȯ ����.

--����Ŭ�� to_date �Լ��� ���ڿ��� ��¥�������� ��ȯ. (�ι�° ���ڴ� ����)
INSERT INTO TBL_MEMBER
VALUES (3, '�ִ���', 'dahy@naver.com', to_date('2022-03-04 16:47', 'YYYY-MM-DD HH24:MI'));

--ó�� ���� ���̺� ���� �� mno �÷��� ���е� 5�� ��� ���� (�⺻ �� null�� �����ϰ� �����Ͽ��� ��)
ALTER TABLE "C##IDEV".TBL_MEMBER MODIFY MNO NUMBER(5,0);

-- to_char �Լ� : ��¥���Ŀ��� ���ڿ��� �����մϴ�. �ι�° ���ڴ� ���� > �⵵ �Ǵ� �Ϻ� ���� ���⿡ Ȱ��.
SELECT TO_CHAR(JOIN_date, 'yyyy') FROM TBL_MEMBER;

-- ���� �ý����� ��¥�� �ð� : sysdate �Լ�
INSERT INTO TBL_MEMBER VALUES (4, '����', 'aaa@gmail.com', sysdate);

SELECT * FROM TBL_MEMBER;






