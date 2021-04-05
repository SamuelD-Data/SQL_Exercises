-- Basic Join --

/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
*/
SELECT SUM(CITY.POPULATION)
FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE CONTINENT LIKE 'Asia';

/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
*/
SELECT CITY.NAME
FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE CONTINENT LIKE 'Africa';

/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
and their respective average city populations (CITY.Population) rounded down to the nearest integer.
*/
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;

/*
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, 
order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name 
and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, 
order those particular students by their marks in ascending order.
Write a query to help Eve.
*/
SELECT IF(GRADE < 8, NULL, NAME), GRADE, MARKS
FROM STUDENTS 
JOIN GRADES WHERE MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC, NAME, MARKS;

/*
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/
SELECT HACKERS.HACKER_ID, HACKERS.NAME
FROM HACKERS
JOIN SUBMISSIONS ON HACKERS.HACKER_ID = SUBMISSIONS.HACKER_ID
JOIN CHALLENGES ON SUBMISSIONS.CHALLENGE_ID = CHALLENGES.CHALLENGE_ID
JOIN DIFFICULTY ON CHALLENGES.DIFFICULTY_LEVEL = DIFFICULTY.DIFFICULTY_LEVEL
WHERE SUBMISSIONS.SCORE = DIFFICULTY.SCORE
GROUP BY HACKERS.HACKER_ID, HACKERS.NAME
HAVING COUNT(HACKERS.HACKER_ID) > 1
ORDER BY COUNT(HACKERS.HACKER_ID) DESC, HACKERS.HACKER_ID ASC
;

/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Determine the minimum number of gold galleons needed to buy each non-evil wand of each unique combination of power and age. 
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age.
*/
SELECT WANDS.ID, WANDS_PROPERTY.AGE, WANDS.COINS_NEEDED, WANDS.POWER
FROM WANDS 
JOIN WANDS_PROPERTY ON WANDS.CODE = WANDS_PROPERTY.CODE
WHERE WANDS_PROPERTY.IS_EVIL = 0 AND WANDS.COINS_NEEDED = (SELECT MIN(COINS_NEEDED) 
                                                           FROM WANDS AS WANDS2
                                                           JOIN WANDS_PROPERTY AS PROPERTY2 ON 
                                                           (WANDS2.CODE = PROPERTY2.CODE) 
                                                           WHERE WANDS2.POWER = WANDS.POWER 
                                                           AND PROPERTY2.AGE = WANDS_PROPERTY.AGE) 
ORDER BY WANDS.POWER DESC, WANDS_PROPERTY.AGE DESC
;

/*
Julia asked her students to create some coding challenges. 
Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges 
and the count is less than the maximum number of challenges created, 
then exclude those students from the result.
*/
SELECT HACKERS.HACKER_ID, HACKERS.NAME, COUNT(HACKERS.HACKER_ID) AS CHALLENGE_COUNT
FROM HACKERS
JOIN CHALLENGES ON HACKERS.HACKER_ID = CHALLENGES.HACKER_ID
GROUP BY HACKERS.HACKER_ID, HACKERS.NAME
HAVING CHALLENGE_COUNT = (SELECT MAX(TEMP_TABLE1.ID_COUNT)
                          FROM (SELECT COUNT(HACKER_ID) AS ID_COUNT
                                FROM CHALLENGES
                                GROUP BY HACKER_ID) AS TEMP_TABLE1)
       OR CHALLENGE_COUNT IN 
                          (SELECT TEMP_TABLE2.ID_COUNT
                           FROM (SELECT COUNT(*) AS ID_COUNT 
                                 FROM CHALLENGES
                                 GROUP BY HACKER_ID) AS TEMP_TABLE2
                           GROUP BY TEMP_TABLE2.ID_COUNT
                           HAVING COUNT(TEMP_TABLE2.ID_COUNT) = 1)
ORDER BY CHALLENGE_COUNT DESC, HACKERS.HACKER_ID;