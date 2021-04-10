-- Lesson 7 --

-- List the teachers who have NULL for their department. --

select name
from teacher
where dept is null

-- Use a different JOIN so that all teachers and their dept. (if any) are listed since some teachers have null depts. --

select teacher.name, dept.name
from teacher
left join dept on teacher.dept = dept.id

-- Use a different JOIN so that teachers and all depts are listed are listed since some  depts have no teachers --

select teacher.name, dept.name
from teacher
right join dept on teacher.dept = dept.id

-- Use COALESCE to print the mobile number. 
-- Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266' --

select name, coalesce(mobile, '07986 444 2266')
from teacher

-- alternate approach --

select name, 
case when mobile is null then '07986 444 2266'
else mobile end as mphone
from teacher

-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department. -- 

select teacher.name, COALESCE(dept.name, 'None')
from teacher
left join dept on teacher.dept = dept.id

-- alternate approach --

select teacher.name, case
when teacher.dept is null then 'None'
else dept.name end as dept
from teacher
left join dept on teacher.dept = dept.id

-- Use COUNT to show the number of teachers and the number of mobile phones. --

select count(name), count(mobile)
from teacher

-- Use COUNT and GROUP BY dept.name to show each department and the number of staff. --
-- Use a RIGHT JOIN to ensure that the Engineering department is listed. --

select dept.name, count(teacher.name)
from teacher
right join dept on dept.id= teacher.dept
group by dept.name

-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise. --

select teacher.name, case
when teacher.dept in (1,2) then 'Sci'
else 'Art' end as dept_name
from teacher
left join dept on teacher.dept = dept.id

-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise. --

select teacher.name, case
when teacher.dept in (1,2) then 'Sci'
when teacher.dept = 3 then 'Art'
else 'None' end as dept_name
from teacher
left join dept on teacher.dept = dept.id