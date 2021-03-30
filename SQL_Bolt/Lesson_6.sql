-- Lesson 6 --

/*
Find the domestic and international sales for each movie
*/
SELECT TITLE, DOMESTIC_SALES, INTERNATIONAL_SALES
FROM MOVIES
JOIN BOXOFFICE ON MOVIES.ID = BOXOFFICE.MOVIE_ID;

/*
Show the sales numbers for each movie that did better internationally rather than domestically
*/
SELECT TITLE, DOMESTIC_SALES, INTERNATIONAL_SALES
FROM MOVIES
JOIN BOXOFFICE ON MOVIES.ID = BOXOFFICE.MOVIE_ID
WHERE INTERNATIONAL_SALES > DOMESTIC_SALES;

/*
List all the movies by their ratings in descending order
*/
SELECT TITLE, RATING
FROM MOVIES
JOIN BOXOFFICE ON MOVIES.ID = BOXOFFICE.MOVIE_ID
ORDER BY RATING DESC;