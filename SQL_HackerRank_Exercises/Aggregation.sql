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