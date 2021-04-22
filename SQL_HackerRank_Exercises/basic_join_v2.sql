-- Basic Join V2 --

-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'. --

select sum(city.population)
from city
join country on city.countrycode = country.code 
where continent = 'asia'

-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'. --

select city.name
from city
join country on city.countrycode = country.code 
where continent = 'africa'

-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations --
-- (CITY.Population) rounded down to the nearest integer. --

select continent, round(avg(city.population))
from city
join country on city.countrycode = country.code 
group by continent

-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) --
-- and their respective average city populations (CITY.Population) rounded down to the nearest integer. --

select continent, floor(avg(city.population))
from city
join country on city.countrycode = country.code 
group by continent

/*
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
Write a query to help Eve.
*/

select case when grade < 8 then null else name end, grade, marks
from students
join grades 
where marks between min_mark and max_mark
order by grade desc, name, marks

/*
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/

select hackers.hacker_id, name
from hackers
join submissions on hackers.hacker_id = submissions.hacker_id
join challenges on submissions.challenge_id = challenges.challenge_id 
join difficulty on challenges.difficulty_level = difficulty.difficulty_level
where submissions.score = difficulty.score
group by hackers.hacker_id, name
having count(*) > 1
order by count(*) desc, hackers.hacker_id

-- Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. --
-- If more than one wand has same power, sort the result in order of descending age. --

select id, age, coins_needed, power
from wands as w1
join wands_property as wp1 on w1.code = wp1.code
where is_evil = 0
and coins_needed = (select min(coins_needed)
          from wands as w2
          join wands_property as wp2 on w2.code = wp2.code 
          where wp2.age = wp1.age and w2.power = w1.power)
order by power desc, age desc 

/*
Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, 
then exclude those students from the result.
*/

select h1.hacker_id, name, count(*)
from hackers as h1
join challenges on h1.hacker_id = challenges.hacker_id
group by hacker_id, name
having count(*) not in (select count(*)
                    from hackers as h2
                    join challenges on h2.hacker_id = challenges.hacker_id
                    where h2.hacker_id != h1.hacker_id
                    group by h2.hacker_id) 
or count(*) >= all (select count(*)
                    from hackers as h3
                    join challenges on h3.hacker_id = challenges.hacker_id
                    group by h3.hacker_id) 
order by count(*) desc, h1.hacker_id

/*
The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of 0 from your result.
*/

select h1.hacker_id, h1.name, sum(max_scores)
from hackers as h1
join (select challenge_id, hacker_id, max(score) as max_scores
      from submissions
     group by challenge_id, hacker_id) as all_max_scores
     on h1.hacker_id = all_max_scores.hacker_id
group by h1.hacker_id, h1.name
having sum(max_scores) != 0
order by sum(max_scores) desc, h1.hacker_id




