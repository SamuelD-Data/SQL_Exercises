-- Subquery --

-- Write a query to find the name (first_name, last_name) --
-- and the salary of the employees who have a higher salary than the employee whose last_name='Bull'. --

select first_name, last_name, salary
from employees
where salary > (select salary from employees where last_name = 'bull')

-- Write a query to find the name (first_name, last_name) of all employees who works in the IT department. --

select first_name, last_name
from employees
where department_id in (select department_id from departments where department_name = 'it')

-- Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department. --

select first_name, last_name
from employees
where manager_id in 
(select manager_id from departments where location_id in (select location_id from locations where country_id = 'us'))

-- Write a query to find the name (first_name, last_name) of the employees who are managers. --

select first_name, last_name
from employees
where employee_id in 
(select manager_id from departments)

-- Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary. --

select first_name, last_name, salary
from employees
where salary > (select avg(salary) from employees)

-- Write a query to find the name (first_name, last_name), --
-- and salary of the employees whose salary is equal to the minimum salary for their job grade. --

select first_name, last_name, salary
from employees
where salary = (select min_salary from jobs where employees.job_id = jobs.job_id)

-- Write a query to find the name (first_name, last_name), and salary of the employees who earns --
-- more than the average salary and works in any of the IT departments. --

select first_name, last_name, salary
from employees
where salary > (select avg(salary) from employees)
and department_id in (select department_id from departments where department_name like '%it%')