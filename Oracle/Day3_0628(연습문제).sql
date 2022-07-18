

CREATE TABLE students(
	Student_number varchar2(7),
	Name varchar2(9) NOT NULL,
	Age number(3),
	Address nvarchar2(3)
);

DROP TABLE students;

INSERT INTO STUDENTS(student_number, name, age, ADDRESS) VALUES ('2021001', '김모모', 16, '서초구');
INSERT INTO STUDENTS(student_number, name, age, ADDRESS) VALUES ('2019019', '강다현', 18, '강남구');

 

CREATE TABLE scores(
	Student_number varchar2(7) NOT null,
	Subject_name varchar2(9) NOT null,
	score number(3) NOT null,
	teacher varchar2(9) NOT null,
	semester varchar2(6) NOT null
);

INSERT INTO scores(student_number, subject_name, score, teacher, semester) VALUES ('2021001', '국어', 89, '이나연', '2022_1');
INSERT INTO scores(student_number, subject_name, score, teacher, semester) VALUES ('2021001', '영어', 78, '김길동', '2022_1');
INSERT INTO scores(student_number, subject_name, score, teacher, semester) VALUES ('2021001', '과학', 67, '박세리', '2021_2');
INSERT INTO scores(student_number, subject_name, score, teacher, semester) VALUES ('2019019', '국어', 92, '이나연', '2019_2');
INSERT INTO scores(student_number, subject_name, score, teacher, semester) VALUES ('2019019', '영어', 85, '박지성', '2019_2');
INSERT INTO scores(student_number, subject_name, score, teacher, semester) VALUES ('2019019', '과학', 88, '박세리', '2020_1');










CREATE TABLE students0(
   stuno char(7) PRIMARY KEY,
   name nvarchar2(20) NOT NULL,
   age number(3) CHECK (age BETWEEN 10 AND 30),
   address nvarchar2(50)
);

INSERT INTO students0(stuno,name,age,address)
VALUES ('2021001','김모모',16,'서초구');
INSERT INTO students0(stuno,name,age,address)
VALUES ('2019019','강다현',18,'강남구');

CREATE TABLE scores0(
   stuno char(7) NOT NULL,
   subject nvarchar2(20) NOT NULL,
   jumsu number(3) NOT NULL,   -- 점수
   teacher nvarchar2(20) NOT NULL,
   term char(6) NOT NULL,   -- 학기
   PRIMARY KEY (stuno,subject), -- 기본키 설정 (not null, unique)
   FOREIGN KEY (stuno) REFERENCES students0(stuno)
   -- ㄴ 해석 : 현재 score 테이블의 stuno 는 students 의 stuno를 참조 받는다. ??
   -- 외래키 설정 refrences(참조) 키위드 뒤에 참조 테이블 (참조컬럼)
   -- 외래키 컬럼은 foreign key 키워드 뒤에 ()안에 작성.
   -- 검색해 보세요. 참조컬럼의 조건은?
);

INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','국어',89,'이나연','2022_1');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','영어',78,'김길동','2022_1');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','과학',67,'박세리','2021_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','국어',92,'이나연','2019_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','영어',85,'박지성','2019_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','과학',88,'박세리','2020_1');


