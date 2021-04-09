-- Lesson 2 --

-- Show the year and subject that won 'Albert Einstein' his prize. --

select yr, subject
from nobel
where winner = 'albert einstein'

-- Give the name of the 'Peace' winners since the year 2000, including 2000. --

select winner
from nobel
where subject = 'peace'
and yr >= 2000

-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. --

select yr, subject, winner
from nobel
where subject = 'literature'
and yr between 1980 and 1989

-- Show the winners with first name John --

select winner
from nobel
where winner like 'john%'

-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984. --

select yr, subject, winner
from nobel
where (subject = 'physics' and yr = 1980) or (subject = 'chemistry' and yr = 1984) 

-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine --

select yr, subject, winner
from nobel
where yr = 1980 and subject not in ('chemistry', 'medicine')

-- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) --
-- together with winners of a 'Literature' prize in a later year (after 2004, including 2004) --

select yr, subject, winner
from nobel
where (subject = 'medicine' and yr < 1910) or (subject = 'literature' and yr >= 2004)

-- Find all details of the prize won by EUGENE O'NEILL --

select yr, subject,  winner
from nobel
where winner = 'eugene o''neill'

-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order. --

select winner, yr, subject
from nobel
where winner like 'sir%'
order by yr desc, winner

