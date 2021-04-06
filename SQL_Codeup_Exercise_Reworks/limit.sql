-- Limit -- 

/*
MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. 
For example, to find all the unique titles within the company, we could run the following query:
SELECT DISTINCT title FROM titles;

List the first 10 distinct last name sorted in descending order.
*/
SELECT DISTINCT LAST_NAME
FROM employees
ORDER BY LAST_NAME DESC
LIMIT 10;

/*
Find all previous or current employees hired in the 90s and born on Christmas. 
Find the first 5 employees hired in the 90's by sorting by hire date 
and limiting your results to the first 5 records. 
*/
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, BIRTH_DATE
FROM employees
WHERE (HIRE_DATE BETWEEN '1990-01-01-' AND '1999-12-31') AND BIRTH_DATE LIKE '%-12-25'
ORDER BY HIRE_DATE
LIMIT 5;

/*
Try to think of your results as batches, sets, or pages. 
The first five results are your first page. 
The five after that would be your second page, etc. 
Update the query to find the tenth page of results.
*/
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, BIRTH_DATE
FROM employees
WHERE (HIRE_DATE BETWEEN '1990-01-01-' AND '1999-12-31') AND BIRTH_DATE LIKE '%-12-25'
ORDER BY HIRE_DATE
LIMIT 5 OFFSET 45;