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

