-- Lesson 13 --

/*
Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)
*/
INSERT INTO MOVIES (ID, TITLE, DIRECTOR, YEAR, LENGTH_MINUTES)
VALUES (15, 'TOY STORY 4', 'JOSH COOLEY', 2019, 73);

/*
Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, 
and made 340 million domestically and 270 million internationally. 
Add the record to the BoxOffice table.
*/
INSERT INTO BOXOFFICE (MOVIE_ID, RATING, DOMESTIC_SALES, INTERNATIONAL_SALES)
VALUES (15, 8.7, 340000000, 270000000);
