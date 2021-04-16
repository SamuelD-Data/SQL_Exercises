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

-- Alternate Solution --

select date_format(curdate(), "%M %d, %Y")

-- Write a query to get the current date in Thursday September 2014 format. --

select concat( dayname(curdate()), ' ', monthname(curdate()), ' ', year(curdate()) )

-- Alternate solution --

select date_format(curdate(), "%W %M %Y")

-- Write a query to extract the year from the current date. --

select year(curdate())

-- Write a query to get the DATE value from a given day (number in N) --

select from_days(3463563)

-- Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30' --

select first_name, hire_date
from employees
where hire_date between '1987-06-01' and '1987-07-30'

-- Write a query to display the current date in the following format. --
-- Thursday 4th September 2014 --

select date_format(curdate(), "%W %D %M %Y")

-- Write a query to display the current date in the following format. --
-- Sample output: 05/09/2014 --

select date_format(curdate(), "%m/%d/%Y")

-- Write a query to display the current date in the following format. --
-- Sample output: 12:00 AM Sep 5, 2014 --

select date_format(curdate(),'%l:%i %p %b %e, %Y')

-- Write a query to get the firstname, lastname who joined in the month of June. --

select first_name, last_name
from employees
where month(hire_date) = 6

-- Write a query to get the years in which more than 10 employees joined. --

select year(hire_date), count(*)
from employees
group by year(hire_date)
having count(distinct employee_id) > 10

-- Write a query to get first name of employees who joined in 1987. --

select first_name
from employees
where year(hire_date) = 1987

-- Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years. --

select first_name, last_name, salary, department_name
from employees
join departments on departments.department_id = employees.department_id
where employee_id in (select manager_id from departments)
and datediff(curdate(), hire_date) / 365  > 5

-- Write a query to get first name, hire date and experience of the employees. --

select first_name, hire_date, datediff(curdate(), hire_date) / 365 as years_of_experience
from employees

-- Write a query to get the department ID, year, and number of employees joined. --

select department_id, year(hire_date), count(distinct employee_id)
from employees
group by department_id, year(hire_date)