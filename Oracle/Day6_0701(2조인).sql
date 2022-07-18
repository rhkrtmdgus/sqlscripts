--���� custom_id 'mina012' �� ������ ���� ��ȸ : pcode ��ȸ�ϰ� pname �� �� ����.
SELECT pcode FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012';

--1. �������� (select �ȿ� select �� �����)
SELECT pname FROM TBL_PRODUCT tp WHERE pcode = 
(SELECT pcode FROM TBL_BUY tb WHERE custom_id = 'mina012' AND buy_date = '2022-2-6');

SELECT pname FROM TBL_PRODUCT tp 
WHERE pcode IN (SELECT pcode FROM TBL_BUY tb WHERE custom_id = 'mina012');

-- ���� ���� ������ : �ܺ� ������ ���ǽ��� ��� �࿡ ���� �˻��� ���� �� ���� ������ ����ǹǷ� ó�� �ӵ��� ������ ����
   -- ���̺��� ���� �������� �����մϴ�.


-- 2. SELECT �� ���̺� join : �� �̻��� ���̺� ( �ַ� ���� ������ ���̺�) �� �����Ͽ� �����͸� ��ȸ�ϴ� ���
-- ���� ���� : �� �̻��� ���̺��� ����� �÷��� ���� �� �÷����� (����=) �� �̿��Ͽ� join �մϴ�
-- ���� 1 : select ~~~from ���̺� 1 a, ���̺�2 b where a.���� �÷� 1=b.�����÷�1;

--������ ���� ��ǰ �߰�
INSERT INTO TBL_PRODUCT VALUES ('GALAXY22', 'A1', '������s22', 555600);


SELECT * FROM TBL_PRODUCT tp , TBL_BUY tb  -- ������ ���̺� 2��
WHERE tp.PCODE = tb.PCODE ; --���� ����. ���� �÷����� (=) �����.

-- join Ű���带 ���� ��ɹ� ���� 2 (ansi ǥ��)
SELECT * FROM TBL_PRODUCT tp JOIN TBL_BUY tb ON tp.PCODE = tb.PCODE ;

--������ �׽�Ʈ
--1
SELECT * FROM TBL_CUSTOM tc2 , TBL_BUY tb2 WHERE tc2.CUSTOM_ID = tb2.CUSTOM_ID ;
--2
SELECT * FROM TBL_CUSTOM tc JOIN TBL_BUY tb ON tc.CUSTOM_ID = tb.CUSTOM_ID ;

-- ������ ������� Ư�� �÷��� ��������
SELECT TC.custom_id, name, REG_DATE, pcode, quantity
FROM TBL_CUSTOM tc JOIN TBL_BUY tb ON tc.CUSTOM_ID = tb.CUSTOM_ID ;

--���� ���� ���� �ٸ� ������ �߰�
SELECT TC.custom_id, name, REG_DATE, pcode, quantity
FROM TBL_CUSTOM tc JOIN TBL_BUY tb ON tc.CUSTOM_ID = tb.CUSTOM_ID AND tc.CUSTOM_ID = 'mina012';


--mina012 �� ������ ��ǰ�� �����ΰ� ��ȸ�ϱ�
SELECT tp.pname, tp.price FROM TBL_PRODUCT tp , TBL_BUY tb 
WHERE TP.pcode = tb.PCODE AND custom_id = 'mina012';

SELECT tp.pname FROM TBL_PRODUCT tp JOIN TBL_BUY tb ON tp.PCODE AND custom_id = 'mina012';


-- 3���� ���̺��� ������ �� ��������?, 
SELECT * FROM TBL_PRODUCT tp ,
(SELECT tc.custom_id cusid, name, email, age, reg_date, pcode, quantity, buy_date, buyno FROM 
TBL_CUSTOM tc , TBL_BUY tb WHERE tc.CUSTOM_ID = tb.CUSTOM_ID ) TEMP -- ù��° ����
WHERE tp.PCODE = temp.pcode ; -- �ι�° ����

SELECT * FROM TBL_BUY tb, TBL_CUSTOM tc, TBL_PRODUCT tp WHERE tb.CUSTOM_ID = tc.CUSTOM_ID AND tp.PCODE = tb.PCODE ;




-- 3 �ܺ� ����
SELECT * FROM TBL_PRODUCT tp , TBL_BUY tb  
WHERE tp.PCODE = tb.PCODE(+) ; -- �ܺ� ���� TBL_BUY ���̺� ��ġ�ϴ� pcode ���� ��� ����.


SELECT * FROM TBL_PRODUCT tp LEFT OUTER JOIN TBL_BUY tb 
ON tp.PCODE = tb.PCODE ; -- tbl+product �� ���� ���̺��̸� �� ���� ��� �����Ͽ� ����

SELECT * FROM TBL_BUY tb RIGHT OUTER JOIN TBL_PRODUCT tp 
ON tb.pcode = tp.PCODE ; 



