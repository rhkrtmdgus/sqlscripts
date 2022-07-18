--예제 custom_id 'mina012' 이 구매한 내용 조회 : pcode 조회하고 pname 알 수 없음.
SELECT pcode FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012';

--1. 서브쿼리 (select 안에 select 를 사용함)
SELECT pname FROM TBL_PRODUCT tp WHERE pcode = 
(SELECT pcode FROM TBL_BUY tb WHERE custom_id = 'mina012' AND buy_date = '2022-2-6');

SELECT pname FROM TBL_PRODUCT tp 
WHERE pcode IN (SELECT pcode FROM TBL_BUY tb WHERE custom_id = 'mina012');

-- 서브 쿼리 문제점 : 외부 쿼리가 조건식을 모든 행에 대해 검사할 때만 다 내부 쿼리가 실행되므로 처리 속도에 문제가 생김
   -- 테이블의 조인 연산으로 개선합니다.


-- 2. SELECT 의 테이블 join : 둘 이상의 테이블 ( 주로 참조 관계의 테이블) 을 연결하여 데이터를 조회하는 명령
-- 동등 조인 : 둘 이상의 테이블은 공통된 컬럼을 갖고 이 컬럼값이 (같다=) 를 이용하여 join 합니다
-- 형식 1 : select ~~~from 테이블 1 a, 테이블2 b where a.공통 컬럼 1=b.공통컬럼1;

--예제를 위해 상품 추가
INSERT INTO TBL_PRODUCT VALUES ('GALAXY22', 'A1', '갤럭시s22', 555600);


SELECT * FROM TBL_PRODUCT tp , TBL_BUY tb  -- 조인할 테이블 2개
WHERE tp.PCODE = tb.PCODE ; --동등 조인. 조인 컬럼으로 (=) 연산식.

-- join 키워드를 쓰는 명령문 형식 2 (ansi 표준)
SELECT * FROM TBL_PRODUCT tp JOIN TBL_BUY tb ON tp.PCODE = tb.PCODE ;

--간단한 테스트
--1
SELECT * FROM TBL_CUSTOM tc2 , TBL_BUY tb2 WHERE tc2.CUSTOM_ID = tb2.CUSTOM_ID ;
--2
SELECT * FROM TBL_CUSTOM tc JOIN TBL_BUY tb ON tc.CUSTOM_ID = tb.CUSTOM_ID ;

-- 조인한 결과에서 특정 컬럼만 가져오기
SELECT TC.custom_id, name, REG_DATE, pcode, quantity
FROM TBL_CUSTOM tc JOIN TBL_BUY tb ON tc.CUSTOM_ID = tb.CUSTOM_ID ;

--조인 조건 외의 다른 조건을 추가
SELECT TC.custom_id, name, REG_DATE, pcode, quantity
FROM TBL_CUSTOM tc JOIN TBL_BUY tb ON tc.CUSTOM_ID = tb.CUSTOM_ID AND tc.CUSTOM_ID = 'mina012';


--mina012 가 구매한 상품이 무엇인가 조회하기
SELECT tp.pname, tp.price FROM TBL_PRODUCT tp , TBL_BUY tb 
WHERE TP.pcode = tb.PCODE AND custom_id = 'mina012';

SELECT tp.pname FROM TBL_PRODUCT tp JOIN TBL_BUY tb ON tp.PCODE AND custom_id = 'mina012';


-- 3개의 테이블을 조인할 수 있을가요?, 
SELECT * FROM TBL_PRODUCT tp ,
(SELECT tc.custom_id cusid, name, email, age, reg_date, pcode, quantity, buy_date, buyno FROM 
TBL_CUSTOM tc , TBL_BUY tb WHERE tc.CUSTOM_ID = tb.CUSTOM_ID ) TEMP -- 첫번째 조인
WHERE tp.PCODE = temp.pcode ; -- 두번째 조인

SELECT * FROM TBL_BUY tb, TBL_CUSTOM tc, TBL_PRODUCT tp WHERE tb.CUSTOM_ID = tc.CUSTOM_ID AND tp.PCODE = tb.PCODE ;




-- 3 외부 조인
SELECT * FROM TBL_PRODUCT tp , TBL_BUY tb  
WHERE tp.PCODE = tb.PCODE(+) ; -- 외부 조인 TBL_BUY 테이블에 일치하는 pcode 값이 없어도 조인.


SELECT * FROM TBL_PRODUCT tp LEFT OUTER JOIN TBL_BUY tb 
ON tp.PCODE = tb.PCODE ; -- tbl+product 가 왼쪽 테이블이며 그 값을 모두 포함하여 조인

SELECT * FROM TBL_BUY tb RIGHT OUTER JOIN TBL_PRODUCT tp 
ON tb.pcode = tp.PCODE ; 



