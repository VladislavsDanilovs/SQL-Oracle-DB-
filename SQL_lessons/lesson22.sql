/* TABLE CREATION */
SELECT *  FROM employees;

CREATE TABLE students(
student_id integer,
name varchar2(15),
start_date date DEFAULT ROUND(SYSDATE),
scholarship number(6, 2),
avg_score number(4, 2) default 5
);

SELECT * FROM students;

INSERT INTO students (student_id, name, start_date, scholarship, avg_score)
VALUES (1, 'Zaur', TO_DATE('18-09-2019'), 1500.3, 7.8);

INSERT INTO students (student_id, name, start_date, scholarship, avg_score)
VALUES (2, 'Ivan', TO_DATE('19-04-2022'), 878.3, 8);

INSERT INTO students (student_id, name, scholarship )
VALUES (3, 'Maxim',  350 );

/* TABLE CREATION USING SUBQUERY */
CREATE TABLE new_emps2 AS (SELECT employee_id, first_name, last_name, 
salary, department_id FROM employees);

CREATE TABLE new_dep AS (SELECT department_name, MAX(salary) AS max_salary,
MIN(salary) AS min_salary FROM employees e JOIN departments d 
ON (e.department_id = d.department_id) GROUP BY department_name);

SELECT * FROM new_dep;

CREATE TABLE regions2 AS (SELECT * FROM regions WHERE 5=6);
SELECT * FROM regions2;

/* ALTERING TABLE */
SELECT * FROM students;
ALTER TABLE students ADD (course number DEFAULT 3);
ALTER TABLE students MODIFY (AVG_SCORE number(5,3));
ALTER TABLE students MODIFY (start_date date DEFAULT null);

INSERT INTO students (student_id, name )
VALUES (4, 'Pavel' );

ALTER TABLE students DROP COLUMN scholarship;
ALTER TABLE students SET UNUSED COLUMN start_date;
ALTER TABLE students DROP UNUSED COLUMNS;
ALTER TABLE students RENAME COLUMN student_id TO ID;
ALTER TABLE students READ ONLY;
ALTER TABLE students READ WRITE;

/* TRUNCATE
(delete all rows) */
SELECT * FROM students;

TRUNCATE TABLE students;

/* DROP */
SELECT * FROM students;

DROP TABLE students;

