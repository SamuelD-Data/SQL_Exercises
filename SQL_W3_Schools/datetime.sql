-- Datetime -- 

-- Write a query to display the first day of the month three months before the current month. --

select last_day(curdate() - interval 4 month) + interval 1 Day

-- Write a query to display the last day of the month three months before the current month. -- 

select last_day(curdate() - interval 3 month) 

-- Write a query to get the distinct Mondays from hire_date in employees tables. --

select hire_date
from employees
where weekday(hire_date) = 0

-- Write a query to get the first day of the current year. --

SELECT concat(year(curdate()), '-01-01')

-- Write a query to get the last day of the current year. --

SELECT concat(year(curdate()), '-12-31')

-- Write a query to get the current date in the following format --
-- Sample date : 2014-09-04 --
-- Output : September 4, 2014 --

SELECT concat( monthname(curdate()), ' ', day(curdate()), ',', ' ', year(curdate()))

-- Write a query to get the current date in Thursday September 2014 format. --

select concat( dayname(curdate()), ' ', monthname(curdate()), ' ', year(curdate()) )

-- Write a query to extract the year from the current date. --

select year(curdate())

-- Write a query to get the DATE value from a given day (number in N) --

select from_days(3463563)



