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

-- Display the first and last names in all lowercase of all the actors. --

SELECT LOWER(FIRST_NAME), LOWER(LAST_NAME)
FROM actor;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe."  -- 
-- What is one query would you could use to obtain this information? -- 
SELECT ACTOR_ID, FIRST_NAME, LAST_NAME
FROM actor
WHERE FIRST_NAME = 'JOE';

-- Find all actors whose last name contain the letters "gen": -- 

SELECT FIRST_NAME, LAST_NAME
FROM actor
WHERE LAST_NAME LIKE '%GEN%';

-- Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order. -- 

SELECT FIRST_NAME, LAST_NAME
FROM actor
WHERE LAST_NAME LIKE '%LI%'
ORDER BY LAST_NAME, FIRST_NAME;

-- Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China: -- 

SELECT COUNTRY_ID, COUNTRY
FROM country
WHERE COUNTRY IN ('Afghanistan', 'Bangladesh', 'China');

-- List the last names of all the actors, as well as how many actors have that last name. -- 

SELECT LAST_NAME, COUNT(*)
FROM actor
GROUP BY LAST_NAME;

-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors -- 

SELECT LAST_NAME, COUNT(*)
FROM actor
GROUP BY LAST_NAME
HAVING COUNT(*) > 1;

-- You cannot locate the schema of the address table. Which query would you use to re-create it? -- 

SHOW CREATE DATABASE address;

-- Use JOIN to display the first and last names, as well as the address, of each staff member. -- 

SELECT FIRST_NAME, LAST_NAME
FROM staff
JOIN address USING(ADDRESS_ID);

-- Use JOIN to display the total amount rung up by each staff member in August of 2005. -- 

SELECT FIRST_NAME, SUM(AMOUNT)
FROM payment
JOIN staff ON payment.STAFF_ID = staff.STAFF_ID
WHERE SUBSTR(PAYMENT_DATE, 1, 7) = '2005-08'
GROUP BY FIRST_NAME;

-- List each film and the number of actors who are listed for that film. --

SELECT TITLE, COUNT(ACTOR_ID)
FROM film
JOIN film_actor ON film.FILM_ID = film_actor.FILM_ID
GROUP BY TITLE;

-- How many copies of the film Hunchback Impossible exist in the inventory system? -- 

SELECT TITLE, COUNT(*)
FROM film
JOIN inventory ON film.FILM_ID = inventory.FILM_ID
WHERE TITLE = 'HUNCHBACK IMPOSSIBLE'
GROUP BY TITLE;

-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. -- 
-- As an unintended consequence, films starting with the letters K and Q have also soared in popularity. -- 
-- Use subqueries to display the titles of movies starting with the letters K and Q whose language is English. -- 

SELECT TITLE
FROM film
JOIN language on film.LANGUAGE_ID = language.LANGUAGE_ID
WHERE (TITLE LIKE 'K%' OR TITLE LIKE 'Q%') AND NAME = "ENGLISH";

-- Use subqueries to display all actors who appear in the film Alone Trip. -- 

SELECT FIRST_NAME, LAST_NAME, TITLE
FROM film_actor
JOIN film on film_actor.FILM_ID = film.FILM_ID
JOIN actor on film_actor.ACTOR_ID = actor.ACTOR_ID
WHERE TITLE = 'ALONE TRIP';

-- You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. -- 

SELECT FIRST_NAME, LAST_NAME, EMAIL, COUNTRY
FROM customer
JOIN address on customer.ADDRESS_ID = customer.ADDRESS_ID
JOIN city on address.CITY_ID = city.CITY_ID
JOIN country on city.COUNTRY_ID = country.COUNTRY_ID
WHERE COUNTRY = 'CANADA';

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films. -- 

SELECT TITLE, NAME AS CATEGORY
FROM film
JOIN film_category on film.FILM_ID = film_category.FILM_ID
JOIN category on film_category.category_ID = category.CATEGORY_ID
WHERE NAME = 'FAMILY';

-- What are the sales for each store for each month in 2005? --

SELECT store.STORE_ID, SUM(DATEDIFF(RETURN_DATE,RENTAL_DATE) * RENTAL_RATE) as 2005_SALES
FROM rental
JOIN inventory on rental.INVENTORY_ID = inventory.INVENTORY_ID
JOIN film on inventory.FILM_ID = film.FILM_ID
JOIN staff on rental.STAFF_ID = staff.STAFF_ID
JOIN store on staff.STORE_ID = store.STORE_ID
WHERE SUBSTR(RETURN_DATE,1,4) = '2005'
GROUP BY store.STORE_ID;

-- Find the film title, customer name, customer phone number, and customer address for all the outstanding DVDs. --

SELECT TITLE, FIRST_NAME, LAST_NAME, PHONE, ADDRESS
FROM customer
JOIN address on customer.ADDRESS_ID = customer.ADDRESS_ID
JOIN rental on customer.CUSTOMER_ID = rental.CUSTOMER_ID
JOIN inventory on rental.INVENTORY_ID = inventory.INVENTORY_ID
JOIN film on inventory.FILM_ID = film.FILM_ID
WHERE RETURN_DATE IS NUll

-- Additional rework of previous exercise --

/*
Use your knowledge of built in SQL functions to generate a username for all of the employees. 
A username should be all lowercase, and consist of the first character of the employees first name, 
the first 4 characters of the employees last name, an underscore, the month the employee was born, 
and the last two digits of the year that they were born.
*/

select concat(left(first_name, 1), left(last_name, 4), '_', month(birth_date), date_format(birth_date, '%y')) as username
from employees

