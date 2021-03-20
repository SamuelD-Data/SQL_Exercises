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

/*
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
Truncate your answer to 4 decimal places.
*/
SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

/*
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is 
less than 137.2345. Round your answer to 4 decimal places.
*/
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

/*
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. 
Round your answer to 4 decimal places.
*/
SELECT ROUND(MIN(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7780;

/*
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION 
is greater than 38.7780. Round your answer to 4 decimal places.
*/
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780)

/*
Consider P1(A,B) and P2(C,D) to be two points on a 2D plane.
 A happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 B happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 C happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 D happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/
SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4) 
FROM STATION;

/*
Consider P1(A,B) and P2(C,D) to be two points on a 2D plane where (A,B) are the respective minimum and 
maximum values of Northern Latitude (LAT_N) and (C,D) are the respective minimum and maximum values of 
Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.
*/
SELECT ROUND(SQRT(POWER(MIN(LAT_N) - MAX(LAT_N), 2) + POWER(MIN(LONG_W) - MAX(LONG_W), 2)), 4)
FROM STATION;

/*
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/
SELECT DISTINCT 
CAST(PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY LAT_N) OVER() AS DECIMAL(10,4)) 
FROM STATION;

