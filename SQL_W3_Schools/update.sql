-- Update --

-- Write a SQL statement to change the email column of employees table with 'not available' for all employees. --

update employees 
set email = 'not available'

-- Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for all employees. --

update employees 
set email = 'not available', commission_pct = .1

-- Write a SQL statement to change the email and commission_pct column of employees table with 'not available' --
-- and 0.10 for those employees whose department_id is 110. --

update employees 
set email = 'not available', commission_pct = .1
where department_id = 110

-- Write a SQL statement to change the email column of employees table with 'not available' --
-- for those employees whose department_id is 80 and gets a commission is less than .20% --

update employees 
set email = 'not available'
where department_id = 80 and commission_pct < .2

-- Write a SQL statement to change the email column of employees table with 'not available' --
-- for those employees who belongs to the 'Accounting' department. --

update employees 
set email = 'not available'
where department_id in (select department_id from departments where department_name = 'accounting')

