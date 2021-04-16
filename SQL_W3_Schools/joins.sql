-- Joins --

-- Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. --

select location_id, street_address, city, state_province, country_name
from locations
join countries on locations.country_id = countries.country_id

-- Write a query to find the name (first_name, last name), department ID and name of all the employees --

select first_name, last_name, employees.department_id, department_name
from employees
join departments on employees.department_id = departments.department_id

-- Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London. --

select first_name, last_name, job_id, departments.department_id, department_name
from employees
join departments on employees.department_id = departments.department_id
join locations on departments.location_id = locations.location_id
where city = 'london'

-- Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name). --

select e1.employee_id, e1.last_name, e1.manager_id, e2.last_name as manager_name
from employees as e1 
join employees as e2 on e1.manager_id = e2.employee_id

-- Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'. --

select first_name, last_name, e1.hire_date
from employees as e1
join (select hire_date from employees where last_name = 'jones') as e2
where e1.hire_date > e2.hire_date

-- Alternate Solution -- 

select e1.first_name, e1.last_name, e1.hire_date 
from employees as e1 
join employees as e2 
on (e2.last_name = 'Jones') 
where e1.hire_date > e2.hire_date

-- Write a query to get the department name and number of employees in the department. --

select count(distinct employee_id), department_name
from employees
join departments on employees.department_id = departments.department_id
group by department_name

-- Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90. --

select employees.employee_id, employees.job_id, end_date - start_date
from employees
join job_history on employees.employee_id = job_history.employee_id
where employees.department_id = 90

-- Write a query to display the department ID and name and first name of manager. --

select departments.department_id, departments.department_name, first_name
from employees
join departments on employees.employee_id = departments.manager_id

-- Write a query to display the department name, manager name, and city. --

select departments.department_name, first_name, last_name, city
from employees
join departments on employees.employee_id = departments.manager_id
join locations on departments.location_id = locations.location_id

-- Write a query to display the job title and average salary of employees. --

select job_title, avg(salary) 
from employees 
join jobs on employees.job_id = jobs.job_id
group by job_title

-- Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job. --

select job_title, first_name, last_name, (salary - min_salary)
from employees
join jobs on employees.job_id = jobs.job_id

-- Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. --

select job_history.*
from employees
join job_history on employees.employee_id = job_history.employee_id
where salary > 10000

-- Write a query to display department name, name (first_name, last_name), hire date, salary --
-- of the manager for all managers whose experience is more than 15 years. --

select department_name, first_name, last_name, hire_date, salary
from employees 
join departments on employees.department_id = departments.department_id
join job_history on employees.employee_id = job_history.employee_id
where ((datefiff(curdate(), hire_date)) / 365) > 15

