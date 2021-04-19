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

select dept_name, avg(salary)
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join salaries on salaries.emp_no = employees.emp_no
where salaries.to_date > curdate()
group by dept_name
order by avg(salary) desc

-- Who is the highest paid employee in the Marketing department? --

select first_name, last_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join salaries on salaries.emp_no = employees.emp_no
where salary = (select max(salary)
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join salaries on salaries.emp_no = employees.emp_no
where dept_name = 'Marketing' and salaries.to_date > curdate())

-- Which current department manager has the highest salary? --

select first_name, last_name, dept_name, salary
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join salaries on salaries.emp_no = employees.emp_no
where employees.emp_no in (select emp_no from dept_manager where to_date > curdate())
and salaries.to_date > curdate()
and salary = (select max(salary)
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join salaries on salaries.emp_no = employees.emp_no
where employees.emp_no in (select emp_no from dept_manager where to_date > curdate())
and salaries.to_date > curdate())

-- Bonus Find the names of all current employees, their department name, and their current manager's name. --

select emp_a.first_name, emp_a.last_name, dept_name, emp_a.emp_no, concat(emp_b.first_name, ' ', emp_b.last_name) as manager_name
from employees as emp_a
join dept_emp on emp_a.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join dept_manager on dept_emp.dept_no = dept_manager.dept_no
join employees as emp_b on dept_manager.emp_no = emp_b.emp_no
where dept_manager.to_date > curdate() and dept_emp.to_date > curdate()

-- Bonus Who is the highest paid employee within each department. --

select first_name, last_name, salary, MS, departments.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join salaries on employees.emp_no = salaries.emp_no
join departments on departments.dept_no = dept_emp.dept_no
join (select max(salary) as MS, dept_name
from salaries
join dept_emp on dept_emp.emp_no = salaries.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where salaries.to_date > curdate()
group by dept_name) as max_salaries
where salaries.to_date > curdate() and departments.dept_name = max_salaries.dept_name and salary = MS

-- Possible alternate solution -- 

select first_name, last_name, dept_name, salary
from employees as e1
join dept_emp on dept_emp.emp_no = e1.emp_no
join departments as d1 on dept_emp.dept_no = d1.dept_no
join salaries on e1.emp_no = salaries.emp_no
where salaries.to_date > curdate() and dept_emp.to_date > curdate()
and salary = (select max(salary) from salaries as s1 join dept_emp as d2 on d2.emp_no = s1.emp_no where s1.to_date > curdate() and d1.dept_no = d2.dept_no and d2.to_date > curdate());