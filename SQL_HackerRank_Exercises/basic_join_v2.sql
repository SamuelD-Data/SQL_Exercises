-- Basic Join V2 --

-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'. --

select sum(city.population)
from city
join country on city.countrycode = country.code 
where continent = 'asia'

-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'. --

select city.name
from city
join country on city.countrycode = country.code 
where continent = 'africa'

-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations --
-- (CITY.Population) rounded down to the nearest integer. --

select continent, round(avg(city.population))
from city
join country on city.countrycode = country.code 
group by continent

-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) --
-- and their respective average city populations (CITY.Population) rounded down to the nearest integer. --

select continent, floor(avg(city.population))
from city
join country on city.countrycode = country.code 
group by continent

/*
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
Write a query to help Eve.
*/

select case when grade < 8 then null else name end, grade, marks
from students
join grades 
where marks between min_mark and max_mark
order by grade desc, name, marks

/*
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/

