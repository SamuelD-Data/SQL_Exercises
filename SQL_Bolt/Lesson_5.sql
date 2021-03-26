-- Lesson 5 (Review of Lessons 1 - 4) --

/*
List all the Canadian cities and their populations
*/
SELECT * 
FROM NORTH_AMERICAN_CITIES
WHERE COUNTRY LIKE 'CANADA';

/*
Order all the cities in the United States by their latitude from north to south
*/
SELECT * 
FROM NORTH_AMERICAN_CITIES
WHERE COUNTRY LIKE 'UNITED STATES'
ORDER BY LATITUDE DESC;

/*
List all the cities west of Chicago, ordered from west to east
*/
SELECT *
FROM NORTH_AMERICAN_CITIES
WHERE LONGITUDE < (SELECT LONGITUDE FROM NORTH_AMERICAN_CITIES WHERE CITY LIKE 'CHICAGO')
ORDER BY LONGITUDE;

/*
List the two largest cities in Mexico (by population)
*/
SELECT * 
FROM NORTH_AMERICAN_CITIES
WHERE COUNTRY LIKE 'MEXICO'
ORDER BY POPULATION DESC
LIMIT 2;

/*
List the third and fourth largest cities (by population) in the United States and their population
*/
SELECT * 
FROM NORTH_AMERICAN_CITIES
WHERE COUNTRY LIKE 'UNITED STATES'
ORDER BY POPULATION DESC
LIMIT 2 OFFSET 2;