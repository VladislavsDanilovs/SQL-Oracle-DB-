/* 2. NOT NULL CONSTRAINT*/
/* 
a. You can't create COMPOSITE NOT NULL constraints 
b. You can't write NOT NULL constraint on TABLE LEVEL
c. You can't ALTER table using ADD keyword to create NOT NULL constraint 
(but with MODIFY you can)
*/

CREATE TABLE students (
id number,
name varchar2(15),
course number CONSTRAINT stud_course_notnull NOT NULL,
faculty_id integer
);

CREATE TABLE faculties (
id number primary key,
name varchar2(15)
);

DROP TABLE students;
DROP TABLE faculties;

SELECT * FROM students;
INSERT INTO students VALUES (1, 'zaur', null, 2);
INSERT INTO students VALUES (5, 'Naur', 2, 1);

ALTER TABLE students MODIFY (course CONSTRAINT st_course_notnull NOT NULL);
/* To remove NOT NULL constraint you can write: */
ALTER TABLE students MODIFY (course CONSTRAINT st_course_notnull NULL);

/*3. PRIMARY KEY CONSTRAINT */

CREATE TABLE students (
id number CONSTRAINT st_id_pk PRIMARY KEY,
name varchar2(15),
course number ,
faculty_id integer
);

/* 4. FOREIGN KEY CONSTRAINT */
SELECT * FROM faculties;
SELECT * FROM students;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM USER_CONSTRAINTS;

/* IN LINE LEVEL */
CREATE TABLE students (
id number,
name varchar2(15),
course number CONSTRAINT stud_course_notnull NOT NULL,
faculty_id integer CONSTRAINT st_faculty_fk REFERENCES faculties(id)
);

/* TABLE LEVEL */
CREATE TABLE students (
id number,
name varchar2(15),
course number CONSTRAINT stud_course_notnull NOT NULL,
faculty_id integer,
CONSTRAINT st_faculty_fk FOREIGN KEY(faculty_id) REFERENCES faculties(id)
);

INSERT INTO faculties VALUES (1, 'CS');
INSERT INTO faculties VALUES (2, 'Marketing');

ALTER TABLE students MODIFY (CONSTRAINT fk faculty_id REFERENCES faculties(id));
ALTER TABLE students MODIFY (faculty_id CONSTRAINT fk  REFERENCES faculties(id));

ALTER TABLE students ADD CONSTRAINT fk FOREIGN KEY (faculty_id) 
REFERENCES faculties(id);

/* ON DELETE for FOREIGN KEY */

CREATE TABLE students (
id number,
name varchar2(15),
course number ,
faculty_id integer REFERENCES faculties ON DELETE CASCADE
);

/* Or another option to do this
faculty_id integer REFERENCES faculties ON DELETE SET NULL
in this case we will set null to all deleted rows
*/ 

CREATE TABLE faculties (
id number PRIMARY KEY,
name varchar2(15)
);

INSERT INTO faculties VALUES (1, 'CS');
INSERT INTO faculties VALUES (2, 'Marketing');
INSERT INTO faculties VALUES (3, 'Philology');

INSERT INTO students VALUES (1, 'Ivan', 3, 1);
INSERT INTO students VALUES (2, 'Zaur', 2, 2);
INSERT INTO students VALUES (3, 'Naur', 1, 1);

/* We cant delete rows on which referencing another columns 
(Exception: we can use ON DELETE CASCADE when creating table) */
DELETE FROM faculties WHERE id = 1;

SELECT * FROM students;
SELECT * FROM faculties;

/* 5. CHECK CONSTRAINT */

CREATE TABLE students (
id number,
name varchar2(15),
course number CONSTRAINT ch CHECK (course>0 AND course<6),
faculty_id integer
);
/* On table level we can write following constraint: */
CREATE TABLE students (
id number,
name varchar2(15),
course number ,
email varchar(15) CHECK (INSTR(email, '@')>0) UNIQUE,
faculty_id integer,
CONSTRAINT ch CHECK (course>0 AND course>id)
);


CREATE TABLE faculties (
id number PRIMARY KEY,
name varchar2(15)
);

ALTER TABLE students MODIFY (id CONSTRAINT ch CHECK (id >= 1));
ALTER TABLE students add CONSTRAINT ch CHECK (course < 30));