/* Objects types*/
SELECT * FROM dba_objects;
SELECT * FROM user_objects;

SELECT object_type, COUNT(object_type) FROM user_objects
GROUP BY object_type ORDER BY object_type;

SELECT object_type, COUNT(object_type) FROM all_objects
GROUP BY object_type ORDER BY object_type;

SELECT table_name FROM user_tables;
SELECT column_name, data_type, nullable FROM user_tab_columns
WHERE table_name = 'DEPARTMENTS';

/* Rules of writing correct name for object and Namespaces*/
/* not correct, but still will work because of double quotes */
CREATE TABLE "3a bfafaw"(
id number
);
SELECT * FROM "3a bfafaw";
/*
1. length from 1 till 30 symbols
exception: database link.
2. Objects cannot be called as reserved word (FROM,WHERE,SELECT and etc.).
3. All names should start with letters.
4. Symbols that you can use: _ # $
5. Lowercase letters will be automaticly converted into upper case.
*/

/* Namespace */

/* Table, View, Sequence, Private synonym 
1.This objects has unique namespace for one user using schema.
2. Index object has it own namespace
3. Constraits has it own namespace
4. Public Synonym*/