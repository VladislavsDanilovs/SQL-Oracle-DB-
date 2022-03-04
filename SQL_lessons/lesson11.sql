/* GROUP BY */
SELECT department_id, COUNT(*) FROM employees GROUP BY department_id ORDER BY department_id ASC;

SELECT job_id, ROUND(AVG(salary)),MIN(salary) AS MyMin, MAX(salary) 
FROM employees 
WHERE LENGTH(first_name) > 4 AND salary > 5000
GROUP BY job_id 
ORDER BY MyMin;

SELECT MAX(hire_date), MIN(first_name), COUNT(*), AVG(salary), SUM(employee_id)
FROM employees GROUP BY department_id;

SELECT TO_CHAR(hire_date, 'Month'), count(*) 
FROM employees
GROUP BY TO_CHAR(hire_date, 'Month'), TO_CHAR(hire_date, 'MM') 
ORDER BY TO_CHAR(hire_date, 'MM');

SELECT location_id, count(*) FROM departments
GROUP BY location_id;

SELECT department_id, job_id, count(*) FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

SELECT department_id, manager_id, count(*) FROM employees
GROUP BY department_id, manager_id
ORDER BY department_id, manager_id;

SELECT job_id, TO_CHAR(hire_date, 'yyyy') year, commission_pct, COUNT(*),sum(salary)
FROM employees
WHERE job_id IN('ST_CLERK', 'SA_REP', 'SH_CLERK') AND employee_id > 115
GROUP BY job_id, TO_CHAR(hire_date, 'yyyy'), commission_pct
ORDER BY job_id, year;

SELECT * FROM employees WHERE salary > 10000;

/* HAVING IN GROUP BY*/
SELECT department_id, count(*) FROM employees 
GROUP BY department_id
/*HAVING is similar to WHERE but only for GROUP statements*/
HAVING count(*) > 3
ORDER BY department_id;

SELECT department_id, count(*), ROUND(AVG(salary)) FROM employees 
GROUP BY department_id
HAVING count(*) > 3 AND ROUND(AVG(salary)) > 5000
ORDER BY department_id;

/* NESTED GROUP FUNCTIONS*/
SELECT department_id, AVG(salary), count(*) FROM employees GROUP BY department_id;

SELECT SUM(AVG(salary)), count(*) FROM employees GROUP BY department_id; 

SELECT MAX(SUM(AVG(salary))), count(*) FROM employees GROUP BY department_id; 

SELECT ROUND(SUM(AVG(LENGTH(UPPER(last_name)))))
FROM employees GROUP BY department_id;