Write a query to to find all employees whose last name starts and ends with 'E'. 
 Use concat() to combine their first and last name together as a single column named full_name.
 */ 
 SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME
 FROM employees
 WHERE LAST_NAME LIKE 'E%E';

 /*
 Convert the names produced in your last query to all uppercase.
 */
 SELECT UPPER(CONCAT(FIRST_NAME, ' ', LAST_NAME)) AS FULL_NAME
 FROM employees
 WHERE LAST_NAME LIKE 'E%E';

 /*
 Find all employees hired in the 90s and born on Christmas. 
 Use datediff() function to find how many days they have been working at the company 
 (Hint: You will also need to use NOW() or CURDATE()),
 */
 SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, BIRTH_DATE, DATEDIFF(CURDATE(), HIRE_DATE) AS DAYS_WORKED
 FROM employees
 WHERE (HIRE_DATE BETWEEN '1990-01-01-' AND '1999-12-31') AND BIRTH_DATE LIKE '%-12-25';

 /*
 Find the smallest and largest current salary from the salaries table.
 */
 SELECT MIN(SALARY), MAX(SALARY)
 FROM salaries;

 /*
 Use your knowledge of built in SQL functions to generate a username for all of the employees. 
 A username should be all lowercase, and consist of the first character of the employees first name, 
 the first 4 characters of the employees last name, an underscore, the month the employee was born, 
 and the last two digits of the year that they were born. 
 */
 SELECT LOWER(CONCAT(SUBSTR(FIRST_NAME,1,1), 
 					SUBSTR(LAST_NAME,1,4), 
 					'_', 
 					SUBSTR(BIRTH_DATE,6,2), 
 					SUBSTR(BIRTH_DATE,3,2))) 
 					AS USERNAME
 FROM employees