-- Aggregation --

/*
Query a count of the number of cities in CITY having a Population larger than 100,000.
*/
SELECT COUNT(NAME)
FROM CITY
WHERE POPULATION > 100000;

/*
Query the total population of all cities in CITY where District is California.
*/
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT LIKE 'California';

/*
Query the average population of all cities in CITY where District is California.
*/
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT LIKE 'California';

/*
Query the average population for all cities in CITY, rounded down to the nearest integer.
*/
SELECT ROUND(AVG(POPULATION))
FROM CITY;

/*
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
*/
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE LIKE ('JPN');

/*
Query the difference between the maximum and minimum populations in CITY.
*/
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;

/*
Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of  decimal places.
The sum of all values in LONG_W rounded to a scale of  decimal places.
*/
SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2)
FROM STATION;

/*
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
but did not realize her keyboard's 0 key was broken until after completing the calculation. 
She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), 
and the actual average salary.
Write a query calculating the amount of error (i.e.:  average monthly salaries), 
and round it up to the next integer.
*/
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES;

/*
We define an employee's total earnings to be their monthly salary x months worked, 
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees 
who have maximum total earnings. Then print these values as  space-separated integers.
*/
SELECT SALARY * MONTHS AS MAX_EARN, COUNT(*)
FROM EMPLOYEE
GROUP BY MAX_EARN
ORDER BY MAX_EARN DESC
LIMIT 1;

/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and 
less than 137.2345. Truncate your answer to 4 decimal places.
*/
SELECT ROUND(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;

