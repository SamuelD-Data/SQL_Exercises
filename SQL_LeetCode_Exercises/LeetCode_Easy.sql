-- Easy Difficulty Exercises --

/*
Write a SQL query for a report that provides the following information for each person in the Person table, 
regardless if there is an address for each of those people:
FirstName, LastName, City, State
*/
SELECT PERSON.FIRSTNAME, PERSON.LASTNAME, ADDRESS.CITY, ADDRESS.STATE
FROM PERSON
LEFT JOIN ADDRESS ON PERSON.PERSONID = ADDRESS.PERSONID;

/*
Write a SQL query to get the second highest salary from the Employee table. 
If there is only 1 salary in the table, return NULL.
*/
SELECT 
    IFNULL(
        (SELECT DISTINCT SALARY
        FROM EMPLOYEE
        ORDER BY SALARY DESC
        LIMIT 1 OFFSET 1),
        NULL) AS SecondHighestSalary;

/*
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
For the above table, Joe is the only employee who earns more than his manager.
*/
SELECT A.NAME AS EMPLOYEE
FROM EMPLOYEE AS A 
JOIN EMPLOYEE AS B 
WHERE A.MANAGERID = B.ID AND A.SALARY > B.Salary;

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/

/*

*/