-- Advanced Join V2 --

-- Write a query to output the names of those students whose best friends got offered a higher salary than them. --
-- Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer. --

select name
from students
join friends on students.id = friends.id
join packages as s1 on friends.id = s1.id
join packages as s2 on s2.id = friends.friend_id
where s1.salary < s2.salary
order by s2.salary

-- Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1. --
-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1. --

select func1.x, func1.y 
from functions as func1
join functions as func2 on func1.x = func2.y and func1.y = func2.x
group by func1.x, func1.y
having count(func1.x) > 1 or func1.x < func1.y
order by func1.x 


