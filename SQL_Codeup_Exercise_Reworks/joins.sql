-- Joins --

-- Write a query that shows each department along with the name of the current manager for that department. --
SELECT FIRST_NAME, LAST_NAME, DEPT_NAME
FROM employees
JOIN dept_manager ON employees.EMP_NO = dept_manager.EMP_NO
JOIN departments on dept_manager.DEPT_NO = departments.DEPT_NO
where dept_manager.TO_DATE in (SELECT MAX(TO_DATE)
							   FROM departments 
							   JOIN dept_manager on dept_manager.DEPT_NO = departments.DEPT_NO
							   GROUP BY DEPT_NAME);

-- Find the name of all departments currently managed by women. --
SELECT FIRST_NAME, LAST_NAME, DEPT_NAME
FROM employees
JOIN dept_manager ON employees.EMP_NO = dept_manager.EMP_NO
JOIN departments on dept_manager.DEPT_NO = departments.DEPT_NO
where dept_manager.TO_DATE in (SELECT MAX(TO_DATE)
							   FROM departments 
							   JOIN dept_manager on dept_manager.DEPT_NO = departments.DEPT_NO
							   GROUP BY DEPT_NAME) 
	  AND employees.GENDER = 'F';

-- Find the current titles of employees currently working in the Customer Service department. --
SELECT TITLE, COUNT(TITLE)
FROM titles
JOIN dept_emp on titles.EMP_NO = dept_emp.EMP_NO
JOIN departments on dept_emp.DEPT_NO = departments.DEPT_NO
JOIN employees ON dept_emp.EMP_NO = employees.EMP_NO
WHERE DEPT_NAME = 'CUSTOMER SERVICE' and titles.TO_DATE > CURDATE()
GROUP BY TITLE

-- Find the current salary of all current managers. --
SELECT FIRST_NAME, LAST_NAME, DEPT_NAME, SALARY
FROM employees
JOIN dept_manager ON employees.EMP_NO = dept_manager.EMP_NO
JOIN departments on dept_manager.DEPT_NO = departments.DEPT_NO
JOIN salaries on employees.EMP_NO = salaries.EMP_NO
WHERE dept_manager.TO_DATE IN (SELECT MAX(TO_DATE)
							   FROM departments 
							   JOIN dept_manager on dept_manager.DEPT_NO = departments.DEPT_NO
							   GROUP BY DEPT_NAME)
	  AND salaries.TO_DATE IN (SELECT MAX(TO_DATE)
							   FROM departments 
							   JOIN dept_manager on dept_manager.DEPT_NO = departments.DEPT_NO
							   GROUP BY DEPT_NAME);

-- Find the number of current employees in each department. --
SELECT COUNT(DEPT_NAME), DEPT_NAME
FROM departments
JOIN dept_emp on departments.DEPT_NO = dept_emp.DEPT_NO
JOIN employees on dept_emp.EMP_NO = employees.EMP_NO
WHERE dept_emp.TO_DATE > CURDATE()
GROUP BY DEPT_NAME;

-- Which department has the highest average salary? Hint: Use current not historic information. --
SELECT AVG(SALARY) as AVERAGE_SALARY, dept_name
FROM salaries
JOIN dept_emp on salaries.EMP_NO = dept_emp.EMP_NO
JOIN departments on dept_emp.DEPT_NO = departments.DEPT_NO
WHERE salaries.TO_DATE > CURDATE()
GROUP BY dept_name
ORDER BY AVERAGE_SALARY DESC
LIMIT 1;

-- Who is the highest paid employee in the Marketing department? --
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM salaries
JOIN dept_emp on salaries.EMP_NO = dept_emp.EMP_NO
JOIN departments on dept_emp.DEPT_NO = departments.DEPT_NO
JOIN employees on dept_emp.EMP_NO = employees.EMP_NO
WHERE salaries.TO_DATE > CURDATE() AND departments.dept_name = 'MARKETING'
ORDER BY SALARY DESC
LIMIT 1;

-- Which current department manager has the highest salary? --
SELECT FIRST_NAME, LAST_NAME, DEPT_NAME, SALARY
FROM employees
JOIN dept_manager ON employees.EMP_NO = dept_manager.EMP_NO
JOIN departments on dept_manager.DEPT_NO = departments.DEPT_NO
JOIN salaries on employees.EMP_NO = salaries.EMP_NO
WHERE dept_manager.TO_DATE IN (SELECT MAX(TO_DATE)
							   FROM departments 
							   JOIN dept_manager on dept_manager.DEPT_NO = departments.DEPT_NO
							   GROUP BY DEPT_NAME)
	  AND salaries.TO_DATE IN (SELECT MAX(TO_DATE)
							   FROM departments 
							   JOIN dept_manager on dept_manager.DEPT_NO = departments.DEPT_NO
							   GROUP BY DEPT_NAME)
ORDER BY SALARY DESC
LIMIT 1;

-- Bonus Find the names of all current employees, their department name, and their current manager's name. --
SELECT FIRST_NAME, LAST_NAME, departments.DEPT_NAME, MANAGERS.MANAGER
FROM employees
JOIN dept_emp on employees.EMP_NO = dept_emp.EMP_NO
JOIN departments on dept_emp.DEPT_NO = departments.DEPT_NO
JOIN (SELECT DEPT_NAME, CONCAT(FIRST_NAME, ' ', LAST_NAME) as MANAGER
	FROM employees
	JOIN dept_emp ON employees.EMP_NO = dept_emp.EMP_NO
	JOIN departments on dept_emp.DEPT_NO = departments.DEPT_NO
	JOIN dept_manager on employees.EMP_NO = dept_manager.EMP_NO
	WHERE dept_manager.TO_DATE > CURDATE()) AS MANAGERS ON departments.DEPT_NAME = MANAGERS.DEPT_NAME
WHERE dept_emp.TO_DATE > CURDATE();

-- Bonus Who is the highest paid employee within each department. --
select first_name, last_name, max_salary, dept_name
from employees
join salaries as s on employees.emp_no = s.emp_no
join dept_emp as de on employees.emp_no = de.emp_no
join (select max(salary) as max_salary, dept_name, dept_emp.dept_no
	from salaries
	join dept_emp on salaries.emp_no = dept_emp.emp_no
	join employees on salaries.emp_no = employees.emp_no
	join departments on dept_emp.dept_no = departments.dept_no
	group by dept_name) as max_salaries on de.dept_no = max_salaries.dept_no
where s.salary = max_salary and de.to_date > curdate();