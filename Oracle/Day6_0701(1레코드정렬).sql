--select 기본형식
--select 컬럼1, 컬럼2, ... from 테이블명 WHERE 검색 조건식
--              order by 기준 컬럼 (기본은 오름 : asc , 내림 : desc)


SELECT * FROM TBL_BUY tb ; --INSERT 실행한 순서로 결과 출력
SELECT * FROM TBL_CUSTOM tc ;
SELECT * FROM TBL_CUSTOM tc ORDER BY CUSTOM_ID ;
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID  = 'mina012';
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = 'mina012' 
ORDER BY BUY_DATE DESC ; -- WHERE, ORDER BY 순서로 정렬

-- 조회할 컬럼 지정할 때 DISTINCT 키워드 : 중복값은 1번만 결과 출력.
SELECT custom_id FROM TBL_BUY tb ; -- 구매 고객 id조회
SELECT DISTINCT custom_id FROM TBL_BUY tb ; -- 중복 값은 1번만 출력

