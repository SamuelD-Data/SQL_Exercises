-- Group By -- 

-- In your script, use DISTINCT to find the unique titles in the titles table. --
SELECT DISTINCT TITLE
FROM titles;

-- Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY. --
SELECT LAST_NAME
FROM employees
GROUP BY LAST_NAME;

-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'. --
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE LAST_NAME LIKE 'E%E'
GROUP BY FIRST_NAME, LAST_NAME;

-- Write a query to find the unique last names with a 'q' but not 'qu'. --
SELECT LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '%Q%' AND LAST_NAME NOT LIKE '%QU%'
GROUP BY LAST_NAME;

-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name. --
SELECT COUNT(LAST_NAME)
FROM employees
WHERE LAST_NAME LIKE '%Q%' AND LAST_NAME NOT LIKE '%QU%'
GROUP BY LAST_NAME;

-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. -- 
-- Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. --
SELECT GENDER, COUNT(GENDER)
FROM employees
WHERE FIRST_NAME IN ('Irena', 'Vidya', 'Maya')
GROUP BY GENDER;

-- Using your query that generates a username for all of the employees, generate a count employees for each unique username. --
SELECT LOWER(CONCAT(SUBSTR(FIRST_NAME,1,1), 
					SUBSTR(LAST_NAME,1,4), 
					'_', 
					SUBSTR(BIRTH_DATE,6,2), 
					SUBSTR(BIRTH_DATE,3,2)))
					AS USERNAME, COUNT(EMP_NO) AS USERS_WITH_UN_COUNT
FROM employees
GROUP BY USERNAME

-- BONUS: How many duplicate usernames are there? --
SELECT LOWER(CONCAT(SUBSTR(FIRST_NAME,1,1), 
					SUBSTR(LAST_NAME,1,4), 
					'_', 
					SUBSTR(BIRTH_DATE,6,2), 
					SUBSTR(BIRTH_DATE,3,2)))
					AS USERNAME, COUNT(EMP_NO) AS USER_COUNT
FROM employees
GROUP BY USERNAME
HAVING USER_COUNT > 1;

-- 13251 DUPLICATE USERNAMES -- 