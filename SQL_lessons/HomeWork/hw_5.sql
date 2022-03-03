/* 1 */
SELECT * FROM employees;
SELECT first_name, CASE WHEN (INSTR(first_name, 'b', 1))>0 THEN first_name ELSE 'Employee with letter B not found' END AS Employee_with_Letter_B FROM employees;
/* Alternative solution*/
SELECT first_name FROM employees WHERE INSTR(LOWER(first_name), 'b', 1)>0;

/* 2 */
SELECT * FROM employees;
SELECT first_name FROM employees WHERE INSTR(LOWER(first_name), 'a', 1, 2)>0;


/* 3 */
SELECT * FROM departments;
SELECT department_name, SUBSTR(department_name, 1, INSTR(department_name, ' ')-1) 
AS Shorten_Dep_Name FROM departments WHERE INSTR(department_name, ' ') > 0;

/* 4 */
SELECT first_name, SUBSTR(first_name, 2, LENGTH(first_name)-2), LENGTH(first_name) FROM employees;

/* 5 */
SELECT * FROM employees;
SELECT first_name, job_id  FROM employees 
WHERE LENGTH(SUBSTR(job_id, 3))>3 AND SUBSTR(job_id,4)!= 'CLERK';

/* 6 */
SELECT * FROM employees;
SELECT first_name,hire_date FROM employees WHERE TO_CHAR(hire_date, 'DD') = '01';

/* 7 */
SELECT * FROM employees;
SELECT first_name,hire_date FROM employees WHERE TO_CHAR(hire_date, 'YYYY') = '2008';

/* 8 */
SELECT TO_CHAR(SYSDATE, 'fmDay "is the "ddTH "of " fmMonth YYYY') FROM dual;

/* 9 */
SELECT first_name, TO_CHAR(hire_date, 'ddTH "of "fmMonth, yyyy') FROM employees;

/* 10 */
SELECT first_name, TO_CHAR(salary*1.2, 'fm$99,999.00') FROM employees;

/* 11 recheck this case */
SELECT SYSDATE, TO_CHAR(SYSDATE, 'SS:MI:HH24 DD/MI/YYYY') FROM dual;

/* correct solution*/
SELECT  SYSDATE                         now,
        SYSDATE +1 / (24 * 60 * 60)     plus_second,
        SYSDATE +1 / 24 / 60            plus_minute,
        SYSDATE + 1 / 24                plus_hour,
        SYSDATE + 1                     plus_day,
        ADD_MONTHS(SYSDATE, 1)          plus_month,
        ADD_MONTHS(SYSDATE, 12)         plus_year
FROM dual;

/* 12 */
SELECT * FROM employees;
SELECT first_name, salary, salary+TO_NUMBER('$12,345.55', '$99,999.99') FROM employees;

/* 13 */
SELECT first_name, hire_date, MONTHS_BETWEEN(TO_DATE('SEP, 18:45:00 18 2009', 'MON, HH24:MI:SS DD YYYY'), hire_date) FROM employees;

/* 14 */ 
SELECT first_name, salary, TO_CHAR(salary+NVL(commission_pct,0), '$99,999.99') FROM employees;

/* 15 */
SELECT first_name, last_name, NVL2(NULLIF(LENGTH(first_name), LENGTH(last_name)), 'different length', 'same length')  FROM employees;

/* 16 */
SELECT first_name, commission_pct, NVL2(commission_pct, 'YES', 'NO') FROM employees;

/* 17 */
SELECT first_name, COALESCE(commission_pct, manager_id, salary) FROM employees;

/* 18 */
SELECT first_name, salary, CASE WHEN salary < 5000 THEN 'Low_level' 
WHEN salary >= 5000 AND salary<10000 THEN 'Mid_level'
WHEN salary >= 10000 THEN 'High_level'END AS SALARY_LEVEL FROM employees; 

/* 19 */
SELECT * FROM countries;
SELECT * FROM regions;
SELECT country_name, DECODE(region_id, 1, 'Europe', 2, 'America', 3, 'Asia', 4, 'Africa', 'Unknown') AS REGION FROM countries;

/* 20 */
SELECT country_name, CASE region_id 
WHEN 1 THEN 'Europe' 
WHEN 2 THEN 'America'
WHEN 3 THEN 'Asia'
WHEN 4 THEN 'Africa'
END AS REGIONS FROM countries;

/* 21 */
SELECT first_name, salary, commission_pct, 
    CASE
        WHEN salary < 10000 AND commission_pct IS NULL THEN 'BAD' 
        WHEN salary BETWEEN 10000 AND 15000  
        OR commission_pct IS NOT NULL THEN 'AVERAGE'
        WHEN salary>=15000 THEN 'GOOD'
    END 
    AS CONDITIONS 
FROM employees;