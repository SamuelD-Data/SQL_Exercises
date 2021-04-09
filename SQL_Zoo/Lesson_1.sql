-- Lesson 1 --

--  Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros. --

select name
  FROM world
 WHERE population > 200000000

 -- Show the name and population in millions for the countries of the continent 'South America'. --
 -- Divide the population by 1000000 to get population in millions. --

select name, population / 1000000
FROM world
WHERE continent = 'South America'

-- Show the name and population for France, Germany, Italy --

select name, population
from world
where name in ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United' --

select name
from world
where name like '%united%'

-- Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million. --
-- Show the countries that are big by area or big by population. Show name, population and area. --

select name, population, area
from world
where population > 250000000
or area > 3000000

-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. --
-- Show name, population and area. --

select name, population, area
from world
where (population > 250000000 and  area <= 3000000)
or (population <= 250000000 and area > 3000000)

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. --
-- Use the ROUND function to show the values to two decimal places. --
select name, round(population / 1000000, 2), round(gdp / 1000000000, 2)
from world
where continent = 'south america'

-- Show the name and capital where the name and the capital have the same number of characters. --

select name,  capital
from world
where len(name) = len(capital)

-- Show the name and the capital where the first letters of each match. --
-- Don't include countries where the name and the capital are the same word. --

select name, capital
from world
where (left(name,1) = left(capital,1)) and name != capital

-- Find the country that has all the vowels and no spaces in its name. --

SELECT name
FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name not like '% %'