-- Lesson 6 --

-- Lesson 6 --

-- List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). --
-- Order results by year. --

select id, title, yr
from movie
where title like '%star trek%'
order by yr

-- What id number does the actor 'Glenn Close' have? --

select id
from actor
where name = 'glenn close'

-- What is the id of the film 'Casablanca' --

select id
from movie
where title = 'casablanca'

-- Obtain the cast list for 'Casablanca'. -- 

select name
from actor
join casting on actor.id = casting.actorid
join movie on casting.movieid = movie.id
where movie.title = 'casablanca'

-- Obtain the cast list for the film 'Alien' --

select name
from actor
join casting on actor.id = casting.actorid
join movie on casting.movieid = movie.id
where movie.title = 'alien'

-- List the films in which 'Harrison Ford' has appeared --

select title
from actor
join casting on actor.id = casting.actorid
join movie on casting.movieid = movie.id
where actor.name = 'harrison ford'

-- List the films where 'Harrison Ford' has appeared - but not in the starring role. -- 

select title
from actor
join casting on actor.id = casting.actorid
join movie on casting.movieid = movie.id
where actor.name = 'harrison ford' and casting.ord != 1

 -- List the films together with the leading star for all 1962 films. --

select movie.title, actor.name
from actor
join casting on actor.id = casting.actorid
join movie on casting.movieid = movie.id
where movie.yr = 1962 and casting.ord = 1

-- Which were the busiest years for 'Rock Hudson', --
-- show the year and the number of movies he made each year for any year in which he made more than 2 movies. --

select yr, count(*)
from actor
join casting on actor.id = casting.actorid
join movie on casting.movieid = movie.id
where actor.name = 'rock hudson'
group by yr 
having count(*) > 2



