
/* implicitly oracle uses numbet to_char */
SELECT LENGTH(123) FROM dual;

/* checking changed NLS parametrs*/
SELECT * FROM countries;
SELECT ADD_MONTHS('21-FEB-22', 3) FROM dual;
SELECT next_day('21-FEB-22', 'FRIDAY') FROM dual;

/* CONVERSION FUNCTIONS*/
/* TO_CHAR (number to char)*/
SELECT TO_CHAR(18, '99999') FROM dual;
SELECT TO_CHAR(18, '099999') FROM dual;
SELECT TO_CHAR(18.35, '099999.999') FROM dual;
SELECT TO_CHAR(18.35, '099999D999') FROM dual;
SELECT TO_CHAR(1234567, '99,999,999') FROM dual;
SELECT TO_CHAR(1234567, '99G999G999') FROM dual;
SELECT TO_CHAR(18, '$0999') FROM dual;
SELECT TO_CHAR(18, 'L0999') FROM dual;
SELECT TO_CHAR(-18, '999MI') FROM dual;
SELECT TO_CHAR(-18, '0999PR') FROM dual;
SELECT TO_CHAR(18, 'S0999') FROM dual;

SELECT first_name, salary*1.111, 
TO_CHAR(salary*1.111, '$999,999.99'), 
TO_CHAR(salary*1.111, '$9,999.99')
FROM employees;
SELECT TO_CHAR(0.18, '0.99') FROM dual;

/* TO_CHAR (date to char)*/
SELECT TO_CHAR('8-NOV-94') FROM dual;
SELECT TO_CHAR(SYSDATE , 'RR') FROM dual;
SELECT TO_CHAR(SYSDATE , 'YEAR') FROM dual;
SELECT TO_CHAR(SYSDATE , 'Month') FROM dual;

SELECT hire_date, TO_CHAR(hire_date, 'Month', 'NLS_DATE_LANGUAGE = LATVIAN') FROM employees;
/*using operator fm before Month to cut gaps between Month and HELLO!*/
SELECT hire_date, TO_CHAR(hire_date, 'fmMonth')||'HELLO!' FROM employees;

SELECT first_name,hire_date FROM employees WHERE TO_CHAR(hire_date, 'fmMonth') = 'November';

SELECT TO_CHAR(SYSDATE , 'd') FROM dual;
SELECT TO_CHAR(SYSDATE , 'DD') FROM dual;
SELECT TO_CHAR(SYSDATE , 'DDD') FROM dual;
SELECT TO_CHAR(SYSDATE , 'DY') FROM dual;
SELECT TO_CHAR(SYSDATE , 'DAY') FROM dual;
SELECT TO_CHAR(SYSDATE , 'W') FROM dual;
SELECT TO_CHAR(SYSDATE , 'ww') FROM dual;
SELECT TO_CHAR(SYSDATE , 'Q') FROM dual;
SELECT TO_CHAR(SYSDATE , 'CC') FROM dual;
/* now is PM or AM? if now is AM and we writing PM, we will get AM as output*/
SELECT TO_CHAR(SYSDATE , 'P.M.') FROM dual;
SELECT TO_CHAR(SYSDATE , 'HH:MI') FROM dual;
SELECT TO_CHAR(SYSDATE , 'MI') FROM dual;
SELECT TO_CHAR(SYSDATE , 'SS') FROM dual;
SELECT TO_CHAR(SYSDATE , 'SSSSS') FROM dual;
SELECT TO_CHAR(SYSDATE , 'fmDAY!Mon?yyyy') FROM dual;
SELECT TO_CHAR(SYSDATE , '"Quarter" Q" of "Year') FROM dual;
SELECT TO_CHAR(SYSDATE , 'DDth "of "mm') FROM dual;
SELECT TO_CHAR(SYSDATE , 'yyyySP mmSP sssssSP') FROM dual;
SELECT TO_CHAR(SYSDATE , 'MIthSP') FROM dual;
SELECT TO_CHAR(SYSDATE , '') FROM dual;

SELECT 'my colleague with ID =' || employee_id || ' and job_id =' || job_id 
|| ' joined us on ' || TO_CHAR(hire_date, 'fmDay "the "ddTH "of " fmMonth YYYY')
FROM employees;

/* TO_DATE(char to date)*/
SELECT TO_CHAR(TO_DATE('08-MAR-22'), 'dd-mon-yyyy hh24:mi:ss') FROM dual;
SELECT TO_DATE('08-MAR-2022') FROM dual;

SELECT TO_DATE('18:40 2019!17-Sep', 'HH24:mi yyyy!dd-Mon') FROM dual;

SELECT TO_CHAR(TO_DATE('21-Feb-22 14:36:32', 'dd-Mon-yy HH24:mi:ss'), 'dd-Mon-yy HH24:mi:ss') FROM dual;
/* fx in second parameter means, that 1st and 2nd parameters should be identical(letter to letter, case sensetive) */
SELECT TO_DATE('18-SEP-10', 'fxDD-MON-YYYY') FROM dual;

/* here we implicitply converting varchar to date, that is bad practice*/
SELECT * FROM employees WHERE hire_date > '01-JAN-05';

/* Better to use alternative solution like this:*/
SELECT * FROM employees WHERE hire_date > TO_DATE('01-JAN-05', 'dd-MON-RR');

SELECT TO_CHAR(TO_DATE('18-SEP-10', 'dd-MON-RR'), 'Month') FROM dual;

SELECT TO_CHAR(TO_DATE('15?1987$17$18$19/09', 'hh24?YYYY$MI$SS$DD/mm'), 'dd-MON-yyyy hh24:mi:ss') Alias  FROM DUAL;

/* TO_NUMBER(text to number)*/
SELECT TO_NUMBER('$4555.77', '$9999.999') FROM dual;
SELECT TO_NUMBER('4,555.77', '999,999.999') FROM dual;
SELECT TO_NUMBER('<4555.77>', '99999.999PR') FROM dual;
SELECT TO_CHAR(3.17, '99.9') FROM dual;

/* we cant round a text, so should use '99.99'*/
SELECT TO_NUMBER('3.17', '99.9') FROM dual;