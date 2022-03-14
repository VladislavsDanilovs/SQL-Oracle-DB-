/* SUBQUERY */
/* SINGLE ROW SUBQUERY */
SELECT first_name, last_name, salary
FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT * FROM employees;
SELECT * FROM jobs;

SELECT (SELECT MIN(min_salary) FROM jobs) AS min_salary, 
(SELECT MAX(LENGTH(first_name)) FROM employees) AS Longest_name FROM dual;

SELECT first_name, last_name FROM employees 
WHERE employee_id IN (SELECT manager_id FROM employees);

/* Using subquery with JOIN */ 
SELECT department_name, MIN(salary), MAX(salary) FROM
(SELECT salary, department_name FROM employees e JOIN departments d
ON (e.department_id = d.department_id))
GROUP BY department_name;

/* Using only JOIN */ 
SELECT department_name, MIN(salary), MAX(salary) 
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
GROUP BY department_name;

SELECT department_name, MIN(salary), MAX(salary) FROM
(SELECT salary, department_name FROM employees e JOIN departments d
ON (e.department_id = d.department_id))
GROUP BY department_name
HAVING MAX(salary) > (SELECT 2*5000 FROM dual)
AND MIN(salary) < (SELECT salary FROM employees WHERE employee_id=113);

SELECT MAX(salary) FROM employees;
SELECT first_name, last_name, salary FROM employees
WHERE salary < 24000/5;

SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT MAX(salary)/5 FROM employees);

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT first_name, last_name, salary FROM employees
WHERE salary >= (SELECT salary FROM employees WHERE employee_id = 180);

/* We cant write in subquery first_name if we comparing salaries*/
SELECT first_name, last_name, salary FROM employees
WHERE salary >= (SELECT salary, first_name FROM employees WHERE employee_id = 180);

/* Error: single-row subquery returns more than one row
if we use >= that means that our subquery SHOULD BE single row (SCALAR) */
SELECT first_name, last_name, salary FROM employees
WHERE salary >= (SELECT salary FROM employees WHERE employee_id > 180);

SELECT job_title FROM jobs j JOIN employees e ON (j.job_id = e.job_id)
GROUP BY job_title
HAVING AVG(salary) = 
(SELECT MAX(AVG(salary))FROM employees GROUP BY job_id);

/* MULTIPLE ROW SUBQUERY */
SELECT * FROM jobs;

/*Insted of using >= etc we can use IN and NOT IN(dont use NOT IN of subquery may contains null value) */
SELECT first_name, last_name, salary FROM employees
WHERE job_id NOT IN (SELECT job_id FROM jobs WHERE min_salary> 8000);

/* where salary is greater then min salary or greater from subquery*/ 
SELECT first_name, last_name, salary FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE department_id = 100);

/* where salary is greater then MAX salary from subquery*/ 
SELECT first_name, last_name, salary FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 100);

SELECT DISTINCT department_name FROM employees e join departments d 
ON (e.department_id = d.department_id);

SELECT department_name FROM departments
WHERE department_id IN (SELECT DISTINCT department_id FROM employees);