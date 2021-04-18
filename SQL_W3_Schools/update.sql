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

-- Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000. --

update employees
set salary = 8000 
where employee_id = 105 and salary < 5000

--  Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, --
-- which ID is 30 and the existing job ID does not start with SH. --

update employees
set job_id = 'sh_clerk'
where department_id = 30 and job_id not like 'sh%' and employee_id = 118

-- Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, --
-- salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 --
-- and the rest of the departments will remain same. --

update employees 
set salary = case department_id 
    when 40 then salary + (salary * .25) 
    when 90 then salary + (salary * .15)
    else salary + (salary * .10)
    end
where department_id in (40, 90, 110)

--  Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary -- 
-- for those employees by 20% and commission percent by .10. --

update jobs
set jobs.min_salary = jobs.min_salary + 2000,
jobs.max_salary = jobs.max_salary + 2000
where jobs.job_id = 'pu_clerk'

update employees
employees.salary = employees.salary * 1.2,
employees.commission_pct = employees.commission_pct + .1
where employees.job_id = 'pu_clerk'