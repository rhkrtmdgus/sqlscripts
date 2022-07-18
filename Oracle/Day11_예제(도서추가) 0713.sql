



--1)������ �߰��մϴ�. ��B1102�� , ����Ʈ����ũ �����⡯, ����ö���� ,��KBO�� , ��2020-11-10����
INSERT INTO TBL_BOOK (bcode, TITLE, WRITER, PUBLISHER, PDATE)
VALUES ('B1102', '��Ʈ����ũ ������', '��ö��', 'KBO', '2020-11-10');
--2)�ݳ��� ������ ��ü�ϼ��� ����Ͽ� delay_days �÷����� update �մϴ�.
UPDATE TBL_BOOKRENT SET DELAY_DAYS = RETURN_DATE - EXP_DATE WHERE RETURN_DATE IS NOT NULL;

SELECT * FROM TBL_BOOKRENT tb ;
--3) ���� ���� ������ ���� ��ü �ϼ� ����ؼ� ȸ�� IDX, �����ڵ�, ��ü �ϼ� ��ȸ�ϱ�.
-- ���� ��¥ SYSDATE �� ����� ������ ������� �ʾ� �׳��ϸ� LONG������ ���˴ϴ�.
SELECT MEM_IDX, BCODE, TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD')) - EXP_DATE FROM TBL_BOOKRENT tb 
WHERE RETURN_DATE IS NOT NULL;

--4) ���� ���� ���� ���� �� ��ü�� ȸ���� �̸�, ��ȭ��ȣ�� �˻��մϴ�. ���� ��¥ SYSDATE �������� Ȯ���ϱ�.
SELECT NAME, TEL FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb ON BM.MEM_IDX = TB.MEM_IDX AND SYSDATE > EXP_DATE
AND RETURN_DATE IS NULL;

--���� �������� ������ �������ڵ�� ������ �˻��մϴ�.
SELECT TB.BCODE, TITLE FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 ON TB.BCODE = TB2.BCODE AND RETURN_DATE IS NULL;

--���� ������ �뿩�� ȸ���� IDX�� ȸ���̸��� �˻��մϴ�.
--���� ��ü ���� ������ ȸ��IDX, �����ڵ�, �ݳ������� �˻��մϴ�.

-- 7) ���� ���� ������ ȸ���̸�, ������, �ݳ����� �˻�
SELECT NAME, TITLE, EXP_DATE FROM TBL_BOOKRENT tb 
JOIN TBL_BOOK tb2 ON TB.BCODE = TB2.BCODE 
JOIN BOOK_MEMBER bm ON TB.MEM_IDX = BM.MEM_IDX
WHERE RETURN_DATE IS NULL;

--8) ���� ��ü ���� ������ ȸ�� IDX, �����ڵ�, �ݳ������� �˻��մϴ�.
SELECT MEM_IDX, BCODE, EXP_DATE FROM TBL_BOOKRENT tb WHERE SYSDATE > EXP_DATE;


--ȸ��  IDX ��10002���� ���� ������ �������� ���ν����� �ۼ��մϴ�.
--������ ����Ʈ�� ��� ���ڰ� ���� ������ �˻��Ͽ� ���� ������ �������� ���ν����� �ۼ��մϴ�.
--6�� 7�� �̿��ؼ� insert �� �ϴ� ���ν����� �ۼ��մϴ�.

-- 9) ȸ��  IDX '10002'�� ���� ������ �������� ���ν����� �ۼ��մϴ�.
DECLARE 
	VCNT NUMBER;
BEGIN
	SELECT COUNT(*) INTO VCNT
	FROM TBL_BOOKRENT tb 
	WHERE MEM_IDX = 10002 AND RETURN_DATE IS NULL;
	IF (VCNT = 0) THEN
		DBMS_OUTPUT.PUT_LINE('å �뿩 �����մϴ�.');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
	END IF;
END;


-- 10)������ '��Ʈ' ��� ���ڰ� ���� ������ �˻��Ͽ� ���� ������ �������� ���ν����� �ۼ��մϴ�.
-- ���ν��� �����ϱ�
	DECLARE
		vresult varchar2(20);
	BEGIN
		check_member(10003,vresult);
		DBMS_OUTPUT.put_line('��� : ' || vresult);
	END;


-- 10)������ '�佺Ʈ' ��� ������ ������ �������� ���ν����� �ۼ��մϴ�. ���ν����̸��� check_book ���� �ϼ���.
 DECLARE
 	v_bcode varchar2(100);
 	v_cnt NUMBER;
 BEGIN
 	SELECT bcode INTO v_bcode		-- v_bcode�� 'A1102'
 		FROM TBL_BOOK tb WHERE title = '�佺Ʈ';
	SELECT count(*) INTO v_cnt		-- v_cnt ���� 1�̸� v_bcode å�� ������
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL; 
	 IF (v_cnt = 1) THEN 
		DBMS_OUTPUT.put_line('�뿩 ���� å �Դϴ�.');
  	ELSE 
		DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
  END IF;
 END;
-- 11)9�� 10�� �̿��ؼ� insert �� �ϴ� ���ν����� �ۼ��մϴ�.

CREATE OR REPLACE PROCEDURE CHECK_BOOK(
			arg_book IN tbl_book.title%TYPE,	-- ���ν��� �����Ҷ� ���� ���� �Ű�����
			isOK OUT varchar2		-- �ڹ��� ���ϰ��� �ش��ϴ� �κ�.
	)
	IS 
	v_bcode varchar2(100);
 	v_cnt NUMBER;
 BEGIN
 	SELECT bcode INTO v_bcode		-- v_bcode�� 'A1102'
 		FROM TBL_BOOK tb WHERE title = arg_book;
	-- ���� å�̸� �Է��ϸ� ����. bcode ���� �˻��� �ȵ˴ϴ�.-> Exception 
 	SELECT count(*) INTO v_cnt		-- v_cnt ���� 1�̸� v_bcode å�� ������
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL; 
	 IF (v_cnt = 1) THEN 
		DBMS_OUTPUT.put_line('�뿩 ���� å �Դϴ�.');
		isOK := 'FALSE' ;
  	 ELSE 
		DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
		isOK := 'TRUE' ;
  	 END IF;
  	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� å�� �����ϴ�.');
		isOK :='no match';
  	-- ���� å�� isOK :='no match';
END;


