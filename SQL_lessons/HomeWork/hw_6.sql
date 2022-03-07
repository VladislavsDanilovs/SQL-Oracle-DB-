/* 1 */
SELECT NVL(department_id, 0), 
        MIN(salary) min_salary, 
        MAX(salary) max_salary, 
        MIN(hire_date) min_hire_date, 
        MAX(hire_date) max_hire_date, 
        COUNT(*) employee_count
FROM employees
GROUP BY department_id
ORDER BY COUNT(*) DESC;

/* 2 */
SELECT  SUBSTR(first_name, 1, 1) AS First_char, COUNT(*)
FROM employees
GROUP BY SUBSTR(first_name, 1, 1)
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

/* 3 */
SELECT department_id, salary, COUNT(*) 
FROM employees
GROUP BY department_id, salary;

/* 4 */
SELECT TO_CHAR(hire_date, 'DAY') AS DayOfWeek, COUNT(*) 
FROM employees
GROUP BY TO_CHAR(hire_date, 'DAY')
ORDER BY COUNT(*) DESC;

/* 5 */
SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 30 AND SUM(salary) > 300000;

/* 6 */
SELECT region_id 
FROM countries
GROUP BY region_id
HAVING SUM(LENGTH(country_name)) > 50;

/* 7 */
SELECT job_id, ROUND(AVG(salary)) AS AVG_SALARY 
FROM employees
GROUP BY job_id;

/* 8  */
SELECT * FROM employees;

SELECT NVL(department_id, 0), COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(DISTINCT job_id) > 1
ORDER BY department_id DESC;

 
/* 9 */
SELECT department_id, job_id, MAX(salary), MIN(salary)
FROM employees
GROUP BY department_id, job_id
HAVING AVG(salary) > 10000
ORDER BY department_id DESC;

/* 10 */
SELECT * FROM employees;

SELECT NVL(manager_id, 0)
FROM employees 
WHERE NVL(commission_pct, 0) = 0 
GROUP BY NVL(manager_id, 0)
HAVING AVG(salary) BETWEEN 6000 AND 9000
ORDER BY NVL(manager_id, 0);

/* 11 */
SELECT ROUND(MAX(AVG(salary)), -3)
FROM employees
GROUP BY NVL(department_id, 0);