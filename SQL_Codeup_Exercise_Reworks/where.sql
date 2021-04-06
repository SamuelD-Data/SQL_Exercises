-- Where --

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. --
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE FIRST_NAME IN ('IRENA', 'VIDYA', 'MAYA');

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. --
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE FIRST_NAME = 'IRENA' OR FIRST_NAME = 'VIDYA' OR FIRST_NAME = 'MAYA';

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. --
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE (FIRST_NAME = 'IRENA' OR FIRST_NAME = 'VIDYA' OR FIRST_NAME = 'MAYA') AND GENDER = 'M';

-- Find all current or previous employees whose last name starts with 'E'. --
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE LAST_NAME LIKE 'E%';

-- Find all current or previous employees whose last name starts or ends with 'E'. -- 
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE LAST_NAME LIKE 'E%' OR LAST_NAME LIKE '%E';

-- How many employees have a last name that ends with E, but does not start with E? --
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE LAST_NAME NOT LIKE 'E%' AND LAST_NAME LIKE '%E';

-- Find all current or previous employees employees whose last name starts and ends with 'E'. --
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE LAST_NAME LIKE 'E%' AND LAST_NAME LIKE '%E';

-- How many employees' last names end with E, regardless of whether they start with E? --
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '%E';

-- Find all current or previous employees hired in the 90s. --
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE HIRE_DATE BETWEEN '1990-01-01' AND '1999-12-31';

-- Find all current or previous employees born on Christmas. -- 
SELECT FIRST_NAME, LAST_NAME, BIRTH_DATE
FROM employees
WHERE BIRTH_DATE LIKE '%-12-25';

-- Find all current or previous employees hired in the 90s and born on Christmas. -- 
SELECT FIRST_NAME, LAST_NAME, BIRTH_DATE, HIRE_DATE
FROM employees
WHERE BIRTH_DATE LIKE '%-12-25' AND HIRE_DATE BETWEEN '1990-01-01' AND '1999-12-31';

-- Find all current or previous employees with a 'q' in their last name. -- 
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '%Q%'

-- Find all current or previous employees with a 'q' in their last name but not 'qu'. --
SELECT FIRST_NAME, LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '%Q%' AND LAST_NAME NOT LIKE '%QU%'