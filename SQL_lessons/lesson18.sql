/* Most common mistakes using DML commands */

/* syntax errors */
SELECT * FROM employees WHEREE employee_id = 200;

SELECT * FROM employees WHERE hire_date = '05-SEP-0';

INSERT INTO countries (region_ip) VALUES (5, 6);

/* table or view does not exist error may apper if we dont have access to the table*/
INSERT INTO countries (country_id, country_name, region_id)
VALUES ('ddd' , 'kkk', 1);

/* errors that appears when constraints are violated */
INSERT INTO countries (country_id, country_name, region_id)
VALUES ('ddd' , 'kkk', 124124214);

/* Space problems */
