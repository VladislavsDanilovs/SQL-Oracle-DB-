SELECT * FROM students;
INSERT INTO students VALUES (3, 'Nicloe', 1, 1);

/* SIMPLE VIEW */
/* You can perform DML comands */
CREATE VIEW v101 AS SELECT name, course FROM students;
SELECT * FROM v101;

INSERT INTO v101 VALUES ('VLadimir', 5);
DELETE FROM v101 WHERE name = 'VLadimir';

ALTER TABLE students MODIFY (id NOT NULL);

SELECT * FROM fin_emp2;
INSERT INTO fin_emp2 VALUES ('firefighter', 1000000);

CREATE VIEW v105 AS
SELECT SUBSTR(name, 2) name, course FROM students;
SELECT * FROM v105;
INSERT INTO v105 VALUES ('Michael', 3);
DELETE FROM v105 where name = 'aur';

/* KEYWORD DISTINCT makes VIEW as complex view */
CREATE VIEW v106 AS SELECT DISTINCT name, course FROM students;
SELECT * FROM v106;
INSERT INTO v106 VALUES ('Michael', 3);
DELETE FROM v106 where name = 'Ivan';

CREATE view v107 AS SELECT name n, course c FROM students;
INSERT INTO v107 VALUES ('Michael', 3);
SELECT * FROM v107;
ALTER TABLE students MODIFY (id NULL);

/* KEYWORD rownum makes VIEW as complex view */
CREATE VIEW v108 AS SELECT rownum r, name, course FROM students;
INSERT INTO v108 VALUES ('Patrik_star', 7);
SELECT * FROM v108;

SELECT * FROM students;
DROP TABLE students;

CREATE TABLE students(
id number, 
name varchar2(15),
course number
);

INSERT INTO students VALUES (1, 'Zaur', 3);
INSERT INTO students VALUES (2, 'Michael', 2);
INSERT INTO students VALUES (3, 'Robert', 4);
INSERT INTO students VALUES (4, 'Niko', 5);
INSERT INTO students VALUES (5, 'Patrik_Star', 1);

CREATE OR REPLACE VIEW fin_emp2 AS SELECT * FROM students;
SELECT * FROM fin_emp2;
CREATE FORCE VIEW v201 AS SELECT * FROM students2;
SELECT * FROM v201;

/* With check option. We cannot insert rows where course < 2 (we'll get an error)*/
CREATE VIEW v203 AS SELECT * FROM students WHERE course > 2 WITH CHECK OPTION;
SELECT * FROM v203;
INSERT INTO v203 VALUES (7, 'Peter', 3);
UPDATE v203 SET couse = 2 where name = 'Peter';

/* WITH READ ONLY. You can not use DML commands it this case.*/
CREATE VIEW v204 AS SELECT * FROM students WHERE course > 2 WITH READ ONLY;
SELECT * FROM v203;

CREATE VIEW v210 AS SELECT * FROM students
WITH READ ONLY CONSTRAINT constraint1;
INSERT INTO v210 VALUES (7, 'Peter', 3);

CREATE VIEW v211 (a, b, c) AS SELECT * FROM students;
SELECT * FROM v211;

CREATE FORCE VIEW v18 AS SELECT name, last_name FROM students;
SELECT * FROM v18;

ALTER TABLE students ADD (last_name varchar2(15));
ALTER VIEW v18 compile;
DROP VIEW v18;

CREATE VIEW v212 AS SELECT * FROM v211;

CREATE VIEW v301 AS SELECT * FROM students WHERE id > 4;
SELECT * FROM v301 WHERE name = 'Peter';