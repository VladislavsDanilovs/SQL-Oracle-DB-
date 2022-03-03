/* NESTED SINGLE-ROW FUNCTIONS */
SELECT LENGTH(UPPER(SYSDATE)) FROM dual;
SELECT SUBSTR(SYSDATE, 4) FROM dual;
SELECT first_name, LENGTH(first_name), ROUND(123.456788, LENGTH(first_name)) FROM employees;
SELECT first_name, employee_id, LENGTH(employee_id), 
SUBSTR(first_name,LENGTH(employee_id)), 
LENGTH(SUBSTR(first_name, LENGTH(employee_id)))FROM employees;

SELECT TO_DATE('18-09-87', 'DD-MM-RR'),
TO_CHAR(TO_DATE('18-09-87', 'DD-MM-RR'), 'DAY')
, LENGTH(TO_CHAR(TO_DATE('18-09-87', 'DD-MM-RR'), 'fmDAY')) FROM DUAL;

SELECT first_name, last_name, phone_number,
TO_NUMBER(SUBSTR(phone_number, INSTR(phone_number, '.')+1), '999.9999')* 10000
form_numb
FROM employees WHERE employee_id < 130;


/* GENERAL FUNCTIONS*/

/* if first parameter not null then NVL returns first parameter, but if it is null, then returns second parameter */
SELECT NVL(null, 19) FROM dual;

/* changing null value to 0 in our report: */
SELECT first_name, NVL(commission_pct, 0) FROM employees;
SELECT first_name, NVL(SUBSTR(first_name, 6), 'name is too short') FROM employees;
SELECT first_name, commission_pct, NVL(salary*commission_pct, 500) bonus FROM employees;

SELECT NVL2(17, 18, 19) FROM dual;
SELECT NVL2(null, 18, 19) FROM dual;

SELECT first_name, NVL2(commission_pct, commission_pct, 0) FROM employees;
SELECT first_name, NVL2(commission_pct, 'commission_pct exist','commission_pct doesnt exist') FROM employees;

SELECT NULLIF(18,18) FROM dual;
SELECT NULLIF(17,18) FROM dual;
SELECT NULLIF(15,TO_NUMBER(1||5, '99')) FROM dual;
SELECT NULLIF('18-SEP-87', '18/SEP/87') FROM dual;
SELECT NULLIF(TO_DATE('18-SEP-87'), TO_DATE('18/SEP/87')) FROM dual;

SELECT * FROM COUNTRIES;
SELECT country_id, country_name, 
NVL2(NULLIF(country_id, UPPER(SUBSTR(country_name, 1, 2))), 'No matches', 'Match found') FROM countries;

SELECT COALESCE(1, null, 2) FROM dual;
SELECT COALESCE(null, null,'ok', 'chkar') FROM dual;
SELECT COALESCE(null, null,null, null) FROM dual;

SELECT first_name, commission_pct, manager_id, salary,
COALESCE(commission_pct, manager_id, salary) as INFO
FROM employees;

/* CONDITIONAL FUNCTIONS */

/* DECODE */
SELECT DECODE(3*4, 12, 'twenty') FROM DUAL;
SELECT DECODE(3*4, 13, 'twenty') FROM DUAL;
SELECT DECODE(72, 13, 'thirteen', 14, 'fourteen', 15, 'fifteen', 'no matches') FROM DUAL;

SELECT DECODE(null, 5, 'ok', null, 55) FROM dual;
SELECT DECODE(2+2*2, 5, 'five', 12/2, 'six1', 6, 'six2') FROM dual;
SELECT first_name, commission_pct,
DECODE(commission_pct, null, 'no commission', 0.1, 'bad com', 0.4, 'good com', 'default com') 
FROM employees WHERE employee_id BETWEEN 140 AND 180;

/* SIMPLE CASE */
SELECT CASE 3*4 WHEN 12 THEN 'twelve' END FROM dual;
SELECT CASE 3*5 WHEN 12 THEN 'twelve' WHEN 11 THEN 'eleven' WHEN 24/2 THEN 'twelve2' 
ELSE 'not found' END FROM dual;

SELECT first_name, CASE LENGTH (first_name) WHEN 4 THEN 'very short name' 
WHEN 5 THEN 'short name' WHEN 6 THEN 'average name' ELSE 'not found' END FROM employees;

/* SEARCHED CASE */
SELECT CASE WHEN 3*4=12 THEN 'twelve' END FROM dual;

SELECT CASE  WHEN 3*5=12 THEN 'twelve' WHEN 'ok'='ok' THEN 'ok' WHEN 3*5=24/2 THEN 'twelve2' 
ELSE 'not found' END FROM dual;

SELECT first_name, salary, commission_pct,
CASE 
WHEN LENGTH(first_name)<=5 THEN 'condition #1 is true'
WHEN salary*10 > 100000 THEN 'condition #2 is true' 
WHEN commission_pct IS NOT NULL THEN 'condition #3 is true'
ELSE 'none of condtitions is suitable for this case'
END AS Case_Statement
FROM employees;