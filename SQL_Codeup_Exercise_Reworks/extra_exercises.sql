-- Extra Exercises --

-- What languages are spoken in Santa Monica? -- 

SELECT LANGUAGE, NAME
FROM countrylanguage
JOIN city ON countrylanguage.COUNTRYCODE = city.COUNTRYCODE
WHERE NAME = 'SANTA MONICA';

-- How many different countries are in each region? -- 

SELECT COUNT(*), REGION
FROM country
GROUP BY REGION;

-- What is the population for each region? -- 

SELECT SUM(POPULATION), REGION
FROM country
GROUP BY REGION;

-- What is the population for each continent? -- 

SELECT SUM(POPULATION), CONTINENT
FROM country
GROUP BY CONTINENT;

-- What is the average life expectancy globally? -- 

SELECT AVG(LIFEEXPECTANCY)
FROM country;

-- What is the average life expectancy for each region? Sort the results from shortest to longest --

SELECT REGION, AVG(LIFEEXPECTANCY) as AVG_LIFE_EXPECTANCY
FROM country
GROUP BY REGION
ORDER BY AVG_LIFE_EXPECTANCY;

-- What is the average life expectancy for each continent? Sort the results from shortest to longest -- 

SELECT CONTINENT, AVG(LIFEEXPECTANCY) as AVG_LIFE_EXPECTANCY
FROM country
GROUP BY CONTINENT
ORDER BY AVG_LIFE_EXPECTANCY;

-- Find all the countries whose local name is different from the official name -- 

SELECT NAME, LOCALNAME
FROM country
WHERE NAME != LOCALNAME;

-- How many countries have a life expectancy less than x? -- 

SELECT COUNT(*)
FROM country
WHERE LIFEEXPECTANCY < 50;

-- What region of the world is city x located in? -- 

SELECT REGION
FROM country
JOIN city ON country.CODE = city.COUNTRYCODE
WHERE city.NAME = 'SANTA MONICA';

-- What country (use the human readable name) city x located in? -- 

SELECT country.NAME
FROM country
JOIN city ON country.CODE = city.COUNTRYCODE
WHERE city.NAME = 'SANTA MONICA';


-- What is the life expectancy in city x? -- 

SELECT LIFEEXPECTANCY
FROM country
JOIN city ON country.CODE = city.COUNTRYCODE
WHERE city.NAME = 'SANTA MONICA';