SELECT * FROM employees;

SELECT * FROM employees WHERE first_name LIKE '__n%' AND commission_pct IS NULL;
SELECT * FROM employees WHERE first_name LIKE 'A%' AND job_id = 'SA_REP';
SELECT * FROM employees WHERE first_name LIKE '__n%' AND commission_pct IS NULL
OR
first_name LIKE 'A%' AND job_id = 'SA_REP';

SELECT first_name, last_name, salary, department_id, job_id, commission_pct FROM employees
WHERE last_name LIKE '%i%' AND salary > employee_id*50
OR
job_id IN('IT_PROG', 'PU_CLERK') AND commission_pct IS NULL;


SELECT first_name, salary, hire_date FROM employees WHERE job_id = 'IT_PROG' ORDER BY salary DESC;

SELECT last_name, salary, hire_date, hire_date + salary*2 expr
FROM employees
WHERE employee_id>120
ORDER BY expr;

SELECT * FROM employees ORDER BY commission_pct DESC NULLS LAST;


SELECT first_name, salary FROM employees ORDER BY 1;

/*Composite sorting example */
SELECT job_id, first_name, last_name, salary, hire_date
FROM employees
ORDER BY job_id DESC, last_name, 4 DESC;