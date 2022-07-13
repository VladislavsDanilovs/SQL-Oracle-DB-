/* 1. */
CREATE TABLE emp1000 AS (SELECT first_name, last_name, salary, department_id 
FROM employees);

SELECT * FROM emp1000;

/* 2. */
CREATE VIEW v1000 AS (SELECT first_name, last_name, salary, city, 
department_name FROM emp1000 
JOIN departments ON (emp1000.department_id = departments.department_id)
JOIN locations ON (departments.location_id = locations.location_id)
);

/* Alternetive solution is to write CREATE FORCE VIEW, that will allow us to
create city column without joining locations. */

SELECT * FROM v1000;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM locations;

/* 3. */
ALTER TABLE emp1000 ADD (city VARCHAR2(25) DEFAULT null);
SELECT * FROM emp1000;

/* 4. */
ALTER VIEW v1000 COMPILE;

/* 5. */
CREATE SYNONYM syn1000 FOR v1000;

/* 6. */
DROP VIEW v1000;

/* 7. */
DROP SYNONYM syn1000;

/* 8. */
DROP TABLE emp1000;

/* 9. */
CREATE SEQUENCE seq1000 INCREMENT BY 4 START WITH 12 MAXVALUE 200 CYCLE;
SELECT seq1000.nextval FROM dual;

/* 10. */
DROP SEQUENCE seq1000;

CREATE SEQUENCE seq1000 INCREMENT BY 4 START WITH 12;
SELECT seq1000.nextval FROM dual;

/* Alternative solution */
ALTER SEQUENCE seq1000
NOMAXVALUE
NOCYCLE;

/* 11. */
SELECT * FROM employees;
SELECT * FROM jobs;

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id) 
VALUES (201+seq1000.nextval, 'Star', 'patrik.star@gmail.com', '04.02.2023', 'IT_PROG');

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id) 
VALUES (201+seq1000.nextval, 'Bubba', 'hubba.bubba@gmail.com', '04.02.2023', 'IT_PROG');

SELECT seq1000.currval FROM dual;

/* 12. */
COMMIT;