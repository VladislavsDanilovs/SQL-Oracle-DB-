/* INDEX

UNIQUE AND NON UNIQUE */
SELECT rowid FROM employees WHERE first_name = 'John';
/* That way index using rowid finds rows.
Rowid is encrypted.*/
SELECT * FROM employees WHERE rowid = 'AAAR6sAAEAAAKrGAAK'; 

SELECT * FROM employees;
SELECT * FROM students;

CREATE INDEX in1 ON students(id);
INSERT INTO students VALUES (4, 'Zaur', 3, 1);
INSERT INTO students VALUES (5, 'Naur', 3, 1);
INSERT INTO students VALUES (5, 'Baur', 3, 1);
INSERT INTO students VALUES (5, 'Baur', 3, 1);
DELETE FROM students WHERE id = '3';
CREATE UNIQUE INDEX in2 ON students(name);
CREATE UNIQUE INDEX in3 ON students(name, id);

CREATE UNIQUE INDEX st_in1 ON students(id);
CREATE UNIQUE INDEX f_in1 ON faculties(id);
CREATE UNIQUE INDEX st_in2 ON students(course);
CREATE INDEX st_in3 ON students(name);

ALTER TABLE students ADD CONSTRAINT st_pk PRIMARY KEY (id);
ALTER TABLE faculties ADD CONSTRAINT f_pk PRIMARY KEY (id);
ALTER TABLE students ADD CONSTRAINT st_un UNIQUE (course);
ALTER TABLE students ADD CONSTRAINT st_fk FOREIGN KEY (faculty_id)
REFERENCES faculties(id);

/* BITMAP */
CREATE BITMAP INDEX b_ind1 ON students(faculty_id);
SELECT * FROM v$version;