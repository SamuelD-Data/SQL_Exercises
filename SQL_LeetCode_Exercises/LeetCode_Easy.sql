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
Write a SQL query to find all duplicate emails in a table named Person.
*/
SELECT EMAIL
FROM PERSON
GROUP BY EMAIL
HAVING COUNT(EMAIL) > 1;

/*
Suppose that a website contains two tables, the Customers table and the Orders table. 
Write a SQL query to find all customers who never order anything.
*/
SELECT NAME AS CUSTOMERS
FROM CUSTOMERS
WHERE ID NOT IN (SELECT CUSTOMERID FROM ORDERS)

/*
Write a SQL query to delete all duplicate email entries in a table named Person, 
keeping only unique emails based on its smallest Id.
*/
DELETE PERSON1 
FROM PERSON AS PERSON1
JOIN PERSON AS PERSON2
WHERE (PERSON1.Email = PERSON2.Email) AND (PERSON1.Id > PERSON2.Id)

/*
Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).
*/
SELECT W1.ID
FROM WEATHER AS W1
JOIN WEATHER AS W2
WHERE DATEDIFF(W1.RECORDDATE, W2.RECORDDATE) = 1 AND (W1.TEMPERATURE > W2.TEMPERATURE)

/*
There is a table courses with columns: student and class
Please list out all classes which have more than or equal to 5 students.
*/
SELECT CLASS
FROM COURSES
GROUP BY CLASS
HAVING COUNT(DISTINCT STUDENT) >= 5;

/*

*/

/*

*/