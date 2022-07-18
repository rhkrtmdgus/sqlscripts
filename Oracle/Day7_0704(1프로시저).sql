


-- PL/SQL : Procedure (����, ���� ) ��� , ������ �ܼ��� SQL �� Ȯ��� ��� (SQL�� ����� ���α׷�)


DECLARE   -- ���������  
	--vcustomid varchar2(20);
	--vage number(3,0);
	VAGE TBL_CUSTOM.AGE %TYPE;
BEGIN		--���ν��� ����
-- ���ν��� ���ο��� �ַ� DML ��ɹ����� �ۼ�.(�Բ� �����ؾ��� ���� SQL : Ʈ�����)
	SELECT NAME,age 
	INTO VNAME , vage	-- ���ν��� ����: �˻������ ������ ����
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID ='mina012';		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	
-- �������� �ֿܼ� ���(���ν��� ���)
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || VNAME);
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   -- ���� �̸��� �پ��մϴ�. 
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;



-- ���
CREATE OR REPLACE PROCEDURE search_custom2(	-- ���ν��� �̸� ����
	c_id IN tbl_custom.CUSTOM_ID %TYPE,		-- �Ű����� IN 
	c_name OUT tbl_custom.NAME %TYPE		-- ���ϰ� ���ν��� ��� OUT
)
IS 
	-- �Ϲ� ���� ����
--	vname tbl_custom.name %TYPE;	-- ������ ���̺��� �÷��� ���������� ����
--	vage tbl_custom.age %TYPE;
BEGIN 
	SELECT name
	INTO c_name 	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || c_name);  
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');	
END;