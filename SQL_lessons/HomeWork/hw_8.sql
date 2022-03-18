/* 1 */
SELECT * FROM employees;

SELECT * FROM employees WHERE LENGTH(first_name) = 
(SELECT MAX(LENGTH(first_name)) FROM employees);

/* 2 */ 
SELECT * FROM employees WHERE salary >
(SELECT AVG(SALARY) FROM employees);

/* 3 */
SELECT * FROM countries;
SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM employees;

SELECT city FROM locations WHERE city IN
(SELECT city FROM employees e 
JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (l.location_id = d.location_id)
GROUP BY city
HAVING SUM(salary) = 
    (SELECT MIN(SUM(salary)) FROM employees e 
        JOIN departments d ON (e.department_id = d.department_id)
        JOIN locations l ON (l.location_id = d.location_id)
    GROUP BY city)
);

/* 4 */
SELECT * FROM employees;
SELECT * FROM jobs;

SELECT * FROM employees WHERE manager_id IN (
SELECT employee_id FROM employees WHERE salary > 15000);

/* 5 */
SELECT * FROM departments;
SELECT * FROM employees;

SELECT * FROM departments WHERE department_id IN (
SELECT department_id FROM departments WHERE manager_id IS NULL);

/* 6 */
SELECT * FROM jobs;
SELECT * FROM employees;

SELECT * FROM employees WHERE employee_id NOT IN (
SELECT DISTINCT NVL(manager_id,0) FROM employees);

/* 7 */
SELECT * FROM departments;
SELECT * FROM employees;

SELECT * FROM employees e WHERE 
(SELECT COUNT(*) FROM employees 
 WHERE manager_id = e.employee_id) > 6;

/* 8 */
SELECT * FROM departments;
SELECT * FROM employees;

SELECT * FROM employees WHERE department_id =
(SELECT department_id FROM departments WHERE department_name LIKE 'IT');

/* 9 */
SELECT * FROM employees;

SELECT * FROM employees WHERE manager_id IN (
    SELECT employee_id FROM employees 
    WHERE TO_CHAR(hire_date, 'yyyy')='2005')
AND TO_CHAR(hire_date, 'yyyy') < '2005' ;

/* 10 NOT CORRECT*/
SELECT * FROM employees;
SELECT * FROM jobs;

/* using JOIN with SUBQUERY */
SELECT * FROM employees e JOIN jobs j ON (e.job_id = j.job_id) 
WHERE manager_id IN (
    SELECT employee_id FROM employees 
    WHERE TO_CHAR(hire_date, 'MON')='JAN')
AND LENGTH(job_title) > 15 ;

/* using only SUBQUERY (correlated)*/
SELECT * FROM employees e
WHERE manager_id IN (
    SELECT employee_id FROM employees 
    WHERE TO_CHAR(hire_date, 'MON')='JAN')
AND (SELECT LENGTH(job_title) FROM jobs 
WHERE (e.job_id = job_id))>15;







