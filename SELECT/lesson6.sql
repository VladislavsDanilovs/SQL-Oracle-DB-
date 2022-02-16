/* TRIM */
SELECT TRIM(trailing 'q' FROM 'qqVladqq') FROM dual;
SELECT TRIM(leading 'q' FROM 'qqVladqq') FROM dual; 
SELECT TRIM(both 'q' FROM 'qqVladqq') FROM dual; 
SELECT TRIM(' ' FROM '        Vlad   Danilov  ') FROM dual;
SELECT TRIM('     Vlad   Danilov  ') FROM dual; 

/* INSTR */
SELECT * FROM employees; 
SELECT * FROM employees WHERE INSTR(job_id, 'PROG')= 4;
SELECT * FROM employees WHERE INSTR(hire_date, '11')= 4;
SELECT INSTR('Vlad Danilov' , 'a', 2, 2) FROM dual;

/* SUBSTR */
SELECT * FROM employees;
SELECT email, SUBSTR(email, 4, 2) from employees;
SELECT SUBSTR('Hello, how are you?', 7) FROM dual;
SELECT SUBSTR('Hello, how are you?', 7, 5) FROM dual;
SELECT salary, SUBSTR(salary, 2, 3) FROM employees;
SELECT salary, SUBSTR(hire_date, 2, 3) FROM employees;
SELECT SUBSTR('Hello, how are you?', -9) FROM dual;

/* SUBSTR */
SELECT REPLACE('Hello, how are you, where is my money?', 'ow' , 'ere') FROM dual;
/*if we writing only second parameter, then this value will be deleted*/
SELECT REPLACE('Hello, how are you, where is my money?', ' how are you,') FROM dual;
SELECT salary, REPLACE(salary, '1', '9') FROM employees; 
SELECT hire_date, REPLACE(hire_date, '.', '/') FROM employees; 

/* ROUND */
SELECT ROUND(3.5627, 1) FROM dual;
SELECT salary*3.1415, ROUND(salary*3.1415) FROM employees;
/* result 360000*/
SELECT ROUND(356826, -4) FROM dual;
/* result 356827*/
SELECT ROUND(356826.975, 0) FROM dual;
SELECT first_name, ROUND((SYSDATE-hire_date)*employee_id) bonus FROM employees;

/* TRUNC */
SELECT TRUNC(3.5627, 3) FROM dual;
SELECT TRUNC(352515.2, -1) FROM dual;
SELECT first_name, TRUNC((SYSDATE-hire_date)*employee_id) bonus FROM employees;

/* MOD */
SELECT MOD(5,2) FROM dual;
SELECT MOD(2,9) FROM dual;
SELECT MOD(17, 2) FROM dual; /* odd */
SELECT MOD(16, 2) FROM dual; /* even */
SELECT * FROM employees WHERE MOD(employee_id, 2)=0;
SELECT employee_id, first_name, last_name, MOD(employee_id, 3)+1 Team FROM employees;_
