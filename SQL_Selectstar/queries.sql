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