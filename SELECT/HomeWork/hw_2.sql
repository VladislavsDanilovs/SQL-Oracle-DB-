/* 1. */
SELECT * FROM regions;

/* 2. */
SELECT first_name, last_name, salary, department_id 
FROM employees;

/* 3. */
SELECT employee_id, email, hire_date-7 as "One week before hire date" 
FROM employees;

/* 4. */
SELECT first_name||'('||job_id||')' as our_employees FROM employees;

/* 5. */
SELECT DISTINCT first_name FROM employees;

/* 6. */
SELECT job_title, 'min = '||MIN_SALARY||', max = '||MAX_SALARY as info,
max_salary as max, max_salary*2-2000 as new_salary 
FROM jobs;

/* 7. */
SELECT 'Peter''s dog is very clever' as statement FROM DUAL;

/* 8. */
SELECT q'<Peter's dog is very clever>' as statement FROM DUAL;

/* 9. */
SELECT (365.25 * 24 * 60)*100 FROM DUAL;