-- Lesson 12 --

/* 
Find the number of movies each director has directed
*/
SELECT DIRECTOR, COUNT(TITLE) AS MOVIES_DIRECTED
FROM MOVIES
GROUP BY DIRECTOR;

/*
Find the total domestic and international sales that can be attributed to each director
*/
SELECT DIRECTOR, SUM(DOMESTIC_SALES + INTERNATIONAL_SALES) AS TOTAL_SALES
FROM MOVIES
JOIN BOXOFFICE ON MOVIES.ID = BOXOFFICE.MOVIE_ID
GROUP BY DIRECTOR;
