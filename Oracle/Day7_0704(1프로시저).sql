


-- PL/SQL : Procedure (절차, 순서 ) 언어 , 기존의 단순한 SQL 이 확장된 언어 (SQL로 만드는 프로그램)


DECLARE   -- 변수선언부  
	--vcustomid varchar2(20);
	--vage number(3,0);
	VAGE TBL_CUSTOM.AGE %TYPE;
BEGIN		--프로시저 시작
-- 프로시저 내부에는 주로 DML 명령문들을 작성.(함께 실행해야할 여러 SQL : 트랜잭션)
	SELECT NAME,age 
	INTO VNAME , vage	-- 프로시저 구문: 검색결과를 변수에 저장
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID ='mina012';		-- 1개 행만 결과 조회되는 조건
	
-- 변수값을 콘솔에 출력(프로시저 명령)
	DBMS_OUTPUT.PUT_LINE('고객이름 : ' || VNAME);
	DBMS_OUTPUT.PUT_LINE('고객나이 : ' || vage);
	EXCEPTION		-- 예외(오류)처리
	WHEN no_data_found THEN   -- 예외 이름은 다양합니다. 
		DBMS_OUTPUT.PUT_LINE('찾는 데이터가 없습니다.');
END;



-- 출력
CREATE OR REPLACE PROCEDURE search_custom2(	-- 프로시저 이름 설정
	c_id IN tbl_custom.CUSTOM_ID %TYPE,		-- 매개변수 IN 
	c_name OUT tbl_custom.NAME %TYPE		-- 리턴값 프로시저 출력 OUT
)
IS 
	-- 일반 변수 선언
--	vname tbl_custom.name %TYPE;	-- 지정된 테이블의 컬럼과 동일형식의 변수
--	vage tbl_custom.age %TYPE;
BEGIN 
	SELECT name
	INTO c_name 	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;		-- 1개 행만 결과 조회되는 조건
	
	DBMS_OUTPUT.PUT_LINE('고객이름 : ' || c_name);  
	EXCEPTION		-- 예외(오류)처리
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('찾는 데이터가 없습니다.');	
END;