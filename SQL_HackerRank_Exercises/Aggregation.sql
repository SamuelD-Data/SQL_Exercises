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