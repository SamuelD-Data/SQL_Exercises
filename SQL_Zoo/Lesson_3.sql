-- Lesson 3 --

-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'. --

select name 
from world
where continent = 'europe' and gdp / population > (select gdp / population from world where name = 'united kingdom')

-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country. --

select name, continent
from world
where continent in (select continent from world where name in ('argentina', 'australia'))

-- Which country has a population that is more than Canada but less than Poland? Show the name and the population. --

select name, population
from world
where population > (select population from world where name = 'canada')
and population < (select population from world where name = 'poland')

-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values) --

select name
from world
where gdp > (select max(gdp) from world where continent = 'europe')

-- Find the largest country (by area) in each continent, show the continent, the name and the area: --

select continent, name, area
from world a
where area >= all (select area from world b where a.continent = b.continent and area > 0)

-- alternate approach --

select cont, name, mar
from world as oldtable
join (select max(area) as mar, continent as cont
from world
group by continent) as newtable
on (oldtable.continent = newtable.cont) and (oldtable.area = newtable.mar)



