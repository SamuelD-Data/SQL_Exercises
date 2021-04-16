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

-- Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell. --

select first_name, last_name, salary
from employees
where salary > (select salary from employees where last_name = 'bell')

-- Write a query to find the name (first_name, last_name), --
-- and salary of the employees who earn the same salary as the minimum salary for all departments. --

select first_name, last_name, salary
from employees
join departments on departments.department_id = employees.department_id
join
    ( 
    select min(min_salary) as min_dept_sal, department_name
    from employees
    join jobs on employees.job_id = jobs.job_id
    join departments on departments.department_id = employees.department_id
    group by department_name
    ) as min_dept_salaries 
    on departments.department_name = min_dept_salaries.department_name and employees.salary = min_dept_salaries.min_dept_sal

-- alternate solution --

select employee_id, first_name, last_name, salary
from employees as e1
where salary > (select min(salary) from employees as e2 where e1.department_id = e2.department_id)

--  Write a query to find the name (first_name, last_name), and salary of the employees whose salary --
-- is greater than the average salary of all departments. --

select first_name, last_name, salary
from employees
where salary > (select avg(salary) from employees)

-- Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary --
-- that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest. --

select first_name, last_name, salary
from employees 
where salary > (select max(salary) from employees where job_id = 'sh_clerk')
order by salary

-- Write a query to find the name (first_name, last_name) of the employees who are not supervisors. --

select first_name, last_name
from employees
where employee_id not in (select manager_id from departments)

-- Write a query to display the employee ID, first name, last name, and department names of all employees. --

select employee_id, first_name, last_name, department_name
from employees
join departments on departments.department_id = employees.department_id

-- Alternate solution --

select 
    employee_id, 
    first_name, 
    last_name, 
    (select department_name from departments where employees.department_id = departments.department_id) as dept_name
from employees

-- Write a query to display the employee ID, first name, last name, salary --
-- of all employees whose salary is above average for their departments. --

select employee_id, first_name, last_name, salary
from employees as e1
where salary > (select avg(salary) from employees as e2 where e1.department_id = e2.department_id)

-- Write a query to fetch even numbered records from employees table. --

select employee_id
from employees 
where employee_id mod 2 = 0

-- 