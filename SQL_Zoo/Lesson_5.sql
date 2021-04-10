-- Lesson 5 --

-- Show id, stadium, team1, team2 for just game 1012 --

select distinct id,stadium,team1,team2
from game
join goal on game.id = goal.matchid
where matchid = 1012

-- show the player, teamid, stadium and mdate for every German goal. --

select player, teamid, stadium, mdate
from game join goal on (game.id=goal.matchid)
where teamid = 'ger'

-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%' --

select team1, team2, player
from game join goal ON (game.id=goal.matchid)
where player like 'Mario%'

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10 --

select player, teamid, coach, gtime
from goal
join eteam on (teamid = id) 
where gtime<=10

-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach. --

select mdate, teamname
from game
join eteam ON (game.team1=eteam.id)
where coach = 'fernando santos'

-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw' --

select player
from game join goal on (game.id = goal.matchid)
where stadium = 'National Stadium, Warsaw'

-- Show the stadium and the number of goals scored in each stadium. --

select stadium, count(*)
from game
join goal on id = matchid
group by stadium

-- For every match involving 'POL', show the matchid, date and the number of goals scored. --

select matchid, mdate, count(*)
from game join goal on matchid = id 
where (team1 = 'POL' or team2 = 'POL')
group by matchid, mdate

-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER' --

select matchid, mdate, count(*)
from goal
join game on (id = matchid)
where teamid = 'ger'
group by matchid, mdate

-- List every match with the goals scored by each team as shown. --
-- This will use "CASE WHEN" which has not been explained in any previous exercises. --

/*
mdate	team1	score1	team2	score2
1 July 2012	ESP	4	ITA	0
10 June 2012	ESP	1	ITA	1
10 June 2012	IRL	1	CRO	3
*/

SELECT game.mdate, game.team1, 
SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) score1,
game.team2,
SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON id = matchid
GROUP BY mdate, team1, team2