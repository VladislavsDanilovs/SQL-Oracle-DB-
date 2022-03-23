/* SET OPERATORS */
/* UNION ALL */
/* Union ALL not deleting duplicates and also doesn't sort values */
SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT * FROM jobs WHERE job_id LIKE '%MAN%';

/* Query block has incorrect number of result columns */
SELECT job_id, job_title FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT job_id, job_title, min_salary FROM jobs WHERE job_id LIKE '%MAN%';

/* We cannot sort inner querry (min2), only outer query (min1) */
SELECT job_id, job_title, min_salary min1 FROM jobs WHERE job_id LIKE '%MAN%'
UNION ALL
SELECT job_id, job_title, min_salary min2 FROM jobs WHERE job_id LIKE '%MAN%'
ORDER BY min1 DESC;

SELECT first_name, last_name, salary FROM employees WHERE employee_id>200
UNION ALL
SELECT job_id, job_title, max_salary FROM jobs WHERE job_id LIKE '%MAN%';

SELECT country_id FROM countries
UNION ALL
SELECT country_name FROM countries;

/* UNION */
/* Union deleted all duplicates and sorted */ 
SELECT * FROM jobs WHERE job_id LIKE '%MAN%'
UNION
SELECT * FROM jobs WHERE job_id LIKE '%MAN%';

SELECT * FROM jobs WHERE min_salary BETWEEN 4500 AND 8000
UNION
SELECT * FROM jobs WHERE min_salary BETWEEN 10000 AND 15000
ORDER BY 3;