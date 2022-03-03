/* Date functions */

SELECT * FROM job_history;
SELECT * FROM nls_session_parameters WHERE PARAMETER = 'NLS_DATE_FORMAT';

/* SYSDATE */
SELECT SYSDATE-24.5 FROM dual;
SELECT TO_CHAR(sysdate, 'DD-MM-RR HH24:MI:SS') FROM dual;
SELECT SYSDATE-hire_date FROM employees;

/* MONTHS_BETWEEN */
SELECT employee_id, MONTHS_BETWEEN(end_date, start_date)*31 FROM job_history;
SELECT MONTHS_BETWEEN('12.02.19', '05.01.19') FROM dual;
SELECT * FROM employees WHERE MONTHS_BETWEEN('01.01.10', hire_date) > 60;

/* ADD_MONTHS */
SELECT end_date, ADD_MONTHS(end_date, 4) FROM job_history;
SELECT ADD_MONTHS('30.09.19', 1) FROM dual;
SELECT ADD_MONTHS('31.12.19', 2) FROM dual;

/* NEXT_DAY */
SELECT NEXT_DAY(SYSDATE, 1) FROM dual;
SELECT * FROM SYS.nls_session_parameters;
SELECT next_day('31.12.19', 'œÌ‰')-7 FROM dual;

/* LAST_DATE */
SELECT LAST_DAY(SYSDATE) FROM dual;
SELECT LAST_DAY('20.01.2022') FROM dual;
SELECT hire_date, LAST_DAY(hire_date)-hire_date WORKED_DAYS_FIRST_MONTH FROM employees;

/* ROUND */
SELECT hire_date, ROUND(hire_date, 'Q') FROM employees WHERE employee_id IN (120, 121);

/* TRUNC */
SELECT hire_date, TRUNC(hire_date, 'MM') FROM employees WHERE employee_id IN (120, 121);