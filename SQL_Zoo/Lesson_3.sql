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

-- List each continent and the name of the country that comes first alphabetically. --

select continent, name
from world a
where name = (select min(name) from world b where a.continent = b.continent)

-- Alternate approach --

select continent, min(name)
from world
group by continent

-- Find the continents where all countries have a population <= 25000000. --
-- Then find the names of the countries associated with these continents. Show name, continent and population. --

select name, continent, population
from world a 
where 25000000 >= all (select population from world b where a.continent = b.continent)

-- Some countries have populations more than three times that of any of their neighbours (in the same continent). --
-- Give the countries and continents. --

select name, continent
from world a
where population > all(select (population * 3) from world b where a.continent = b.continent and (a.name != b.name))


select a.name, a.continent 
from world a
join (select (population * 3) as pop3 from world b group by b.continent)
where a.population > pop3