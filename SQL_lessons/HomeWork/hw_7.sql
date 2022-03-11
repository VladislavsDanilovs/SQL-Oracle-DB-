/* 1 */
SELECT * FROM regions;
SELECT * FROM countries;
SELECT * FROM locations;
SELECT * FROM departments;
/* Department_id -> Location_id -> Country_id -> Region_id */
SELECT * FROM employees;

SELECT r.region_name, COUNT(*)
    FROM employees e 
        JOIN departments d ON (e.department_id = d.department_id)
        JOIN locations l ON (d.location_id = l.location_id)
        JOIN countries c ON (l.country_id = c.country_id)
        JOIN regions r ON (c.region_id = r.region_id)
    GROUP BY r.region_name;
    
/* 2 */
SELECT first_name, last_name, department_name, job_id, street_address
, country_name, region_name
    FROM employees e 
        JOIN departments d ON (e.department_id = d.department_id)
        JOIN locations l ON (d.location_id = l.location_id)
        JOIN countries c ON (l.country_id = c.country_id)
        JOIN regions r ON (c.region_id = r.region_id);
        
/* 3 */

SELECT emp1.first_name AS manager_name, COUNT(*) FROM employees emp1
JOIN employees emp2 ON (emp1.employee_id = emp2.manager_id)
GROUP BY emp1.first_name
HAVING COUNT(*) > 6;

/* 4 */
SELECT department_name, COUNT(*)
FROM departments d LEFT JOIN employees e USING(department_id)
GROUP BY department_name
HAVING COUNT(*) > 30;

/* 5 */
SELECT * FROM departments;

SELECT department_name
FROM departments d LEFT JOIN employees e USING(department_id)
GROUP BY department_name, d.manager_id
HAVING d.manager_id IS NULL;

/* 6 */ 
SELECT * FROM employees;

SELECT emp1.*  FROM employees emp1
JOIN employees manag ON (emp1.manager_id = manag.employee_id)
WHERE TO_CHAR(manag.hire_date, 'YYYY') = '2005'
AND emp1.hire_date < TO_DATE('01-01-2005', 'DD-MM-YYYY');

/* 7 */
SELECT * FROM regions;
SELECT * FROM countries;

SELECT country_name, r.region_name FROM countries NATURAL JOIN regions r;

/* 8 */
select * from employees;
select * from jobs;

SELECT first_name, last_name, salary, min_salary, max_salary
FROM employees e JOIN jobs j 
ON(e.job_id = j.job_id AND salary < min_salary+1000);

/* 9 */
select * from employees;
select * from countries;
select * from departments;

SELECT DISTINCT first_name, last_name, c.country_name
    FROM employees e 
        FULL JOIN departments d ON (e.department_id = d.department_id)
        FULL JOIN locations l ON (d.location_id = l.location_id)
        FULL JOIN countries c ON (l.country_id = c.country_id)
        FULL JOIN regions r ON (c.region_id = r.region_id);
        
/* 10 */
/* Cartesian Product */
SELECT first_name, last_name, country_name
FROM employees CROSS JOIN countries;

/* 11 */
SELECT r.region_name, COUNT(*)
    FROM employees e, departments d, locations l, countries c, regions r
    WHERE e.department_id = d.department_id 
        AND d.location_id = l.location_id 
        AND l.country_id = c.country_id 
        AND c.region_id = r.region_id
    GROUP BY r.region_name;

/* 12 */
SELECT department_name, d.manager_id
FROM departments d, employees e 
WHERE e.department_id (+)= d.department_id
GROUP BY department_name, d.manager_id
HAVING d.manager_id IS NULL;
