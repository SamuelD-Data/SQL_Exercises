-- Advanced Select V2 --

/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/

select case 
    when a = b and b = c then 'Equilateral'
    when a + b <= c or a + c <= b or b + c <= a then 'Not A Triangle'
    when (a = b and b != c) or (b = c and b != a) or (a = c and a != b)then 'Isosceles'
    else 'Scalene' end as 'Triangle Type'
from triangles

-- Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession --
-- as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S). --

select concat(name,'(',left(occupation,1),')')
from occupations
order by name;

/*
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, 
and output them in the following format: There are a total of [occupation_count] [occupation]s. 
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. 
If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
*/

select concat('There are a total of ', count(*), ' ', lower(occupation),'s.')
from occupations
group by occupation
order by count(*), occupation;

/*
Amber's conglomerate corporation just acquired some new companies.
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, 
total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code. 
*/

select company.company_code, founder, count(distinct lead_manager_code), count(distinct senior_manager_code), count(distinct manager_code), count(distinct employee_code)
from company
join employee on company.company_code = employee.company_code
group by company_code, founder
order by company_code