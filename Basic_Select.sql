-- SQL Basic Select - HackerRank Star 1 --

/*
Query all columns for all American cities in the CITY table with populations larger than 100000. 
*/
SELECT *
FROM CITY
WHERE (COUNTRYCODE = "USA") and (POPULATION > 100000);

/*
Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
*/
SELECT name 
from CITY
WHERE (COUNTRYCODE = "USA") and (POPULATION > 120000);

/*
Query all columns (attributes) for every row in the CITY table.
*/
SELECT *
FROM CITY;

/*

*/