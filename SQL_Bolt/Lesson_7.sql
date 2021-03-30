-- Lesson 7 --

/*
Find the list of all buildings that have employees
*/
SELECT DISTINCT BUILDING
FROM EMPLOYEES
JOIN BUILDINGS ON EMPLOYEES.BUILDING = BUILDINGS.BUILDING_NAME;

/*
Find the list of all buildings and their capacity
*/
SELECT BUILDING_NAME, CAPACITY
FROM BUILDINGS;

/*
List all buildings and the distinct employee roles in each building (including empty buildings)
*/
SELECT DISTINCT BUILDING_NAME, ROLE
FROM BUILDINGS
LEFT JOIN EMPLOYEES ON BUILDING_NAME = EMPLOYEES.BUILDING;
