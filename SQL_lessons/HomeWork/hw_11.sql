/* Homework11*/

/* Nr.1. */
CREATE TABLE friends
AS
(SELECT employee_id id, first_name name, last_name surname FROM employees WHERE commission_pct IS NOT NULL);

SELECT * FROM friends;

/* Nr.2. */
ALTER TABLE friends ADD (email varchar2(50));

/* Nr.3. */
ALTER TABLE friends MODIFY (email varchar2(25) DEFAULT UPPER('no email'));

/* Nr.4. */
INSERT INTO friends (id, name, surname) VALUES (180, 'Sea', 'Villain');

/* Nr.5. */
ALTER TABLE friends RENAME COLUMN id TO friends_id;

/* Nr.6. */
DROP TABLE friends;

/* Nr.7. */
CREATE TABLE friends (
id integer, 
name varchar2(30), 
surname varchar2(30), 
email varchar2(50), 
salary integer DEFAULT 0, 
city varchar(20), 
birthday date DEFAULT SYSDATE);

/* Nr.8. */
SELECT * FROM friends;
INSERT INTO friends (id, name, surname, email, salary, city, birthday) 
VALUES (1, 'Maxim', 'Bread', 'maxim.bread@gmail.com', 202, 'Berdjansk', TO_DATE('19.01.2002'));

/* Nr.9. */
INSERT INTO friends (id, name, surname, email, city) 
VALUES (1, 'Maxim', 'Bread', 'maxim.bread@gmail.com',  'Berdjansk');

/* Nr.10. */
COMMIT;

/* Nr.11. */
ALTER TABLE friends DROP COLUMN salary;

/* Nr.12. */
ALTER TABLE friends SET UNUSED COLUMN email;

/* Nr.13. */
ALTER TABLE friends SET UNUSED COLUMN birthday;

/* Nr.14. */
ALTER TABLE friends DROP UNUSED COLUMNS;

/* Nr.15. */
ALTER TABLE friends READ ONLY;

/* Nr.16. */
UPDATE friends SET city = 'Riga';

/* Nr.17. */
ALTER TABLE friends READ WRITE;
TRUNCATE TABLE friends;

/* Nr.18. */
DROP TABLE friends;