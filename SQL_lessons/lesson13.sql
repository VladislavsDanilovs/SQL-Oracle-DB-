/* NONEQUIJOIN with ON*/
SELECT * FROM jobs;

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j ON(e.job_id = j.job_id AND salary* 2 < max_salary);

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j ON(e.job_id = j.job_id AND salary= max_salary);

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j ON(e.job_id = j.job_id AND salary < max_salary);

SELECT first_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j ON(e.job_id = j.job_id AND salary BETWEEN min_salary+2000 AND max_salary-3000);

/* SELF JOIN */
SELECT employee_id, first_name, manager_id FROM employees;

SELECT 
emp2.first_name AS manager_name, COUNT(*)
FROM employees emp1 JOIN employees emp2 ON (emp1.manager_id = emp2.employee_id)
GROUP BY emp2.first_name
ORDER BY COUNT(*) DESC;

/* OUTER JOIN */
/* LEFT OUTER JOIN */
SELECT * FROM employees;
SELECT * FROM departments;

SELECT first_name, last_name, salary, department_name
FROM employees e JOIN departments d ON (e.department_id = d.department_id);

SELECT first_name, last_name, salary, department_name
FROM employees e LEFT OUTER JOIN departments d ON (e.department_id = d.department_id);


SELECT first_name, last_name, salary, department_name
FROM departments e LEFT OUTER JOIN employees d ON (e.department_id = d.department_id)
WHERE department_name LIKE '%i%';

SELECT first_name, salary, min_salary, max_salary
FROM employees e LEFT JOIN jobs j ON(e.job_id = j.job_id AND salary BETWEEN min_salary+2000 AND max_salary-3000);

SELECT postal_code, city, department_name
FROM locations l LEFT JOIN departments d ON (d.location_id = l.location_id);

SELECT department_name, e.department_id, first_name
FROM departments d LEFT JOIN employees e
ON (e.department_id = d.department_id)
WHERE first_name IS NULL;

/* RIGHT OUTER JOIN */
SELECT first_name, last_name, salary, department_name, department_id
FROM employees e RIGHT OUTER JOIN departments d 
USING (department_id);

SELECT * FROM countries;
SELECT * FROM locations;

SELECT country_name, city, street_address
FROM locations l RIGHT OUTER JOIN countries c ON (l.country_id = c.country_id); 

/* FULL OUTER JOIN */
SELECT NVL(first_name, 'no employee'), NVL(last_name, 'no employee')
, NVL(salary, 0), NVL(department_name, 'no department')
FROM employees e FULL OUTER JOIN departments d
ON (e.department_id = d.department_id);

/* CROSS JOIN */
SELECT * FROM countries;
SELECT * FROM regions;

SELECT * FROM countries CROSS JOIN regions ORDER BY country_id;

/* ORACLE JOIN SYNTAX */
/* ORACLE INNER JOIN*/
SELECT first_name, last_name, salary, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

/* ORACLE RIGHT OUTER JOIN*/
SELECT first_name, last_name, salary, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id (+) = d.department_id;

/* ORACLE LEFT OUTER JOIN*/
SELECT first_name, last_name, salary, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id (+);

/* ORACLE CROSS JOIN JOIN*/
SELECT * FROM countries, regions;
