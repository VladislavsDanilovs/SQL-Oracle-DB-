/* SINGLE AMPERSAND SUBSTITUTION (&) or also sometimes called Runtime Binding */

SELECT first_name, last_name, salary
FROM employees
WHERE employee_id = &ID;

SELECT first_name, last_name, salary
FROM employees
WHERE first_name = '&name'
AND salary > &salary;

/* DOUBLE AMPERSAND SUBSTITUTION (&&) */
/*&& means that variable with that sign is linked to variable with &, 
so input for && will be automatically the same for variable with & (on session level) */
SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%&&letter%' 
AND last_name LIKE '%&letter%';

SELECT first_name, last_name, &col FROM employees;

SELECT first_name, last_name, &&col FROM employees
ORDER BY &col;

SELECT &continueStatement;

SELECT &select_list
FROM &table_name
WHERE &conditions
ORDER BY &col;

SELECT * FROM students;
UPDATE students SET &col3 = &value WHERE &condition;

/* DEFINE AND UNDEFINE (SQL CLIENT CONTROL COMMANDS) */
SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%&&letter%' 
AND last_name LIKE '%&letter%';
UNDEFINE letter;
DEFINE;
DEFINE letter = a;

/* Ampersand will be as common sign, without any functionality */
SET DEFINE OFF;

/* Return ampersands functionality */
SET DEFINE ON;

/* VERIFY (SQL CLIENT CONTROL COMMANDS) */
SELECT first_name, salary FROM employees WHERE salary > &salary;
/* For instance in SQLPlus after compliting above sql query it will show old and new query,
so if we dont wan't to see this information we can write:*/
SET VERIFY OFF;
/* to enable this feature */ 
SET VERIFY ON;