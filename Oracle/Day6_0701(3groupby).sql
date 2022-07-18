-- ���� : ���� �׷�ȭ �մϴ�. ����ϴ� ������ �Ʒ�ó�� �մϴ�.
-- select ��
-- [where] �׷�ȭ �ϱ� ���� ����� ���ǽ�
-- group by �׷�ȭ�� ����� �÷���
-- [having] �׷�ȭ ����� ���� ���ǽ�
-- [order by] �׷�ȭ ��� ������ �÷���� ���


SELECT pcode, count(*) FROM TBL_BUY tb GROUP BY pcode;
SELECT pcode, count(*), sum(quantity) FROM TBL_BUY tb GROUP BY pcode
ORDER BY 2;
SELECT pcode, count(*) cnt, sum(quantity) total FROM TBL_BUY tb GROUP BY pcode
ORDER BY cnt;

--�׷�ȭ�� �� ���� �հ谡 3 �̻� ��ȸ
SELECT pcode, count(*) cnt, sum(quantity) total FROM TBL_BUY tb GROUP BY pcode
HAVING sum(QUANTITY) >= 3 -- HAVING ���� ��Ī ��� �� ��
ORDER BY cnt; -- �׷��Լ� ����� ��Ī


--���ų�¥ 2022-04-01 ������ �͸� �׷��Ͽ� ��ȸ
SELECT pcode, count(*) cnt, sum(quantity) total 
FROM TBL_BUY tb 
WHERE BUY_DATE >= '2022-04-01'
GROUP BY pcode
ORDER BY cnt;





-- ����Լ� : count, avg, max, min, sum ����Լ��� �׷��Լ���� �մϴ�.
--        �ش� �Լ� ��� ���� ���ϱ� ���� Ư�� �÷� ����Ͽ� ���� �����͸� �׷�ȭ�� �� ����.
