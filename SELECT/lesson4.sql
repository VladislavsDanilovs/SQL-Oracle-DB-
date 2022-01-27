SELECT * FROM employees WHERE SALARY < 3000;

SELECT first_name, salary FROM employees WHERE last_name = 'King';

SELECT first_name,email FROM employees WHERE hire_date = '21.09.05';

SELECT * FROM departments WHERE location_id = 1700;

SELECT * FROM employees WHERE employee_id = 100;

SELECT * FROM job_history WHERE job_id = 'ST_CLERK';

SELECT * FROM employees WHERE first_name = 'Steven';

SELECT * FROM employees WHERE 'Dr '|| first_name || ' '||last_name = 'Dr David Austin';

SELECT first_name, last_name FROM employees WHERE salary >= 5000 AND salary <= 10000;

SELECT * FROM employees WHERE first_name > 'Steven';

SELECT * FROM job_history WHERE start_date < '01.01.05';

SELECT first_name, last_name, salary FROM employees
WHERE salary between 4000 and 10000;



SELECT * FROM job_history WHERE start_date BETWEEN '01.01.04' and '31.12.06';

SELECT * FROM departments WHERE location_id in(1700, 2400, 1500);
SELECT * FROM job_history WHERE job_id in ('IT_PROG', 'ST_CLERK');
SELECT * FROM job_history WHERE end_date in ('31.12.07', '05.05.05');

SELECT * FROM employees WHERE commission_pct IS NOT NULL;

SELECT * FROM employees WHERE first_name LIKE 'A%r';
SELECT * FROM employees WHERE first_name LIKE 'D_n';
SELECT * FROM employees WHERE first_name LIKE 'A%d%';
SELECT * FROM employees WHERE first_name LIKE '__n%';
SELECT * FROM employees WHERE job_id LIKE 'ST\_%' escape '\';

SELECT * FROM employees WHERE first_name like 'D%' AND salary > 10000;

SELECT * FROM employees WHERE first_name like 'D%' OR salary > 10000;

SELECT * FROM employees WHERE NOT job_id = 'SA_MAN';

SELECT * FROM employees WHERE last_name NOT LIKE 'K%';

SELECT * FROM employees WHERE job_id NOT IN('ST_MAN', 'ST_CLERK');

SELECT * FROM employees WHERE salary NOT BETWEEN 5000 and 6500;

SELECT * FROM employees WHERE commission_pct IS NOT NULL AND last_name NOT LIKE '%n';
