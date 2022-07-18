-- 데이터 가져오기
-- csv 형식의 파일을 테이블로 변환할 수 있는 기능
-- csv 파일은 데이터 항목을 , 로 구분하여 저장한 텍스트 파일입니다. ( 엑셀 또는 메모장에서 열기 가능)
-- 주의사항 : 자동으로 생성되는 테이블 컬럼의 크기가 데이터보다 작지 않게 또는 적절한 타입으로 설정해야 함


-- ANIMAL_INS 테이블 행이 80187 개 정도되면 SQL 쿼리의 실행속도 차이를 확인할 수 있습니다.
-- 예를들면 서브쿼리와 조인의 비교


SELECT * FROM ANIMAL_INS ai ORDER BY ANIMAL_ID;
SELECT * FROM ANIMAL_INS ai ORDER BY animal_id;
SELECT * FROM ANIMAL_INS ai ;


SELECT * FROM TBL_BUY tb ;

DELETE FROM TBL_BUY tb WHERE CUSTOM_ID = 'sana97';
DELETE FROM TBL_CUSTOM tc  WHERE CUSTOM_ID = 'sana97';

SELECT * FROM TBL_CUSTOM tc ;

SELECT name, email FROM TBL_CUSTOM WHERE CUSTOM_ID = 'shkwak';


-- 7월 6일 수업
SELECT * FROM TBL_CUSTOM tc ;

INSERT INTO FROM 