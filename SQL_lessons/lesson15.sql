/* CORRELATED SUBQUERY */

SELECT first_name, last_name FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

/*Something similar to Self Join. CORR. SUB. can be singler-row or multi-row */
/*If in table will be many rows, then correlated subquery will have low performance. Not recommended because it will consume more resources then alternative solution */

SELECT e1.first_name, e1.last_name, e1.salary FROM employees e1
WHERE salary > (SELECT AVG(e2.salary) FROM employees e2
WHERE e2.department_id = e1.department_id);

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM countries;

SELECT first_name, last_name, salary FROM employees e
WHERE department_id IN
(SELECT department_id FROM departments WHERE location_id IN
(SELECT location_id FROM locations WHERE country_id = 
(SELECT country_id FROM countries WHERE country_name = 'United Kingdom')));

SELECT * FROM jobs;

SELECT first_name, last_name, salary FROM employees e
WHERE job_id IN (SELECT job_id FROM jobs WHERE LOWER(job_title) LIKE '%manager%')
AND salary > (SELECT AVG(salary) FROM employees);

SELECT first_name, last_name, salary FROM employees e
WHERE salary > (SELECT MAX(salary) FROM employees WHERE first_name = 'David');