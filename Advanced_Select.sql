-- SQL Advanced Select --

/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
*/
SELECT 
CASE 
WHEN (A + B > C) AND (B + C > A) AND (A + C > B) THEN 
CASE 
WHEN (A = B) AND (B = C) THEN 'Equilateral'
WHEN (A = B) OR (B = C) OR (A = C) THEN 'Isosceles'
ELSE 'Scalene' END
ELSE 'Not A Triangle' END
FROM TRIANGLES;

/*
Generate the following two result sets:
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses).
 For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format: 
There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. 
If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
*/
SELECT CONCAT(NAME, '(',LEFT(OCCUPATION,1),')')
FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(OCCUPATION), 's.')
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(*), OCCUPATION;

/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
*/
SET @r1=0, @r2=0, @r3=0, @r4=0;
SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor)
FROM(
  SELECT CASE 
            WHEN OCCUPATION='Doctor' THEN (@r1:=@r1+1)
            WHEN OCCUPATION='Professor' THEN (@r2:=@r2+1)
            WHEN OCCUPATION='Singer' THEN (@r3:=@r3+1)
            WHEN OCCUPATION='Actor' THEN (@r4:=@r4+1) END AS RowNumber,
    CASE WHEN OCCUPATION='Doctor' THEN NAME END AS Doctor,
    CASE WHEN OCCUPATION='Professor' THEN NAME END AS Professor,
    CASE WHEN OCCUPATION='Singer' THEN NAME END AS Singer,
    CASE WHEN OCCUPATION='Actor' THEN NAME END AS Actor
  FROM OCCUPATIONS
  ORDER BY NAME
) TEMP
GROUP BY RowNumber;

/*
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/
SELECT CASE
    WHEN P IS NULL THEN CONCAT(N, ' Root')
    WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N, ' Inner')
    ELSE CONCAT(N, ' Leaf')
    END
FROM BST
ORDER BY N ASC