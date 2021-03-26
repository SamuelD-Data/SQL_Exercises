-- Lesson 4 --

/*
List all directors of Pixar movies (alphabetically), without duplicates
*/
SELECT DISTINCT DIRECTOR
FROM MOVIES
ORDER BY DIRECTOR;

/*
List the last four Pixar movies released (ordered from most recent to least)
*/
SELECT TITLE
FROM MOVIES
ORDER BY YEAR DESC
LIMIT 4;

/*
List the first five Pixar movies sorted alphabetically
*/
SELECT TITLE
FROM MOVIES
ORDER BY TITLE
LIMIT 5;

/*
List the next five Pixar movies sorted alphabetically
*/
SELECT TITLE
FROM MOVIES
ORDER BY TITLE
LIMIT 5 OFFSET 5;