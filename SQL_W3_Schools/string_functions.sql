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

-- 