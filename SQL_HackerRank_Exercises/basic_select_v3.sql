-- Basic Select V3 --

-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA. --

select *
from city
where population > 100000
and countrycode = 'USA'

-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA. --

select name
from city
where population > 120000
and countrycode = 'USA'

-- Query all columns (attributes) for every row in the CITY table. --

select * from city

-- Query all columns for a city in CITY with the ID 1661. --

select *
from city
where id = 1661

-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN. --

select *
from city
where countrycode = 'JPN'

-- Query a list of CITY and STATE from the STATION table. -- 

select city, state
from station

-- Query a list of CITY names from STATION for cities that have an even ID number. 
-- Print the results in any order, but exclude duplicates from the answer. 

