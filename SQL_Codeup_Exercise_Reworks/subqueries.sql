-- Subqueries --

-- Find all the current employees with the same hire date as employee 101010 using a sub-query. -- 

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM employees
WHERE HIRE_DATE = (SELECT HIRE_DATE
					FROM employees
					WHERE EMP_NO = 101010);

-- Find all the titles ever held by all current employees with the first name Aamod. -- 

SELECT DISTINCT TITLE
FROM titles
JOIN employees on titles.EMP_NO = employees.EMP_NO
WHERE employees.EMP_NO IN (SELECT employees.EMP_NO
							FROM employees
							JOIN dept_emp on dept_emp.EMP_NO = employees.EMP_NO
							JOIN titles on employees.EMP_NO = titles.EMP_NO
							WHERE employees.FIRST_NAME = 'Aamod' 
							AND dept_emp.TO_DATE > CURDATE() );

-- How many people in the employees table are no longer working for the company?  -- 

SELECT COUNT(DISTINCT EMP_NO)
FROM employees
WHERE EMP_NO NOT IN (SELECT employees.EMP_NO
					FROM employees
					JOIN dept_emp ON employees.EMP_NO = dept_emp.EMP_NO
					WHERE TO_DATE > CURDATE() );

-- Find all the current department managers that are female. -- 

SELECT FIRST_NAME, LAST_NAME
FROM employees
JOIN dept_emp ON employees.EMP_NO = dept_emp.EMP_NO
WHERE GENDER = 'F' 
      AND employees.EMP_NO IN (SELECT emp_no FROM dept_manager WHERE TO_DATE > CURDATE() );

-- Find all the employees who currently have a higher salary than the companies overall, historical average salary. -- 

SELECT DISTINCT employees.EMP_NO, FIRST_NAME, LAST_NAME, SALARY
FROM employees
JOIN salaries ON employees.EMP_NO = salaries.EMP_NO
WHERE SALARY > (SELECT AVG(SALARY)
				FROM salaries)
	  AND TO_DATE > CURDATE();

-- How many current salaries are within 1 standard deviation of the current highest salary? --  
-- (Hint: you can use a built in function to calculate the standard deviation.) -- 

SELECT COUNT(*)
FROM salaries
JOIN employees on employees.EMP_NO = salaries.EMP_NO
WHERE salaries.SALARY >= ((SELECT MAX(SALARY) FROM salaries) - (SELECT STD(SALARY) FROM salaries WHERE TO_DATE > CURDATE()))
	  AND TO_DATE > CURDATE();

-- What percentage of all salaries is this? -- 

SELECT CONCAT((COUNT(*) / (SELECT COUNT(*) 
						   FROM salaries 
						   WHERE TO_DATE > CURDATE())) * 100, '%')
FROM salaries
JOIN employees on employees.EMP_NO = salaries.EMP_NO
WHERE salaries.SALARY >= ((SELECT MAX(SALARY) FROM salaries) - (SELECT STD(SALARY) FROM salaries WHERE TO_DATE > CURDATE()))
	  AND TO_DATE > CURDATE();

-- Find all the department names that currently have female managers. -- 

SELECT DEPT_NAME, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS MANAGER
FROM employees
JOIN dept_emp ON employees.EMP_NO = dept_emp.EMP_NO
JOIN departments on dept_emp.DEPT_NO = departments.DEPT_NO
WHERE GENDER = 'F' 
      AND employees.EMP_NO IN (SELECT emp_no FROM dept_manager WHERE TO_DATE > CURDATE() );

-- Find the first and last name of the employee with the highest salary. -- 

SELECT FIRST_NAME, LAST_NAME
FROM employees
JOIN salaries on employees.EMP_NO = salaries.EMP_NO
WHERE salary = (SELECT MAX(SALARY)
				FROM salaries
				WHERE TO_DATE > CURDATE()) 
	  AND TO_DATE > CURDATE();	

-- Find the department name that the employee with the highest salary works in. -- 

SELECT FIRST_NAME, LAST_NAME, DEPT_NAME
FROM employees
JOIN salaries on employees.EMP_NO = salaries.EMP_NO
JOIN dept_emp on employees.EMP_NO = dept_emp.EMP_NO
JOIN departments on dept_emp.DEPT_NO = departments.DEPT_NO
WHERE salary = (SELECT MAX(SALARY)
				FROM salaries
				WHERE TO_DATE > CURDATE()) 
	  AND salaries.TO_DATE > CURDATE();	