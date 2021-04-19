-- Join v2 -- 

-- Write a query that shows each department along with the name of the current manager for that department --

select first_name, last_name, dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where employees.emp_no in (select emp_no from dept_manager where to_date > curdate())

-- Find the name of all departments currently managed by women. --

select first_name, last_name, dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where employees.emp_no in (select emp_no from dept_manager where to_date > curdate())
and employees.gender = 'F'

-- Find the current titles of employees currently working in the Customer Service department. --

select first_name, last_name, title
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join salaries on salaries.emp_no = employees.emp_no
join titles on employees.emp_no = titles.emp_no
where dept_name = 'Customer Service'

-- Find the current salary of all current managers. --

select first_name, last_name, dept_name, salary
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join salaries on salaries.emp_no = employees.emp_no
where employees.emp_no in (select emp_no from dept_manager where to_date > curdate())
and salaries.to_date > curdate()

-- Find the number of current employees in each department. --

select dept_name, count(distinct employees.emp_no)
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join salaries on salaries.emp_no = employees.emp_no
group by dept_name

-- Which department has the highest average salary? Hint: Use current not historic information. --

-- Who is the highest paid employee in the Marketing department? --

-- Which current department manager has the highest salary? --



-- Bonus Find the names of all current employees, their department name, and their current manager's name. --


-- Bonus Who is the highest paid employee within each department. --