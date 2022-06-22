SELECT * FROM employees;

CREATE VIEW fin_emp AS
SELECT employee_id, job_id, salary FROM employees;

CREATE VIEW fin_emp3 AS
SELECT department_name, SUM(salary) sum_salary FROM employees e JOIN departments d
ON (e.department_id = d.department_id) GROUP BY department_name;

SELECT * FROM fin_emp;

SELECT * FROM fin_emp3;

SELECT department_name FROM fin_emp3 WHERE sum_salary > 10000;

CREATE VIEW emps_with_high_salary2 AS
SELECT first_name, last_name FROM employees WHERE salary >=12000;

SELECT * FROM emps_with_high_salary2;