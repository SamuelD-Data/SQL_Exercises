-- Lesson 9 -- 

/*
List all movies and their combined sales in millions of dollars
*/
SELECT TITLE, (DOMESTIC_SALES + INTERNATIONAL_SALES) / 1000000 AS COMBINED_SALES
FROM MOVIES
JOIN BOXOFFICE ON MOVIES.ID = BOXOFFICE.MOVIE_ID;

/*
List all movies and their ratings in percent
*/
SELECT TITLE, RATING * 10 AS RATING_PERCENT
FROM MOVIES
JOIN BOXOFFICE ON MOVIES.ID = BOXOFFICE.MOVIE_ID;

/*
List all movies that were released on even number years
*/
SELECT TITLE, YEAR
FROM MOVIES
WHERE YEAR % 2 == 0;