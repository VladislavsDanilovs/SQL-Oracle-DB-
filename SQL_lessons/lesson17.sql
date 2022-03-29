/* DML COMMANDS */
/* INSERT */
SELECT * FROM employees;
SELECT * FROM countries;

INSERT INTO countries VALUES ('SW', 'Sweden', 1);

/* Best practice */
INSERT INTO countries (country_id, country_name, region_id)
VALUES ('NR', 'Norway', 1);

INSERT INTO countries (country_id, country_name)
VALUES ('PR', 'Portugal');

INSERT INTO countries VALUES ('FL', 'Finland', null);

INSERT INTO countries (country_id, country_name, region_id)
VALUES ('CR', 'Croatia', 5);

SELECT * FROM employees;
/* Bad practice */
INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (210, 'tregulov' , 'tregulov' , '29-03-2022', 'IT_PROG');

/* Best practice (INSERT with functions) */
INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (211, INITCAP('tregulov') , UPPER('tregulov1'), 
TO_DATE('29-03-2022', 'DD-MM-YYYY'), UPPER('IT_PROG'));

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (200+12, INITCAP('tregulov') , UPPER('tregulov2'), 
SYSDATE, UPPER('IT_PROG'));

/* INSERT with SUBQUERY */
 CREATE TABLE new_emps
 (
 emp_id integer,
 name varchar2(20),
 start_date date, 
 job varchar2(10)
 );
 /* with columns (best practice)*/
 INSERT INTO new_emps (emp_id, name, start_date)
 (SELECT employee_id, first_name, hire_date FROM employees WHERE employee_id>200);

 /* without columns (bad practice)*/
 INSERT INTO new_emps
 (SELECT employee_id, first_name, hire_date, job_id FROM employees WHERE employee_id>200);

SELECT * FROM new_emps;

/* INSERT INTO multiple tables */
CREATE TABLE emps_with_high_salary(
name varchar2(20),
salary integer
);

CREATE TABLE emps_with_dept_100(
name varchar2(20),
salary integer
);

CREATE TABLE some_emps(
name varchar2(20),
salary integer
);

INSERT ALL
WHEN department_id = 100 THEN
INTO emps_with_dept_100 VALUES (first_name, salary)
WHEN salary>15000 THEN
INTO emps_with_high_salary (name) VALUES (last_name)
WHEN 5 = 5 THEN
INTO some_emps (name, salary) VALUES (first_name, salary)
SELECT first_name, last_name, salary, department_id
FROM employees WHERE LENGTH(first_name) > 5;

SELECT * FROM emps_with_dept_100;
SELECT * FROM emps_with_high_salary;
SELECT * FROM some_emps;
