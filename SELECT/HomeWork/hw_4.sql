/* 1 */
SELECT * FROM employees WHERE length(first_name) > 10;

/* 2 */
SELECT * FROM employees WHERE MOD(salary, 1000) = 0;

/* 3 */
SELECT phone_number, SUBSTR(phone_number, 0, 3) FROM employees WHERE INSTR(phone_number, '.',1,3) = 0;

/* 4 */
SELECT first_name FROM employees WHERE LENGTH(first_name) > 5 AND INSTR(first_name, 'm', LENGTH(first_name), 1) != 0;

/* 5 */
SELECT NEXT_DAY(SYSDATE, 'Пятница') FROM dual;

/* 6 */
SELECT * FROM job_history;
SELECT employee_id FROM job_history WHERE  MONTHS_BETWEEN(end_date, start_date) > 150;

/* 7 */
SELECT * FROM employees;
SELECT phone_number , REPLACE(phone_number, '.', '-') AS PHONE_NUMBER_2 FROM employees;

/* 8 */
SELECT * FROM employees;
SELECT UPPER(first_name), LOWER(email), INITCAP(job_id) FROM employees;

/* 9 */
SELECT * FROM employees;
SELECT CONCAT(first_name, salary) FROM employees;

/* 10 */
SELECT * FROM employees;
SELECT hire_date, TRUNC(hire_date, 'MM'), TRUNC(hire_date, 'YYYY') FROM employees;

/* 11 */
SELECT * FROM employees;
SELECT RPAD(first_name,10,'$'), LPAD(last_name,15,'!') FROM employees;

/* 12 */
SELECT * FROM employees;
SELECT first_name, INSTR(first_name, 'a', 1, 2) FROM employees;

/* 13 */
SELECT ('!!!HELLO!! MY FRIEND!!!!!!!!') FROM dual;
SELECT TRIM(both '!' FROM '!!!HELLO!! MY FRIEND!!!!!!!!') FROM dual;

/* 14 */
SELECT * FROM employees;
SELECT salary, salary*3.1415, ROUND(salary*3.1415), ROUND(salary*3.1415, -3) FROM employees;

/* 15 */
SELECT * FROM employees;
SELECT first_name, hire_date, ADD_MONTHS(hire_date, 6), LAST_DAY(hire_date) FROM employees; 