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

-- Question 3 --

select distinct cosponsor_name
from cosponsors
where cosponsor_name not in (select sponsor_name from cosponsors)

