/* JOIN */
/* NATURAL JOIN */
SELECT * FROM employees;
SELECT * FROM departments;

SELECT e.salary, e.first_name FROM employees e;

SELECT * FROM regions;
SELECT * FROM countries;
SELECT r.region_name, c.country_name, region_id 
FROM regions r NATURAL JOIN countries c WHERE r.region_name = 'Europe';

SELECT * FROM employees;
SELECT * FROM departments;

/* When we use Natural Join it joins tables by columns with identical names (we cant choose by witch column we want to join in this case)*/
SELECT first_name, last_name, salary, department_name, department_id, manager_id
FROM employees NATURAL JOIN departments;

SELECT * FROM employees;
SELECT * FROM job_history;

/* (INNER)Natural JOIN with USING */
SELECT first_name, last_name, salary, department_name
, e.manager_id emp_manager, d.manager_id dep_manager
, department_id
FROM employees e  JOIN departments d USING(department_id);

SELECT * FROM regions JOIN countries USING (region_id);

SELECT first_name, last_name, jh.job_id, start_date, end_date
FROM employees JOIN job_history jh USING (employee_id, department_id);

/* (INNER)Natural JOIN with ON */
SELECT first_name, last_name, jh.job_id, start_date, end_date, employees.employee_id
,jh.employee_id
FROM employees JOIN job_history jh ON (employees.employee_id = jh.employee_id);

SELECT * FROM regions;
SELECT * FROM departments;

SELECT * FROM departments JOIN regions ON 
(region_id*10 = department_id);

SELECT first_name, last_name, jh.job_id, start_date, end_date
FROM employees e JOIN job_history jh ON 
(e.employee_id = jh.employee_id AND e.department_id = jh.department_id)
WHERE salary > 7000;

SELECT * FROM departments;
SELECT * FROM employees;

SELECT first_name, last_name, d.department_name, e.manager_id, e.department_id
FROM employees e JOIN departments d ON (e.employee_id = d.manager_id);

/* JOIN more then 2 tables */
SELECT * FROM regions;
SELECT * FROM locations;
SELECT * FROM countries;

/* NATURAL join*/
SELECT * FROM locations NATURAL JOIN countries NATURAL JOIN regions;

/* JOIN with using*/
SELECT * FROM locations JOIN countries USING(country_id) 
JOIN regions USING (region_id);

/* JOIN with ON (recommended to use)*/
SELECT first_name, last_name, jh.job_id, start_date, end_date, department_name
FROM employees e JOIN job_history jh ON (e.employee_id = jh.employee_id)
JOIN departments d ON (jh.department_id = d.department_id);

/* JOIN with ON and USING (bad practice)*/
SELECT first_name, last_name, jh.job_id, start_date, end_date, department_name
FROM employees e JOIN job_history jh USING (employee_id)
JOIN departments d ON (jh.department_id = d.department_id);

/* JOIN with ON and Group By */
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary, COUNT(*), department_name
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
GROUP BY department_name
ORDER BY department_name DESC;