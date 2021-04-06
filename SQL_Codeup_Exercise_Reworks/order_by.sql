-- Order By --

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. --   
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE FIRST_NAME = 'IRENA' OR FIRST_NAME = 'VIDYA' OR FIRST_NAME = 'MAYA'
ORDER BY FIRST_NAME;

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. -- 
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE FIRST_NAME = 'IRENA' OR FIRST_NAME = 'VIDYA' OR FIRST_NAME = 'MAYA'
ORDER BY FIRST_NAME, LAST_NAME;

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. --   
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE FIRST_NAME = 'IRENA' OR FIRST_NAME = 'VIDYA' OR FIRST_NAME = 'MAYA'
ORDER BY LAST_NAME, FIRST_NAME;

-- Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. --  
SELECT FIRST_NAME, LAST_NAME, EMP_NO
FROM employees
WHERE LAST_NAME LIKE 'E%' AND LAST_NAME LIKE '%E'
ORDER BY EMP_NO;

-- Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. -- 
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM employees
WHERE LAST_NAME LIKE 'E%' AND LAST_NAME LIKE '%E'
ORDER BY HIRE_DATE DESC;

-- Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. -- 
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, BIRTH_DATE
FROM employees
WHERE (HIRE_DATE BETWEEN '1990-01-01-' AND '1999-12-31') AND BIRTH_DATE LIKE '%-12-25'
ORDER BY BIRTH_DATE, HIRE_DATE DESC;
