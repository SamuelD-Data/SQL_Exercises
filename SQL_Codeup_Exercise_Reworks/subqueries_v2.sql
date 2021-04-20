-- Subqueries V2--

-- Find all the titles ever held by all current employees with the first name Aamod. --

select distinct all_aamods.title
from employees
join titles on employees.emp_no = titles.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join (select title, employees.emp_no
from employees
join titles on employees.emp_no = titles.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
where first_name = 'aamod') as all_aamods on employees.emp_no = all_aamods.emp_no
where first_name = 'aamod' and dept_emp.to_date > curdate();

-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code. --

select count(distinct emp_no)
from employees
where emp_no not in (select employees.emp_no
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
where dept_emp.to_date > curdate())

-- Find all the employees who currently have a higher salary than the companies overall, historical average salary. --

select first_name, last_name, salary
from employees
join salaries on salaries.emp_no = employees.emp_no
where salaries.to_date > curdate()
and salary > (select avg(salary) from salaries)

