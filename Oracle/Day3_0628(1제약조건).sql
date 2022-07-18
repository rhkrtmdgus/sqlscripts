--���� ���� ������ create table, alter table : ddl ���� �մϴ�.

-- ���� ���� 1) not null : not null�� ���Ե� �÷����� �ݵ�� ���� ���� �־���� ��

CREATE TABLE tb1# (
	col1 varchar2(10),
	col2 number(3) NOT NULL
);

INSERT INTO tb1#(col2) VALUES (98);
INSERT INTO tb1#(col1) VALUES ('korean');
INSERT INTO tb1# VALUES ('korean', 78);
INSERT INTO tb1# VALUES ('korean', 88);

-- Ȯ��
SELECT * FROM tb1#; 

-- ���ο� ���� ���� 2) unique �� ���� col3
ALTER TABLE tb1# ADD col3 varchar2(10) UNIQUE; -- ������ ���̾�� ��

--INSERT (unique : ���� ������ �μ�Ʈ�� �� ����-)
INSERT INTO tb1#(col1) VALUES ('english');
INSERT INTO tb1#(col2) VALUES (77);
INSERT INTO tb1#(col3) VALUES ('english');
INSERT INTO tb1#(col1, col2) VALUES ('english', 88);
INSERT INTO tb1#(col2, col3) VALUES (88, 'science');
INSERT INTO tb1#(col1, col3) VALUES ('science', 88);
INSERT INTO tb1#(col1, col2, col3) VALUES ('english', 89, 'math');


-- üũ���� : unique �÷����� null ��� �˴ϴ�.

-- ���� ���� 3) �⺻Ű (primary key)�� not null�� unique ���������Դϴ�.

CREATE TABLE tbl2# (
	tno NUMBER(3) PRIMARY KEY,
	tid NUMBER(3) UNIQUE 
);

INSERT INTO tbl2#(tno) VALUES (123);
--���Ἲ ���� ���� (primary �⺻Ű �÷��� ������ ���̸鼭 not null �Դϴ�.)
INSERT INTO tbl2#(tno) VALUES (123);
INSERT INTO tbl2#(tid) VALUES (123);
SELECT * FROM tbl2#;

--�������� 4) check : �÷� ���� ������ ���� >> age �÷� ���� 16~ 80
ALTER TABLE TBL2# ADD age number(3) CHECK (age BETWEEN 16 AND 80);
INSERT INTO TBL2# (tno, tid, age) VALUES (222, 123, 20);
INSERT INTO TBL2# (tno, tid, age) VALUES (222, 123, 90); -- age ���� ����� ����

ALTER TABLE tbl2# ADD gender char(1) CHECK (gender IN ('M', 'F'));
INSERT INTO TBL2# (tno, GENDER) VALUES (224, 'F');
INSERT INTO TBL2# (tno, GENDER) VALUES (225, 'M');
INSERT INTO TBL2# (tno, GENDER) VALUES (226, 'm');
SELECT * FROM tbl2#;

ALTER TABLE tbl2# ADD CONSTRAINT tbl2_chk_gender2 CHECK (gender IN ('m', 'f', 'M', 'F'));
INSERT INTO "TBL2#" (tno, GENDER) VALUES (228, 'm');
INSERT INTO "TBL2#" (tno, GENDER) VALUES (229, 'f');
SELECT * FROM "TBL2#" t ;


