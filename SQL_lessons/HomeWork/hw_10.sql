/* Home work Nr.10 
SELECT, UPDATE, DELETE, INSERT, MERGE (DML),
TRANSACTIONS (TCL)*/

/* Nr.1 */
CREATE TABLE locations2 AS
(SELECT * FROM locations WHERE 1 = 2);

/* Nr.2 */
SELECT * FROM locations;
SELECT * FROM locations2;

INSERT INTO locations2 
(SELECT * FROM locations WHERE country_id = 'IT');

/* Alternative solution */
INSERT INTO locations2 (location_id, street_address, city, country_id)
VALUES (3300, '1314 Sezam', 'Milan', 'IT');
INSERT INTO locations2 (location_id, street_address, city, country_id)
VALUES (3400, '1516 Pushkin', 'Turin', 'IT');

/* Nr.3 */
commit;

/* Nr.4 */
INSERT INTO locations2 VALUES (1200, 'De lamour 12',214142, INITCAP('paris'), null, UPPER('fr'));
INSERT INTO locations2 VALUES (1201, 'De lampa 12',214143, INITCAP('Paris'), null, UPPER('fr'));

/* Nr.5 */
commit;

/* Nr.6 */
INSERT INTO locations2
(SELECT * FROM locations WHERE LENGTH(state_province)>9);

/* Nr.7 */
commit;

/* Nr.8 */
CREATE TABLE locations4europe AS
(SELECT * FROM locations WHERE 1=2);

/* Nr.9 */
SELECT * FROM locations4europe;
SELECT * FROM locations;
SELECT * FROM countries;

INSERT INTO locations2 
(SELECT * FROM locations);
INSERT INTO locations4europe 
(SELECT * FROM locations WHERE country_id IN 
(SELECT countries.country_id FROM countries WHERE region_id = 1 ));

/* Correct solution*/
INSERT ALL
WHEN 1 = 1 THEN 
INTO locations2
VALUES (location_id, street_address, postal_code, city, state_province, country_id)
WHEN country_id IN
(SELECT country_id FROM countries WHERE region_id = 1) THEN
INTO locations4europe (location_id, street_address, city, country_id)
VALUES (location_id, street_address, city, country_id)
SELECT * FROM locations;


/* My second attempt, after inspecting correct solution */
SELECT * FROM locations4europe;
SELECT * FROM locations;
SELECT * FROM locations2;
SELECT * FROM countries;

INSERT ALL 
WHEN 5 = 5 THEN 
INTO locations2 VALUES (location_id, street_address, postal_code, city, state_province, country_id)
WHEN country_id IN (SELECT country_id FROM countries WHERE region_id = 1) THEN
INTO locations4europe VALUES (location_id, street_address, postal_code,city, state_province ,country_id)
SELECT * FROM locations;



/* Nr.10 */
commit;

/* Nr.11 */
SELECT * FROM locations2;

UPDATE locations2 SET postal_code = 777 WHERE postal_code IS NULL;

/* Nr.12 */
rollback;

/* Nr.13 */
SELECT * FROM locations;
SELECT * FROM locations2;

UPDATE locations2 SET postal_code = 
(SELECT postal_code FROM locations WHERE location_id = 2600)
WHERE postal_code IS NULL;

/* Nr.14 */
commit;

/* Nr.15 */
SELECT * FROM locations2;

DELETE FROM locations2 WHERE country_id = 'IT';

/* Nr.16 */
SAVEPOINT deleteIT;

/* Nr.17 */
UPDATE locations2 SET street_address = 'Sezam st. 18' 
WHERE location_id > 2500;

/* Nr.18 */
SAVEPOINT updateStreet;

/* Nr.19 */
DELETE FROM locations2 WHERE street_address = 'Sezam st.18';

/* Nr.20 */
ROLLBACK TO SAVEPOINT deleteIT;

/* Nr.21 */
commit;















