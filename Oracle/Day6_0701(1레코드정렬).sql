--select �⺻����
--select �÷�1, �÷�2, ... from ���̺�� WHERE �˻� ���ǽ�
--              order by ���� �÷� (�⺻�� ���� : asc , ���� : desc)


SELECT * FROM TBL_BUY tb ; --INSERT ������ ������ ��� ���
SELECT * FROM TBL_CUSTOM tc ;
SELECT * FROM TBL_CUSTOM tc ORDER BY CUSTOM_ID ;
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID  = 'mina012';
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012' 
ORDER BY BUY_DATE DESC ; -- WHERE, ORDER BY ������ ����

-- ��ȸ�� �÷� ������ �� DISTINCT Ű���� : �ߺ����� 1���� ��� ���.
SELECT custom_id FROM TBL_BUY tb ; -- ���� �� id��ȸ
SELECT DISTINCT custom_id FROM TBL_BUY tb ; -- �ߺ� ���� 1���� ���

