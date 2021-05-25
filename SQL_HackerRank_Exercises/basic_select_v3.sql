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

select distinct city
from station
where mod(id, 2) = 0

-- Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table. --

select (select count(*) from station) - count(distinct city)
from station

-- Query the two cities in STATION with the shortest and longest CITY names, 
-- as well as their respective lengths (i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. 

select city, length(city)
from station
where length(city) = (select max(length(city)) from station)
order by city
limit 1;

select city, length(city)
from station
where length(city) = (select min(length(city)) from station)
order by city
limit 1;

-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. --

select distinct city
from station
where substr(city, 1, 1) in ('a', 'e', 'i', 'o', 'u')

-- Alt solution

select distinct city
from station
where left(city, 1) in ('a', 'e', 'i', 'o', 'u')

-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates. --

select distinct city
from station
where right(city, 1) in ('a', 'e', 'i', 'o', 'u')

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. --
-- Your result cannot contain duplicates. --

select distinct city
from station
where right(city, 1) in ('a', 'e', 'i', 'o', 'u')
and left(city, 1) in ('a', 'e', 'i', 'o', 'u')

-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates. --

select distinct city
from station
where left(city, 1) not in ('a', 'e', 'i', 'o', 'u')

-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates. --

select distinct city
from station
where right(city, 1) not in ('a', 'e', 'i', 'o', 'u')

-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
-- Your result cannot contain duplicates.

select distinct city
from station
where right(city, 1) not in ('a', 'e', 'i', 'o', 'u')
or left(city, 1) not in ('a', 'e', 'i', 'o', 'u')

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

select distinct city
from station
where right(city, 1) not in ('a', 'e', 'i', 'o', 'u')
and left(city, 1) not in ('a', 'e', 'i', 'o', 'u')

-- Query the Name of any student in STUDENTS who scored higher than 75 Marks. 
-- Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
-- secondary sort them by ascending ID.

select name
from students
where marks > 75
order by right(name, 3), id

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order. --

select name
from employee
order by name

-- 