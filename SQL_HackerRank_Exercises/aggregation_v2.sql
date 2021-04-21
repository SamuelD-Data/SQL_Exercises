-- Aggregation V2 --

-- Query a count of the number of cities in CITY having a Population larger than 100k --

select count(distinct name)
from city
where population > 100000

-- Query the total population of all cities in CITY where District is California. --

select sum(population)
from city
where district  = 'california'

-- Query the average population of all cities in CITY where District is California. --

select avg(population)
from city
where district  = 'california'

-- Query the average population for all cities in CITY, rounded down to the nearest integer. --

select round(avg(population))
from city

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN. --

select sum(population)
from city
where countrycode = 'jpn'

-- Query the difference between the maximum and minimum populations in CITY. --

select max(population) - min(population)
from city

/*
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
but did not realize her keyboard's 0 key was broken until after completing the calculation. 
She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
*/

select ceil(avg(salary) - avg(replace(salary, 0, '')))
from employees

/*
We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be 
the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as  space-separated integers.
*/

select salary * months, count(*)
from employee
where salary * months = (select max(months * salary) from employee)
group by salary * months

-- Alternate solution --

select max_sal, count(*)
from employee
join (select max(salary * months) as max_sal from employee) as max_sal_col
where salary * months = max_sal_col.max_sal
group by max_sal

