-- Lesson 2 --

/*
Find the movie with a row id of 6
*/
SELECT * 
FROM MOVIES
WHERE ID LIKE 6;

/*
Find the movies released in the years between 2000 and 2010
*/
SELECT * 
FROM MOVIES
WHERE YEAR BETWEEN 2000 AND 2010;

/*
Find the movies not released in the years between 2000 and 2010
*/
SELECT * 
FROM MOVIES
WHERE YEAR NOT BETWEEN 2000 AND 2010;

/*
Find the first 5 Pixar movies and their release year
*/
SELECT * 
FROM MOVIES
ORDER BY YEAR
LIMIT 5;