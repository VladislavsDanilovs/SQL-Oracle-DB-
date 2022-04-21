/* CONSTRAINT TYPES */
/* 1. UNIQUE */

/* IN LINE LEVEL*/
CREATE TABLE students (
id number CONSTRAINT st_id_unique UNIQUE,
name varchar2(15),
course number,
faculty_id integer,
avg_score number(5, 2),
start_date date,
scholarship integer
);

/* TABLE LEVEL */
CREATE TABLE students (
id number,
name varchar2(15),
course number,
faculty_id integer,
avg_score number(5, 2),
start_date date,
scholarship integer,
CONSTRAINT st_id_unique UNIQUE (id)
);
/* Writing key word CONSTRAINT and its name is NOT obligatory */

/* COMPOSITE CONSTRAINT */
CREATE TABLE students (
id number,
name varchar2(15),
course number,
faculty_id integer,
avg_score number(5, 2),
start_date date,
scholarship integer,
CONSTRAINT st_id_unique UNIQUE (id, name)
);

CREATE TABLE faculties (
id number,
name varchar2(15)
);

DROP TABLE students;
DROP TABLE faculties;

INSERT INTO students VALUES
(null, 'Zaur', 3,1, 8.7, TO_DATE('12.12.2012'), 1500);
INSERT INTO students VALUES
(1, 'Zaur', 3,1, 8.7, TO_DATE('12.12.2012'), 1500);
INSERT INTO students VALUES
(2, 'Maxim', 2,3, 6.2, TO_DATE('12.12.2019'), 256);

SELECT * FROM students;
SELECT * FROM faculties;

/* Creating CONSTRAINTS after table creation (ADD OR MODIFY) */
ALTER TABLE students ADD CONSTRAINT st_id_unique UNIQUE(id);
INSERT INTO faculties VALUES(1, 'CS');
INSERT INTO faculties VALUES(2, 'Economics');
INSERT INTO faculties VALUES(2, 'Philology');
ALTER TABLE faculties ADD UNIQUE(id);
UPDATE faculties SET id=3 WHERE name = 'Philology';

ALTER TABLE faculties MODIFY (id CONSTRAINT st_id_unique UNIQUE);
ALTER TABLE faculties MODIFY (id UNIQUE);

/* DELETING CONSTRAINTS */
ALTER TABLE students DROP CONSTRAINT st_id_unique;