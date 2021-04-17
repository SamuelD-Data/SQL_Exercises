-- String Functions --

/*
Write a query to get the job_id and related employees id.
Partial output of the query :

job_id	Employees ID
AC_ACCOUNT	206
AC_MGR	205
AD_ASST	200
AD_PRES	100
AD_VP	101 ,102
FI_ACCOUNT	110 ,113 ,111 ,109 ,112
*/

select job_id, group_concat(distinct employee_id separator ' ,')
from employees

-- Write a query to update the portion of the phone_number in the employees table, --
-- within the phone number the substring '124' will be replaced by '999'. --

update employees 
set phone_number = replace(phone_number, '124', '999') 
where phone_number LIKE '%124%';

-- Write a query to get the details of the employees where the length of the first name greater than or equal to 8. --

select *
from employees
where length(first_name) >= 8

-- Write a query to display leading zeros before maximum and minimum salary. --

select job_id,  lpad( max_salary, 7, '0'), lpad( min_salary, 7, '0')
FROM jobs

-- Write a query to append '@example.com' to email field. --

select concat(email, '@example.com')
from employees

-- Write a query to get the employee id, first name and hire month. --

select employee_id, first_name, month(hire_date)
from employees

-- Write a query to get the employee id, email id (discard the last three characters). --

select employee_id, left(email, length(email) - 3)
from employees

-- Write a query to find all employees where first names are in upper case. --

select first_name, last_name
from employees 
where first_name = binary upper(first_name)

-- Write a query to extract the last 4 character of phone numbers --

select right(phone_number, 4), phone_number
from employees

-- Write a query to get the last word of the street address. --

select substring_index(street_address, ' ', -1)
from locations

-- Write a query to get the locations that have minimum street length. --

select location_id
from locations
where length(street_address) = (select min(length(street_address)) from locations)

-- Write a query to display the first word from those job titles which contains more than one words --

select substr(job_title, 1, instr(job_title, ' ') -1)
from jobs

-- Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position. --

select length(first_name), last_name
from employees
where substr(last_name, 3) like '%c%'

-- Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters --
-- 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names. --

select first_name, length(first_name) as first_name_length
from employees
where substr(first_name,1,1) in ('a', 'j', 'm')
order by first_name

-- Write a query to display the first name and salary for all employees. --
-- Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY. --

select first_name, lpad(salary, 10, '$') as SALARY 
from employees

--  Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. --
-- Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary. -- 

select substr(first_name, 1, 8), repeat('$', floor(salary / 1000)) 
from employees
order by salary desc

-- Write a query to display the employees with their code, first name, --
-- last name and hire date who hired either on seventh day of any month or seventh month in any year. --

select first_name, last_name, employee_id, hire_date
from employees 
where day(hire_date) = 7 or month(hire_date) = 7