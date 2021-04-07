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

SELECT FIRST_NAME, LAST_NAME, CASE 
        						WHEN SUBSTR(LAST_NAME, 1,1) BETWEEN 'A' AND 'H' THEN 'A-H'
        						WHEN SUBSTR(LAST_NAME, 1,1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
        						ELSE 'R - Z'
        						END AS 'ALPHA_GROUP'
FROM employees;

-- How many employees (current or previous) were born in each decade? -- 
-- How many employees (current or previous) were born in each decade? -- 

SELECT CASE
					WHEN BIRTH_DATE BETWEEN '1900/01/01' AND '1909/12/31' THEN '1900-1909'
					WHEN BIRTH_DATE BETWEEN '1910/01/01' AND '1919/12/31' THEN '1910-1919'
					WHEN BIRTH_DATE BETWEEN '1920/01/01' AND '1929/12/31' THEN '1920-1929'
					WHEN BIRTH_DATE BETWEEN '1930/01/01' AND '1939/12/31' THEN '1930-1939'
					WHEN BIRTH_DATE BETWEEN '1940/01/01' AND '1949/12/31' THEN '1940-1949'
					WHEN BIRTH_DATE BETWEEN '1950/01/01' AND '1959/12/31' THEN '1950-1959'
					WHEN BIRTH_DATE BETWEEN '1960/01/01' AND '1969/12/31' THEN '1960-1969'
					WHEN BIRTH_DATE BETWEEN '1970/01/01' AND '1979/12/31' THEN '1970-1979'
					WHEN BIRTH_DATE BETWEEN '1980/01/01' AND '1989/12/31' THEN '1980-1989'
					WHEN BIRTH_DATE BETWEEN '1990/01/01' AND '1999/12/31' THEN '1990-1999'
					ELSE '2000+'
					END AS DECADE,
	COUNT(*) as BIRTHDAY_COUNT
FROM employees
GROUP BY DECADE;

-- What is the current average salary for each of the following department groups: -- 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service? -- 
SELECT CASE
		WHEN DEPT_NAME IN ('Research', 'Development') THEN 'R&D'
		WHEN DEPT_NAME IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
		WHEN DEPT_NAME IN ('Production', 'Quality Management') THEN 'Prod & QM'
		WHEN DEPT_NAME IN ('Finance', 'Human Resources') THEN 'Finance & HR'
		ELSE 'Customer Service'
		END AS 'DEPT', DEPT_NAME
FROM departments