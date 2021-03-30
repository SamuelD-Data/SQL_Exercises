-- LESSON 10 --

/*
Find the longest time that an employee has been at the studio
*/
SELECT MAX(YEARS_EMPLOYED)
FROM EMPLOYEES

/*
For each role, find the average number of years employed by employees in that role
*/ 
SELECT ROLE, AVG(YEARS_EMPLOYED)
FROM EMPLOYEES
GROUP BY ROLE

/*
Find the total number of employee years worked in each building
*/
SELECT BUILDING, SUM(YEARS_EMPLOYED)
FROM EMPLOYEES
GROUP BY BUILDING