/* 1. */
CREATE TABLE test200 (
test_id integer,
name1 varchar2(25),
name2 varchar2(25),
address1 varchar2(50),
address2 varchar2(50)
);

SELECT * FROM test200;
INSERT INTO test200 (name1, name2, address1, address2) 
VALUES('Bubba', 'Bubba', 'Malienas10', 'Malienas10');

/* 2. */
UPDATE test200 SET &column = '&value' WHERE id=&id;

/* 3. */
SELECT * FROM test200 
WHERE name1 LIKE '&&name' AND name2 LIKE '&name'
AND address1 LIKE '&&address' AND address2 LIKE '&address';


/* 4. */
DEFINE;
UNDEFINE NAME;
UNDEFINE ADDRESS;