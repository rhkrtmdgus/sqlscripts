-- 테이블 만드는 create table, 데이터 형식 테스트


-- 문자열 타입
-- CHAR(길이) : 고정길이 , 단위는 바이트 
-- VARCHAR(길이) : 오라클에서 존재하지만 사용하지 않는 예비자료형.
-- VARCHAR2(길이) : 가변형길이 단위 바이트, 길이는 최대길이이고 실제로 메모리는 데이터크기만큼 사용합니다.
--				최대 2000바이트입니다. UTF-8 인코딩에서 한글은 3바이트, 영문/숫자/기호는 1바이트


CREATE TABLE tbl_member(
	mno NUMBER,
	name nvarchar2(50),
	email varchar2(100),
	join_date date
);


--1. DML insert 형식 (데이터 행 row 추가) 
--모든 컬럼에 데이터를 저장하는 형식(컬럼명 생략), 날짜는 date 자동 변환
INSERT INTO tbl_member VALUES (1, '김모모', 'momo@naver.com', '2022-03-02');

--일부 컬럼에 데이터를 저장하는 형식 (컬럼명 지정)
INSERT INTO tbl_member (mno, name)  -- 데이터 저장될 컬럼명 나열
VALUES (2, '이나나');

--2. DML SELECT 형식 (데이터 행 row 조회)
--select 조회할 컬럼 목록 from 테이블이름 [where 조건식]; 모든 컬럼은 *로 대체 * : 와일드카드?
SELECT name FROM TBL_MEMBER;
SELECT name, JOIN_DATE FROM TBL_MEMBER;
SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_MEMBER WHERE name = '최다현';
SELECT * FROM TBL_MEMBER WHERE mno > 2;
SELECT * FROM TBL_MEMBER WHERE JOIN_DATE  > '2022-03-03';

--null 값 조회
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NULL;
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NOT NULL;

--문자열의 부분검색 : like 연산
SELECT * FROM TBL_MEMBER tm WHERE NAME LIKE '%다현'; --%는 don't care (다현으로 끝나는)
SELECT * FROM TBL_MEMBER tm WHERE NAME LIKE '다현%'; --다현~ 관련된게 없어서 안 나옴 (다현으로 시작하는)
SELECT * FROM TBL_MEMBER tm WHERE NAME LIKE '%다현%'; -- ~다현~ 앞 뒤로 비슷하게 있어서 나옴

--or 연산 : MNO 값이 1 또는 2 또는 4
SELECT * FROM TBL_MEMBER tm WHERE MNO = 1 OR MNO = 2 OR MNO = 4;

--오라클의 or 대체 연산자 : in (동일 컬럼 한정으로 쓸 때)
SELECT * FROM TBL_MEMBER tm  WHERE MNO IN (1, 2, 4);
SELECT * FROM TBL_MEMBER tm  WHERE MNO NOT IN  (1, 2, 4);
SELECT * FROM TBL_MEMBER tm  WHERE NAME IN  ('김모모', '최다현');
















INSERT INTO TBL_MEMBER 
VALUES (3, '최다현', 'dahy@naver.com', '2022-03-04 16:47'); -- 오류 : 날짜형식으로 자동변환 못함.

--오라클의 to_date 함수는 문자열을 날짜형식으로 변환. (두번째 인자는 패턴)
INSERT INTO TBL_MEMBER
VALUES (3, '최다현', 'dahy@naver.com', to_date('2022-03-04 16:47', 'YYYY-MM-DD HH24:MI'));

--처음 만든 테이블 구조 중 mno 컬럼을 정밀도 5로 축소 변경 (기본 값 null로 수정하고 변경하여야 함)
ALTER TABLE "C##IDEV".TBL_MEMBER MODIFY MNO NUMBER(5,0);

-- to_char 함수 : 날짜형식에서 문자열로 변경합니다. 두번째 인자는 패턴 > 년도 또는 일부 값만 추출에 활용.
SELECT TO_CHAR(JOIN_date, 'yyyy') FROM TBL_MEMBER;

-- 현재 시스템의 날짜와 시간 : sysdate 함수
INSERT INTO TBL_MEMBER VALUES (4, '쯔위', 'aaa@gmail.com', sysdate);

SELECT * FROM TBL_MEMBER;






