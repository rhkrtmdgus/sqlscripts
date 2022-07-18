-- 주제 : 행을 그룹화 합니다. 사용하는 순서는 아래처럼 합니다.
-- select 문
-- [where] 그룹화 하기 전에 사용할 조건식
-- group by 그룹화에 사용할 컬럼명
-- [having] 그룹화 결과에 대한 조건식
-- [order by] 그룹화 결과 정렬할 컬럼명과 방식


SELECT pcode, count(*) FROM TBL_BUY tb GROUP BY pcode;
SELECT pcode, count(*), sum(quantity) FROM TBL_BUY tb GROUP BY pcode
ORDER BY 2;
SELECT pcode, count(*) cnt, sum(quantity) total FROM TBL_BUY tb GROUP BY pcode
ORDER BY cnt;

--그룹화한 후 수량 합계가 3 이상만 조회
SELECT pcode, count(*) cnt, sum(quantity) total FROM TBL_BUY tb GROUP BY pcode
HAVING sum(QUANTITY) >= 3 -- HAVING 에는 별칭 사용 못 함
ORDER BY cnt; -- 그룹함수 결과의 별칭


--구매날짜 2022-04-01 이후인 것만 그룹하여 조회
SELECT pcode, count(*) cnt, sum(quantity) total 
FROM TBL_BUY tb 
WHERE BUY_DATE >= '2022-04-01'
GROUP BY pcode
ORDER BY cnt;





-- 통계함수 : count, avg, max, min, sum 통계함수는 그룹함수라고도 합니다.
--        해당 함수 결과 값을 구하기 위해 특정 컬럼 사용하여 여러 데이터를 그룹화한 후 실행.
