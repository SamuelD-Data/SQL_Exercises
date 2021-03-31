-- Lesson 11 -- 

/*
Find the number of Artists in the studio (without a HAVING clause)
*/
SELECT COUNT(ROLE)
FROM EMPLOYEES
WHERE ROLE LIKE 'ARTIST';

/*
Find the number of Employees of each role in the studio
*/
SELECT ROLE, COUNT(ROLE)
FROM EMPLOYEES
GROUP BY ROLE;

/*
Find the total number of years employed by all Engineers
*/
SELECT ROLE, SUM(YEARS_EMPLOYED)
FROM EMPLOYEES
WHERE ROLE LIKE 'ENGINEER';