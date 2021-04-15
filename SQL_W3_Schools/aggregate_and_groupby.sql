-- Write a query to list the number of jobs available in the employees table. --

select count(distinct job)
from employees

-- Write a query to get the total salaries payable to employees. --

select sum(salary)
from employees

-- Write a query to get the minimum salary from employees table. --

select min(salary)
from employees

-- Write a query to get the maximum salary of an employee working as a Programmer. --

select max(salary)
from employees
where job_id = 'it_prog'

-- Write a query to get the average salary and number of employees working the department 90 --

select avg(salary), count(distinct emp_id)
from employees
where department_id = 90

-- Write a query to get the highest, lowest, sum, and average salary of all employees. --

select max(salary), min(salary), sum(salary), avg(salary)
from employees

--  Write a query to get the number of employees with the same job. --

select job_id, count(employee_id)
from employees
group by job_id
having count(employee_id) > 2

