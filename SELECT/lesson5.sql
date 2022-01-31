SELECT * FROM employees;
SELECT first_name, LOWER(first_name) FROM employees;
SELECT * FROM employees WHERE LOWER(first_name) = 'david';
SELECT LOWER(2+2*2) FROM dual;
SELECT LOWER('HELLO '||'HOW OLD aRe yOu?') FROM dual;

SELECT first_name, UPPER(first_name) FROM employees;

SELECT first_name, INITCAP(first_name) FROM employees;
SELECT INITCAP('HELLO '||'HOW, ,OL,D ,aR,e y,Ou?') FROM dual;

select sysdate from dual;

SELECT CONCAT('Hello', 'Friend') FROM dual;
SELECT CONCAT(salary*2, hire_date) FROM employees;
SELECT SYSDATE FROM dual;

SELECT first_name, LENGTH(first_name) LENGTH FROM employees;
SELECT LENGTH('Vlad_%?;:" Danilov') FROM dual;
SELECT salary, LENGTH(salary), hire_date, LENGTH(hire_date) FROM employees;
SELECT country_name FROM countries WHERE LENGTH(country_name) > 8;
SELECT country_name FROM countries ORDER BY LENGTH(country_name);

SELECT LPAD('Vlad', 7, '#') FROM dual;
SELECT RPAD('Vlad', 7, '#') FROM dual;
SELECT first_name, LPAD(first_name, 25, '$') from employees;
SELECT first_name, LPAD(first_name, 25, '$'), RPAD(first_name, 25, '$') from employees;
SELECT first_name, LPAD(first_name, 25, 'ABC') from employees;
SELECT SYSDATE, LPAD(SYSDATE,5 , '!') FROM dual;
SELECT RPAD(first_name, 15, ' ') || LPAD(salary, 8 ,' ') AS EMPLOYEES_SALARY FROM employees;


