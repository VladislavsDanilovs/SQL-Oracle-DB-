select salary * 2+employee_id from employees;
SELECT first_name, salary*1.5, salary from employees;

select * from job_history;
select start_date, end_date, ( end_date-start_date)+1 from job_history;

select start_date, end_date-5  from job_history;

SELECT first_name || salary from employees;

SELECT 'My name is '|| first_name||' and my surname is '||last_name as name
FROM employees;
select 'A' || commision_pc

select start_date, end_date, (end_date-start_date)+1 as "Count of days" FROM job_history;
