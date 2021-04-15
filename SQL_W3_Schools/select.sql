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
