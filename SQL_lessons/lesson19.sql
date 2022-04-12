/* UPDATE */
SELECT * FROM employees;

UPDATE employees SET salary = 10001  WHERE employee_id = 100;
UPDATE employees SET salary = salary*2  WHERE employee_id = 100;

UPDATE employees SET salary = 27000, job_id= 'IT_PROG' WHERE employee_id = 100;

UPDATE employees SET salary = 800 WHERE employee_id < 105;

/*Without WHERE conditions we are updating all 110 rows*/ 
UPDATE employees SET salary = 110;

/*ERROR we cannot violate constraints*/ 
UPDATE employees SET employee_id = null WHERE employee_id = 105;
UPDATE employees SET employee_id = 101 WHERE employee_id = 105;

/* UPDATE with SUBQUERY */
UPDATE employees SET salary = 5000 WHERE department_id IN
(SELECT department_id FROM departments WHERE department_name = 'Marketing');

UPDATE employees SET salary = (SELECT MAX(salary) FROM employees),
hire_date = (SELECT MIN(start_date) FROM job_history)
WHERE employee_id = 180;

UPDATE employees SET salary = (SELECT salary FROM employees WHERE employee_id = 5)
WHERE employee_id = 181;

/* DELETE */
SELECT * FROM employees;

SELECT * FROM new_emps;

INSERT INTO new_emps (SELECT employee_id, first_name, hire_date, job_id
FROM employees);

DELETE FROM new_emps WHERE emp_id = 210;

DELETE FROM new_emps WHERE job LIKE '%CLERK%' OR name IS NULL;

/* DELETE with SUBQUERY */

DELETE FROM new_emps WHERE job IN 
(SELECT DISTINCT job_id FROM employees WHERE department_id IN
(SELECT department_id FROM departments WHERE manager_id = 100));

/* MERGE */
DELETE FROM new_emps;
SELECT * FROM new_emps;
SELECT * FROM employees;

INSERT INTO new_emps
(SELECT employee_id, first_name, hire_date, job_id FROM employees
WHERE employee_id < 110);

/* If both tables contains same employees, change start_date to SYSDATE */
MERGE INTO new_emps emp1 USING employees emp2
ON (emp1.emp_id = emp2.employee_id)
WHEN MATCHED THEN 
UPDATE SET emp1.start_date = SYSDATE
DELETE WHERE emp1.job LIKE '%IT%'
WHEN NOT MATCHED THEN
INSERT (emp_id, name, start_date, job)
VALUES (employee_id, first_name, hire_date, job_id);