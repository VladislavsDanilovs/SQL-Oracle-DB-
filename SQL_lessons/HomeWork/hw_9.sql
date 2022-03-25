/* 1.  NOT COMPLITED*/
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;

SELECT manager_id, TO_CHAR(null) AS job_id, TO_NUMBER(null) AS department_id, SUM(salary)
FROM employees
GROUP BY manager_id
UNION
SELECT TO_NUMBER(null),job_id, TO_NUMBER(null), SUM(salary)
FROM employees
GROUP BY job_id
UNION
SELECT TO_NUMBER(null),TO_CHAR(null), department_id, SUM(salary) 
FROM employees
GROUP BY department_id;

/* 2. */

SELECT department_id FROM employees WHERE manager_id = 100
MINUS
SELECT department_id FROM employees WHERE manager_id = 145 OR manager_id = 201;

/* 3. */
SELECT first_name, last_name, salary FROM employees WHERE first_name LIKE '_a%'
INTERSECT
SELECT first_name, last_name, salary FROM employees WHERE LOWER(last_name) LIKE '%s%'
ORDER BY salary DESC;

/* 4. */
SELECT * FROM locations;

SELECT location_id, postal_code, city FROM locations WHERE country_id = 'DE'
UNION
SELECT location_id, postal_code, city FROM locations WHERE country_id = 'IT'
UNION ALL
SELECT location_id, postal_code, city FROM locations WHERE postal_code LIKE '%9%';

/* 5. */
SELECT * FROM countries;

SELECT country_id AS id, country_name AS country, region_id AS region 
FROM countries WHERE LENGTH(country_name) > 8
UNION
SELECT * FROM countries
WHERE region_id != (SELECT region_id FROM regions WHERE region_name = 'Europe')
ORDER BY country DESC; 