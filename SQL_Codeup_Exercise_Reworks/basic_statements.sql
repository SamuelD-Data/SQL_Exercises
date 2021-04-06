-- Basic Statements --

-- a. How many rows are in the albums table? -- 
SELECT COUNT(*)
FROM albums;

-- b. How many unique artist names are in the albums table? -- 
SELECT COUNT( DISTINCT(ARTIST)) AS UNIQUE_ARTIST_NAMES
FROM albums;

-- c. What is the primary key for the albums table? -- 
SHOW KEYS 
FROM albums 
WHERE KEY_NAME = 'PRIMARY';

-- d. What is the oldest release date for any album in the albums table? 
SELECT MIN(RELEASE_DATE)
FROM albums;

-- e. What is the most recent release date? -- 
SELECT max(RELEASE_DATE)
FROM albums;

-- Write queries to find the following information: -- 

-- a. The name of all albums by Pink Floyd -- 
SELECT NAME
FROM albums
WHERE ARTIST = 'PINK FLOYD';

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released -- 
SELECT RELEASE_DATE
FROM albums
WHERE NAME = "Sgt. Pepper's Lonely Hearts Club Band"

-- c. The genre for the album Nevermind -- 
SELECT GENRE
FROM albums
WHERE NAME = 'NEVERMIND';

-- d. Which albums were released in the 1990s -- 
SELECT NAME, RELEASE_DATE
FROM albums
WHERE RELEASE_DATE BETWEEN 1990 AND 1999;

-- e. Which albums had less than 20 million certified sales -- 
SELECT NAME, SALES
FROM albums
WHERE SALES < 20;