-- Advanced Join --

/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: 
ID and Salary (offered salary in $ thousands per month).
Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/

SELECT NAME
FROM STUDENTS
JOIN FRIENDS ON FRIENDS.ID = STUDENTS.ID
JOIN PACKAGES PACK1 ON STUDENTS.ID = PACK1.ID
JOIN PACKAGES PACK2 ON FRIENDS.FRIEND_ID = PACK2.ID
WHERE PACK1.SALARY < PACK2.SALARY
ORDER BY PACK2.SALARY;

/*
Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.
*/

SELECT FUNC1.X, FUNC1.Y
FROM FUNCTIONS FUNC1
JOIN (SELECT * FROM FUNCTIONS) AS FUNC2 ON FUNC1.X = FUNC2.Y AND FUNC1.Y = FUNC2.X
GROUP BY FUNC1.X, FUNC1.Y
HAVING COUNT(FUNC1.X) > 1 OR FUNC1.X < FUNC1.Y
ORDER BY FUNC1.X 

/*
Samantha interviews many candidates from different colleges using coding challenges and contests. 
Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, 
total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.
Note: A specific contest can be used to screen candidates at more than one college, but each college only holds 1 screening contest.
*/

SELECT con.CONTEST_ID, con.HACKER_ID,  con.NAME, col.COLLEGE_ID, chal.CHALLENGE_ID, vs.TOTAL_VIEWS, vs.TOTAL_UNIQUE_VIEWS, sub.TOTAL_SUBMISSIONS, sub.TOTAL_ACCEPTED_SUBMISSIONS
FROM contests AS con
JOIN colleges AS col on con.CONTEST_ID = col.CONTEST_ID
JOIN challenges AS chal on col.COLLEGE_ID = chal.COLLEGE_ID
JOIN view_stats AS vs on chal.CHALLENGE_ID = vs.CHALLENGE_ID
JOIN submission_stats AS sub on vs.CHALLENGE_ID = sub.CHALLENGE_ID
GROUP BY con.CONTEST_ID
ORDER BY con.CONTEST_ID