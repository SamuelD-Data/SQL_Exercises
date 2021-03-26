-- Lesson 3 -- 

/*
Find all the Toy Story movies
*/
SELECT * 
FROM MOVIES
WHERE TITLE LIKE '%TOY STORY%';

/*
Find all the movies directed by John Lasseter
*/
SELECT * 
FROM MOVIES
WHERE DIRECTOR LIKE '%JOHN LASSETER%';

/*
Find all the movies (and director) not directed by John Lasseter
*/
SELECT * 
FROM MOVIES
WHERE DIRECTOR NOT LIKE '%JOHN LASSETER%';

/*
Find all the WALL-* movies
*/
SELECT * 
FROM MOVIES
WHERE TITLE LIKE '%WALL-%';