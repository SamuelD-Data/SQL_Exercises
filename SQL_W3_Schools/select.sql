-- Select --

-- Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name" --

select first_name as "first name", last_name as "last name"
from employees 

-- Write a query to get unique department ID from employee table. --

select distinct department_id
FROM employees

-- Write a query to get all employee details from the employee table order by first name, descending. --

select *
from employees
order by first_name desc

-- Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary) --

select first_name, last_name, salary, (salary * .15) as PF
from employees

-- Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary. --

select employee_id, first_name, last_name, salary
from employees
order by salary

-- Write a query to get the maximum and minimum salary from employees table. --

select min(salary), max(salary)
from employees

-- Write a query to get the average salary and number of employees in the employees table. --

select count(*), avg(salary)
from employees

-- Write a query to get the number of employees working with the company. --

select count(distinct employee_id)
from employees

--  Write a query to get the number of jobs available in the employees table. --

select count(distinct job_id)
from employees

-- Write a query to get all first names from employees table in upper case. -- 

select upper(first_name)
from employees

-- Write a query to get the first 3 characters of first name from employees table. -- 

select substr(first_name, 1, 3)
from employees

-- Write a query to calculate 171*214+625. --

select 171*214+625

-- Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table --

select concat(first_name, ' ', last_name)
from employees

 -- Write a query to get first name from employees table after removing white spaces from both side. --

select trim(first_name)
from employees

-- Write a query to get the length of the employee names (first_name, last_name) from employees table. --

select length(first_name), length(last_name)
from employees

-- Write a query to check if the first_name fields of the employees table contains numbers. --

select first_name, case when first_name regexp '[0-9]' then 1 else 0 end as numcheck
from employees 

-- Write a query to select first 10 records from a table. --

select *
from employees
limit 10

-- Write a query to get monthly salary (round 2 decimal places) of each employee --
-- Note : Assume the salary field provides the 'annual salary' information. --

select round(salary / 12, 2) as monthly_salary
from employees 


