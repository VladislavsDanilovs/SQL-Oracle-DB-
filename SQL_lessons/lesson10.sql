/* Group functions (Multiple-row)*/

/* counting all rows from table employees, output is 107 */
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM employees WHERE salary > 5000;
SELECT COUNT(NVL(commission_pct, 0)) FROM employees;

/* distinct = unique value that not repeating */
SELECT COUNT(DISTINCT commission_pct) FROM employees;
SELECT COUNT(DISTINCT first_name) FROM employees;
SELECT COUNT(DISTINCT NVL(commission_pct, 0)) FROM employees;
SELECT first_name, last_name, first_name||' '||last_name FROM employees;
SELECT first_name, last_name, 7 FROM employees;
/* Output bellow will be 107*/
SELECT COUNT('abc') FROM employees;

/* Using Group functions we cant write something else, excluding another group functions*/
SELECT COUNT(salary), first_name FROM employees;

/* SUM */
SELECT SUM(salary), SUM(DISTINCT salary) FROM employees;
SELECT SUM(DISTINCT commission_pct) FROM employees;
SELECT SUM('7') FROM employees;
SELECT ROUND(SUM(SYSDATE-hire_date)) FROM employees;
/* AVERAGE LETTER COUNT IN EMPLOYEES NAME */
SELECT SUM(LENGTH(first_name))/COUNT(*) FROM employees;

/* AVG */
SELECT AVG(salary) FROM employees WHERE job_id = 'IT_PROG';
SELECT SUM(salary)/COUNT(salary) FROM employees;
SELECT AVG(DISTINCT salary) FROM employees;
SELECT AVG(commission_pct), AVG(DISTINCT commission_pct) FROM employees;
SELECT COUNT(*) a, SUM(salary) b, AVG(commission_pct) c FROM employees;
SELECT AVG(SYSDATE-hire_date)/365 FROM employees;

/* MIN, MAX */
SELECT MIN(salary), MAX(salary) FROM employees WHERE department_id = 50;
SELECT MIN(hire_date), MAX(hire_date) FROM employees WHERE department_id = 50;
SELECT MIN(last_name), MAX(last_name) FROM employees WHERE department_id = 50;

SELECT COUNT(salary), SUM(salary), AVG(salary), MAX(salary), MIN(salary)
FROM employees;

SELECT MAX(LENGTH(first_name)) , MIN(LENGTH(first_name)) FROM employees;