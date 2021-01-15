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
Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.
*/
SELECT ID, 
    MAX(IF(MONTH="JAN", REVENUE, NULL)) AS JAN_REVENUE, 
    MAX(IF(MONTH="FEB", REVENUE, NULL)) AS FEB_REVENUE, 
    MAX(IF(MONTH="MAR", REVENUE, NULL)) AS MAR_REVENUE,
    MAX(IF(MONTH="APR", REVENUE, NULL)) AS APR_REVENUE,
    MAX(IF(MONTH="MAY", REVENUE, NULL)) AS MAY_REVENUE,
    MAX(IF(MONTH="JUN", REVENUE, NULL)) AS JUN_REVENUE,
    MAX(IF(MONTH="JUL", REVENUE, NULL)) AS JUL_REVENUE,
    MAX(IF(MONTH="AUG", REVENUE, NULL)) AS AUG_REVENUE,
    MAX(IF(MONTH="SEP", REVENUE, NULL)) AS SEP_REVENUE,
    MAX(IF(MONTH="OCT", REVENUE, NULL)) AS OCT_REVENUE,
    MAX(IF(MONTH="NOV", REVENUE, NULL)) AS NOV_REVENUE,
    MAX(IF(MONTH="DEC", REVENUE, NULL)) AS DEC_REVENUE
FROM DEPARTMENT
GROUP BY ID
ORDER BY ID

/*
A country is big if it has an area of bigger than 3 million square km or a population of more than 25 million.
Write a SQL solution to output big countries' name, population and area.
*/
SELECT NAME, POPULATION, AREA
FROM WORLD
WHERE (AREA > 3000000) OR (POPULATION > 25000000);

/*
Given a table salary, such as the one below, that has m=male and f=female values. 
Swap all f and m values (i.e., change all f values to m and vice versa) with a single update statement and no intermediate temp table.
Note that you must write a single update statement, DO NOT write any select statement for this problem.
*/
UPDATE SALARY
SET SEX = IF(SEX = "m", "f", "m");

/*
Please write a SQL query to output movies with an odd numbered ID and a description that is not 'boring'. 
Order the result by rating (descending).
*/
SELECT ID, MOVIE, DESCRIPTION, RATING
FROM CINEMA
WHERE (ID % 2 = 1) AND (DESCRIPTION != 'boring')
ORDER BY RATING DESC;