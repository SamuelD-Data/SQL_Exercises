-- Case Statements --

-- Write a query that returns all employees (emp_no), their department number, their start date, their end date, -- 
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. -- 
SELECT dept_emp.DEPT_NO, EMPLOYEE_NUMBER, START_DATE, LAST_DATE, IS_CURRENT_EMPLOYEE
FROM dept_emp
JOIN 
	(SELECT MAX(employees.EMP_NO) AS EMPLOYEE_NUMBER, MAX(HIRE_DATE) AS START_DATE, MAX(dept_emp.TO_DATE) AS LAST_DATE, MAX(CASE WHEN dept_emp.TO_DATE > CURDATE() THEN 1 ELSE 0 END) AS IS_CURRENT_EMPLOYEE
	FROM employees
	JOIN dept_emp ON employees.EMP_NO = dept_emp.EMP_NO
	JOIN (SELECT TO_DATE, EMP_NO, DEPT_NO 
	FROM dept_emp) as dept_info
	WHERE employees.EMP_NO = dept_info.EMP_NO AND dept_emp.TO_DATE = dept_info.TO_DATE
	GROUP BY employees.EMP_NO ) AS misc_info
ON dept_emp.EMP_NO = misc_info.EMPLOYEE_NUMBER AND dept_emp.TO_DATE = misc_info.LAST_DATE;


-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' -- 
-- depending on the first letter of their last name. -- 

SELECT FIRST_NAME, LAST_NAME, CASE SUBSTR(LAST_NAME, 1,1)
        						WHEN 'A'THEN 'alpha'
        						WHEN 'F' THEN 'f group'
        						ELSE 'NOT A OR F'
        						END AS 'ALPHA_GROUP'
FROM employees;


-- How many employees (current or previous) were born in each decade? -- 


-- What is the current average salary for each of the following department groups: -- 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service? -- 