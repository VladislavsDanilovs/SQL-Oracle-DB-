/* 1. */
SELECT * FROM employees WHERE first_name = 'David';

/* 2. */
SELECT * FROM employees WHERE job_id = 'FI_ACCOUNT';

/* 3. */
SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id = 50 AND salary > 4000;

/* 4. */
SELECT * FROM employees WHERE department_id IN(20, 30);

/* 5. */
SELECT * FROM employees WHERE first_name LIKE '_a%a';

/* 6. */
SELECT * FROM employees WHERE department_id IN(80, 50) AND commission_pct IS NOT NULL
ORDER BY 4 ASC;

/* 7. */
SELECT * FROM employees WHERE first_name LIKE '%n%n%';

/* 8. */
SELECT * FROM employees WHERE first_name LIKE '_____%' ORDER BY department_id DESC NULLS LAST;

/* 9. */
SELECT * FROM employees WHERE salary BETWEEN 3000 AND 7000 AND commission_pct IS NULL
AND job_id IN('PU_CLERK', 'ST_MAN', 'ST_CLERK');

/* 10. */
SELECT * FROM employees WHERE first_name LIKE '%\%%' ESCAPE '\';

/* 11. */
SELECT job_id, first_name, salary FROM employees WHERE employee_id >= 120 AND job_id != 'IT_PROG'
ORDER BY job_id ASC, first_name DESC; 

