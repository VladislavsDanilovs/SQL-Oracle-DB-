/* SET OPERATORS */
/* UNION ALL */
/* Union ALL not deleting duplicates and also doesn't sort values */
SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT * FROM jobs WHERE job_id LIKE '%MAN%';

/* Query block has incorrect number of result columns */
SELECT job_id, job_title FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT job_id, job_title, min_salary FROM jobs WHERE job_id LIKE '%MAN%';

/* We cannot sort inner querry (min2), only outer query (min1) */
SELECT job_id, job_title, min_salary min1 FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT job_id, job_title, min_salary min2 FROM jobs WHERE job_id LIKE '%MAN%'
ORDER BY min1 DESC;

SELECT first_name, last_name, salary FROM employees WHERE employee_id>200
UNION ALL
SELECT job_id, job_title, max_salary FROM jobs WHERE job_id LIKE '%MAN%';

SELECT country_id FROM countries
UNION ALL
SELECT country_name FROM countries;

/* UNION */
/* Union deleted all duplicates and sorted */ 
SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
UNION
SELECT * FROM jobs WHERE job_id LIKE '%MAN%';

SELECT * FROM jobs WHERE min_salary BETWEEN 4500 AND 8000
UNION
SELECT * FROM jobs WHERE min_salary BETWEEN 10000 AND 15000
ORDER BY 3;

/* INTERSECT */
SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
INTERSECT
SELECT * FROM jobs WHERE job_id LIKE '%MAN%';

SELECT * FROM jobs WHERE min_salary BETWEEN 4500 AND 8000
INTERSECT
SELECT * FROM jobs WHERE max_salary BETWEEN 10000 AND 15000;

SELECT first_name, last_name FROM employees
INTERSECT
SELECT street_address, city FROM locations;

SELECT job_id, job_title, max_salary FROM jobs 
WHERE min_salary BETWEEN 4500 AND 8000
INTERSECT
SELECT job_id, job_title, max_salary FROM jobs 
WHERE max_salary BETWEEN 10000 AND 15000
ORDER BY max_salary DESC;

/* MINUS (EXCEPT in classic SQL) */
SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
MINUS
SELECT * FROM jobs WHERE job_id LIKE '%MAN%';

SELECT job_id, job_title, max_salary FROM jobs 
WHERE min_salary BETWEEN 4500 AND 8000
MINUS
SELECT job_id, job_title, max_salary FROM jobs 
WHERE max_salary BETWEEN 10000 AND 15000;

SELECT job_id, job_title, max_salary FROM jobs 
WHERE max_salary BETWEEN 10000 AND 15000
MINUS
SELECT job_id, job_title, max_salary FROM jobs 
WHERE min_salary BETWEEN 4500 AND 8000;

/* Examples using SET operators */
SELECT first_name, salary FROM employees WHERE first_name LIKE '%a%'
INTERSECT
SELECT first_name, salary FROM employees WHERE first_name LIKE '%e%'
MINUS
SELECT first_name, salary FROM employees WHERE first_name LIKE '%l%';

SELECT first_name, salary FROM employees WHERE first_name LIKE '%a%'
UNION
(SELECT first_name, salary FROM employees WHERE first_name LIKE '%e%'
MINUS
SELECT first_name, salary FROM employees WHERE first_name LIKE '%l%');

/* Finding manager that works in dep.id = 20 and dep.id = 30 but not in dep.id = 40*/
SELECT manager_id FROM employees WHERE department_id = 20
INTERSECT 
SELECT manager_id FROM employees WHERE department_id = 30
MINUS 
SELECT manager_id FROM employees WHERE department_id = 40;

SELECT department_id dep_id, TO_CHAR(NULL) job_id, sum(salary) FROM employees
GROUP BY department_id
UNION
SELECT TO_NUMBER(NULL),job_id, sum(salary) FROM employees
GROUP BY job_id;


