-- ������ ��������
-- csv ������ ������ ���̺�� ��ȯ�� �� �ִ� ���
-- csv ������ ������ �׸��� , �� �����Ͽ� ������ �ؽ�Ʈ �����Դϴ�. ( ���� �Ǵ� �޸��忡�� ���� ����)
-- ���ǻ��� : �ڵ����� �����Ǵ� ���̺� �÷��� ũ�Ⱑ �����ͺ��� ���� �ʰ� �Ǵ� ������ Ÿ������ �����ؾ� ��


-- ANIMAL_INS ���̺� ���� 80187 �� �����Ǹ� SQL ������ ����ӵ� ���̸� Ȯ���� �� �ֽ��ϴ�.
-- ������� ���������� ������ ��


SELECT * FROM ANIMAL_INS ai ORDER BY ANIMAL_ID;
SELECT * FROM ANIMAL_INS ai ORDER BY animal_id;
SELECT * FROM ANIMAL_INS ai ;


SELECT * FROM TBL_BUY tb ;

DELETE FROM TBL_BUY tb WHERE CUSTOM_ID = 'sana97';
DELETE FROM TBL_CUSTOM tc  WHERE CUSTOM_ID = 'sana97';

SELECT * FROM TBL_CUSTOM tc ;

SELECT name, email FROM TBL_CUSTOM WHERE CUSTOM_ID = 'shkwak';


-- 7�� 6�� ����
SELECT * FROM TBL_CUSTOM tc ;

INSERT INTO FROM 