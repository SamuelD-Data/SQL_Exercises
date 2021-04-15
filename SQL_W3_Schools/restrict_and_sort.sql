-- Write a query to display the name (first_name, last_name) and salary for all employees --
-- whose salary is not in the range $10,000 through $15,000. --

select first_name, last_name, salary
from employees
where salary not between 10000 and 15000

-- Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order. --

select first_name, last_name, department_id
from employees
where department_id in (30, 100)
order by department_id

-- Write a query to display the name (first_name, last_name) and salary for all employees -- 
-- whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100. -- 

select first_name, last_name, salary
from employees
where salary not between 10000 and 15000
and department_id in (30, 100)

-- Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987. --

select first_name, last_name, hire_date
from employees
where substr(hire_date, 1, 4) = 1987

-- Write a query to display the first_name of all employees who have both "b" and "c" in their first name. --

select first_name
from employees
where first_name like 'b' and first_name like 'c'

--  Write a query to display the last name, job, and salary for all employees --
-- whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000. --

select last_name, job_id, salary
from employees
where job_id = 'it_prog' or job_id = 'sh_clerk' and salary not in (4500, 10000, 15000)