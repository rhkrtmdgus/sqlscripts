



--1)도서를 추가합니다. ‘B1102’ , ‘스트라이크 던지기’, ‘박철순’ ,’KBO’ , ‘2020-11-10’’
INSERT INTO TBL_BOOK (bcode, TITLE, WRITER, PUBLISHER, PDATE)
VALUES ('B1102', '스트라이크 던지기', '박철순', 'KBO', '2020-11-10');
--2)반납된 도서의 연체일수를 계산하여 delay_days 컬럼값을 update 합니다.
UPDATE TBL_BOOKRENT SET DELAY_DAYS = RETURN_DATE - EXP_DATE WHERE RETURN_DATE IS NOT NULL;

SELECT * FROM TBL_BOOKRENT tb ;
--3) 대출 중인 도서의 현재 연체 일수 계산해서 회원 IDX, 도서코드, 연체 일수 조회하기.
-- 오늘 날짜 SYSDATE 는 년월일 패턴이 저장되지 않아 그냥하면 LONG값으로 계산됩니다.
SELECT MEM_IDX, BCODE, TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD')) - EXP_DATE FROM TBL_BOOKRENT tb 
WHERE RETURN_DATE IS NOT NULL;

--4) 현재 대출 중인 도서 중 연체인 회원의 이름, 전화번호를 검색합니다. 오늘 날짜 SYSDATE 기준으로 확인하기.
SELECT NAME, TEL FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb ON BM.MEM_IDX = TB.MEM_IDX AND SYSDATE > EXP_DATE
AND RETURN_DATE IS NULL;

--현재 대출중인 도서의 도서명코드와 도서명 검색합니다.
SELECT TB.BCODE, TITLE FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 ON TB.BCODE = TB2.BCODE AND RETURN_DATE IS NULL;

--현재 도서를 대여한 회원의 IDX와 회원이름을 검색합니다.
--현재 연체 중인 도서의 회원IDX, 도서코드, 반납기한을 검색합니다.

-- 7) 대출 중인 도서의 회원이름, 도서명, 반납기한 검색
SELECT NAME, TITLE, EXP_DATE FROM TBL_BOOKRENT tb 
JOIN TBL_BOOK tb2 ON TB.BCODE = TB2.BCODE 
JOIN BOOK_MEMBER bm ON TB.MEM_IDX = BM.MEM_IDX
WHERE RETURN_DATE IS NULL;

--8) 현재 연체 중인 도서의 회원 IDX, 도서코드, 반납기한을 검색합니다.
SELECT MEM_IDX, BCODE, EXP_DATE FROM TBL_BOOKRENT tb WHERE SYSDATE > EXP_DATE;


--회원  IDX ‘10002’는 도서 대출이 가능한지 프로시저를 작성합니다.
--도서명에 ‘스트’ 라는 글자가 들어가는 도서를 검색하여 도서 대출이 가능한지 프로시저를 작성합니다.
--6과 7을 이용해서 insert 를 하는 프로시저를 작성합니다.

-- 9) 회원  IDX '10002'는 도서 대출이 가능한지 프로시저를 작성합니다.
DECLARE 
	VCNT NUMBER;
BEGIN
	SELECT COUNT(*) INTO VCNT
	FROM TBL_BOOKRENT tb 
	WHERE MEM_IDX = 10002 AND RETURN_DATE IS NULL;
	IF (VCNT = 0) THEN
		DBMS_OUTPUT.PUT_LINE('책 대여 가능합니다.');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('대여 중인 책을 반납해야 가능합니다.');
	END IF;
END;


-- 10)도서명에 '스트' 라는 글자가 들어가는 도서를 검색하여 도서 대출이 가능한지 프로시저를 작성합니다.
-- 프로시저 실행하기
	DECLARE
		vresult varchar2(20);
	BEGIN
		check_member(10003,vresult);
		DBMS_OUTPUT.put_line('결과 : ' || vresult);
	END;


-- 10)도서명 '페스트' 라는 도서가 대출이 가능한지 프로시저를 작성합니다. 프로시저이름은 check_book 으로 하세요.
 DECLARE
 	v_bcode varchar2(100);
 	v_cnt NUMBER;
 BEGIN
 	SELECT bcode INTO v_bcode		-- v_bcode는 'A1102'
 		FROM TBL_BOOK tb WHERE title = '페스트';
	SELECT count(*) INTO v_cnt		-- v_cnt 값이 1이면 v_bcode 책은 대출중
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL; 
	 IF (v_cnt = 1) THEN 
		DBMS_OUTPUT.put_line('대여 중인 책 입니다.');
  	ELSE 
		DBMS_OUTPUT.put_line('책 대여 가능합니다.');
  END IF;
 END;
-- 11)9과 10을 이용해서 insert 를 하는 프로시저를 작성합니다.

CREATE OR REPLACE PROCEDURE CHECK_BOOK(
			arg_book IN tbl_book.title%TYPE,	-- 프로시저 실행할때 값을 받을 매개변수
			isOK OUT varchar2		-- 자바의 리턴값에 해당하는 부분.
	)
	IS 
	v_bcode varchar2(100);
 	v_cnt NUMBER;
 BEGIN
 	SELECT bcode INTO v_bcode		-- v_bcode는 'A1102'
 		FROM TBL_BOOK tb WHERE title = arg_book;
	-- 없는 책이름 입력하면 오류. bcode 값이 검색이 안됩니다.-> Exception 
 	SELECT count(*) INTO v_cnt		-- v_cnt 값이 1이면 v_bcode 책은 대출중
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL; 
	 IF (v_cnt = 1) THEN 
		DBMS_OUTPUT.put_line('대여 중인 책 입니다.');
		isOK := 'FALSE' ;
  	 ELSE 
		DBMS_OUTPUT.put_line('책 대여 가능합니다.');
		isOK := 'TRUE' ;
  	 END IF;
  	EXCEPTION		-- 예외(오류)처리
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('찾는 책이 없습니다.');
		isOK :='no match';
  	-- 없는 책은 isOK :='no match';
END;


