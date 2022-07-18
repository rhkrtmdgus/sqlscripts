--제약 조건 설정은 create table, alter table : ddl 에서 합니다.

-- 제약 조건 1) not null : not null이 포함된 컬럼에는 반드시 값을 같이 넣어줘야 함

CREATE TABLE tb1# (
	col1 varchar2(10),
	col2 number(3) NOT NULL
);

INSERT INTO tb1#(col2) VALUES (98);
INSERT INTO tb1#(col1) VALUES ('korean');
INSERT INTO tb1# VALUES ('korean', 78);
INSERT INTO tb1# VALUES ('korean', 88);

-- 확인
SELECT * FROM tb1#; 

-- 새로운 제약 조건 2) unique 를 갖는 col3
ALTER TABLE tb1# ADD col3 varchar2(10) UNIQUE; -- 유일한 값이어야 함

--INSERT (unique : 같은 값으로 인설트할 수 없음-)
INSERT INTO tb1#(col1) VALUES ('english');
INSERT INTO tb1#(col2) VALUES (77);
INSERT INTO tb1#(col3) VALUES ('english');
INSERT INTO tb1#(col1, col2) VALUES ('english', 88);
INSERT INTO tb1#(col2, col3) VALUES (88, 'science');
INSERT INTO tb1#(col1, col3) VALUES ('science', 88);
INSERT INTO tb1#(col1, col2, col3) VALUES ('english', 89, 'math');


-- 체크사항 : unique 컬럼에는 null 허용 됩니다.

-- 제약 조건 3) 기본키 (primary key)는 not null과 unique 제약조건입니다.

CREATE TABLE tbl2# (
	tno NUMBER(3) PRIMARY KEY,
	tid NUMBER(3) UNIQUE 
);

INSERT INTO tbl2#(tno) VALUES (123);
--무결성 제약 조건 (primary 기본키 컬럼은 유일한 값이면서 not null 입니다.)
INSERT INTO tbl2#(tno) VALUES (123);
INSERT INTO tbl2#(tid) VALUES (123);
SELECT * FROM tbl2#;

--제약조건 4) check : 컬럼 값의 범위를 설정 >> age 컬럼 값은 16~ 80
ALTER TABLE TBL2# ADD age number(3) CHECK (age BETWEEN 16 AND 80);
INSERT INTO TBL2# (tno, tid, age) VALUES (222, 123, 20);
INSERT INTO TBL2# (tno, tid, age) VALUES (222, 123, 90); -- age 범위 벗어나서 오류

ALTER TABLE tbl2# ADD gender char(1) CHECK (gender IN ('M', 'F'));
INSERT INTO TBL2# (tno, GENDER) VALUES (224, 'F');
INSERT INTO TBL2# (tno, GENDER) VALUES (225, 'M');
INSERT INTO TBL2# (tno, GENDER) VALUES (226, 'm');
SELECT * FROM tbl2#;

ALTER TABLE tbl2# ADD CONSTRAINT tbl2_chk_gender2 CHECK (gender IN ('m', 'f', 'M', 'F'));
INSERT INTO "TBL2#" (tno, GENDER) VALUES (228, 'm');
INSERT INTO "TBL2#" (tno, GENDER) VALUES (229, 'f');
SELECT * FROM "TBL2#" t ;


