-- Lesson 8 --

/*
Find the name and role of all employees who have not been assigned to a building
*/
SELECT NAME, ROLE
FROM EMPLOYEES
WHERE BUILDING IS NULL

/*
Find the names of the buildings that hold no employees
*/
SELECT *
FROM EMPLOYEES
JOIN BUILDINGS ON EMPLOYEES.BUILDING = BUILDINGS.BUILDING_NAME
WHERE ROLE IS NULL

