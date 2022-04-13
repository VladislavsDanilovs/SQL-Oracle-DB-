/* TRANSACTIONS */

/* COMMIT */
SELECT * FROM new_emps;
DELETE FROM new_emps WHERE name IS NULL;
commit;

INSERT INTO new_emps VALUES (1000, 'Zaur', '13.04.2022', 'IT PROG');
UPDATE new_emps SET emp_id = 300 WHERE name = 'Pat';
DELETE FROM new_emps WHERE name = 'Susan';
commit;

/* ROLLBACK */
SELECT * FROM new_emps;
DELETE FROM new_emps;
INSERT INTO new_emps (emp_id, name, start_date, job)
(SELECT employee_id, first_name, hire_date, job_id FROM employees);
commit;

INSERT INTO new_emps VALUES (1000, 'Zaur', '13.04.2022', 'IT PROG');
UPDATE new_emps SET emp_id = 300 WHERE name = 'Pat';
DELETE FROM new_emps WHERE name = 'John';
rollback;

INSERT INTO new_emps VALUES (1001, 'Maksim', '13.04.2022', 'IT PROG');
UPDATE new_emps SET emp_id = 300 WHERE name = 'Neena';
DELETE FROM new_emps WHERE name = 'John';
rollback;

/* SAVEPOINT */
INSERT INTO new_emps VALUES (1002, 'Peter', '13.04.2022', 'IT PROG');
SAVEPOINT save1;
UPDATE new_emps SET emp_id = 300 WHERE name = 'Bruce';
SAVEPOINT save2;
DELETE FROM new_emps WHERE name = 'Valli';

ROLLBACK TO SAVEPOINT save2;
commit;

/* AUTOCOMMIT */
SELECT * FROM new_emps;
/* Tools->Preferences->Database->Advanced->Autocommit
not recommended to use*/
UPDATE new_emps SET emp_id = 300 WHERE name = 'Bruce';
DELETE FROM new_emps WHERE name = 'Valli';

/* SELECT FOR UPDATE */
/*After we write FOR UPDATE statament oracle locks rows, so another sessions 
meanwhile will not be able to change rows*/
SELECT * FROM new_emps FOR UPDATE;
DELETE FROM new_emps WHERE name = 'Lex';