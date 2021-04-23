-- Queries --

-- Question 1 --

select person, count(*)
from (select  c1.sponsor_name as person
from cosponsors as c1	
join cosponsors c2 on 
c1.sponsor_name =  c2.cosponsor_name and
c2.sponsor_name =  c1.cosponsor_name
group by c1.sponsor_name, c1.cosponsor_name)
group by person
order by count(*) desc
limit 1

-- Alternate solution --

with mutuals as (
  select c1.sponsor_name
  from cosponsors as c1
  join cosponsors as c2 
  on c1.sponsor_name = c2.cosponsor_name
  and c1.cosponsor_name = c2.sponsor_name
  group by c1.sponsor_name, c1.cosponsor_name)

select sponsor_name, count(*)
from mutuals
group by sponsor_name
order by count(*) desc
limit 1

-- Question 2 --

select sponsor_state, person, max(mutuals)
from cosponsors
join
(
select person, count(*) as mutuals
from (select  c1.sponsor_name as person
from cosponsors as c1	
join cosponsors c2 on 
c1.sponsor_name =  c2.cosponsor_name and
c2.sponsor_name =  c1.cosponsor_name
group by c1.sponsor_name, c1.cosponsor_name)
group by person
) as people 
on people.person = cosponsors.sponsor_name
group by sponsor_state

-- Alternate Solution --

with mutuals as (
  select c1.sponsor_name
  from cosponsors as c1
  join cosponsors as c2 
  on c1.sponsor_name = c2.cosponsor_name
  and c1.cosponsor_name = c2.sponsor_name
  group by c1.sponsor_name, c1.cosponsor_name),
	
s_counts as(
select sponsor_name, count(*) as cospons
from mutuals
group by sponsor_name),

state_spons as (
select s_counts.sponsor_name,
		sponsor_state,
		cospons
from s_counts
join (select distinct sponsor_state, sponsor_name
	  from cosponsors)
	as i_states on 
	i_states.sponsor_name = s_counts.sponsor_name)
	
select sponsor_state,sponsor_name, cospons
from state_spons as ss1
where cospons >=  (select max(cospons) 
				   from state_spons as ss2
				  where ss1.sponsor_state =
				  ss2.sponsor_state)


-- Question 3 --

select distinct cosponsor_name
from cosponsors
where cosponsor_name not in (select sponsor_name from cosponsors)

