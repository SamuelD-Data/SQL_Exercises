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
SELECT TITLE, DEPT_NAME, titles.EMP_NO, CONCAT(FIRST_NAME, ' ', LAST_NAME) as FULL_NAME
FROM titles
JOIN dept_emp on titles.EMP_NO = dept_emp.EMP_NO
JOIN departments on dept_emp.DEPT_NO = departments.DEPT_NO
JOIN employees ON dept_emp.EMP_NO = employees.EMP_NO
where DEPT_NAME = 'CUSTOMER SERVICE' and titles.TO_DATE > CURDATE()

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

-- Which department has the highest average salary? Hint: Use current not historic information. --

-- Who is the highest paid employee in the Marketing department? --

-- Which current department manager has the highest salary? --

-- Bonus Find the names of all current employees, their department name, and their current manager's name. --

-- Bonus Who is the highest paid employee within each department. --