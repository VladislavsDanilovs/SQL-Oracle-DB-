/* Homework Nr.12 (CONSTRAINT AND INDEX)*/

/* 1. */
CREATE TABLE address (
id integer CONSTRAINT ad_id UNIQUE,
country varchar2(30),
city varchar2(30)
);

/* 2. */
CREATE TABLE friends (
id integer,
name varchar2(15),
email varchar2(30),
address_id integer CONSTRAINT friends_address_fk 
REFERENCES address(id) ON DELETE SET NULL,
birthday date,
CONSTRAINT check1 CHECK (LENGTH(name) > 3)
);

/* 3. */
CREATE UNIQUE INDEX friends_id_index ON friends(id);

/* 4. */
ALTER TABLE friends ADD CONSTRAINT fr_id_pk PRIMARY KEY (id);

/* 5. */
CREATE INDEX fr_email_in ON friends(email);

/* 6. */
ALTER TABLE friends MODIFY (email CONSTRAINT fr_email_nn NOT NULL);

/* 7. */
DROP TABLE friends;

/* 8. */
DROP TABLE adress;