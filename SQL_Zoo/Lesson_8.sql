-- Lesson 8 --

-- Give the id and the name for the stops on the '4' 'LRT' service. --

select id, name
from stops
join route on stops.id = route.stop
where num = '4' and company = 'LRT'

-- The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). --
-- Run the query and notice the two services that link these stops have a count of 2. --
-- Add a HAVING clause to restrict the output to these two routes. --

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*) = 2



