/* SEQUENCE */
CREATE SEQUENCE s1;

/* Unique values for all tables and sessions */
SELECT s1.nextval FROM dual;

/* currval shows value that is in current sessions*/
SELECT s1.currval FROM dual;
SELECT * FROM Students;
ALTER TABLE students ADD (faculty_id integer DEFAULT 1);
SELECT * FROM faculties;

CREATE SEQUENCE seq_st; 
CREATE SEQUENCE seq_faculty start with 20 increment by 5;
INSERT INTO faculties VALUES(seq_faculty.nextval, 'Chemistry');
INSERT INTO faculties VALUES(seq_faculty.nextval, 'QuickMath');
INSERT INTO faculties VALUES(seq_faculty.nextval, 'IT');

INSERT INTO students VALUES(seq_st.nextval, 'Patrik', 3, SEQ_FACULTY.currval);
INSERT INTO students VALUES(seq_st.nextval, 'Bubba', 2, 25);

CREATE SEQUENCE s4 INCREMENT BY 2 MAXVALUE 17 CYCLE CACHE 3;
SELECT s4.nextval FROM dual;

CREATE SEQUENCE s5 START WITH 7 INCREMENT BY 4 MAXVALUE 17 CYCLE CACHE 2;
SELECT s5.nextval FROM dual;

/* Creating primary keys without gaps example (not effective solution)*/
CREATE TABLE sequence1(
n number
);
INSERT INTO sequence1 values (1);

DROP TABLE students;

CREATE TABLE students(
id number primary key,
name varchar2(25)
);
INSERT INTO students values ((SELECT n FROM sequence1), 'Patrik');
UPDATE sequence1 SET n = n+1;

SELECT * FROM students;
SELECT * FROM sequence1;

ALTER SEQUENCE s5 INCREMENT BY 5;
DROP SEQUENCE s5;

CREATE SEQUENCE s20;
SELECT s20.currval FROM dual;