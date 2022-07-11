/* SYNONYM  
Using synonym we can rename tables or view, and move tables (contingently) to the schema that 
belongs to the user which got access to this table.

Synonym can be PUBLIC or PRIVATE.
1. Private synonym that is schema objects that is located in the same namespace as tables, view, etc.
When we use private synonym we should write: schemaname.synonymname.

2. Public synonym are beyond the schema, they located in public namespace, and
writes without schemaname, only synonymname (if we got access to it).
*/

SELECT * FROM hr.employees@xepdb1;

SELECT * FROM students;
DROP TABLE students;

CREATE SYNONYM syn1 FOR students;
SELECT * FROM syn1;
DELETE FROM syn1 WHERE  id = 4;

CREATE PUBLIC SYNONYM syn1 FOR employees;
SELECT * FROM syn1;

DROP PUBLIC SYNONYM syn1;

/* Or we just can run select with that synonym and it will be autocomplied */
ALTER SYNONYM syn1 compile;