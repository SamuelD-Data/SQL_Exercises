-- Northwind --

-- Write a query to get Product name and quantity/unit.  --

select productname, quantityperunit
from products

-- Write a query to get current Product list (Product ID and name). -- 

select productid, productname
from products

-- Write a query to get discontinued Product list (Product ID and name). -- 

select productid, productname
from products
where discontinued = 1

-- Write a query to get most expense and least expensive Product list (name and unit price). -- 

select productname, max(unitprice), min(unitprice)
from products
where unitprice = (select max(unitprice) from products)
OR unitprice = (select min(unitprice) from products)

-- Write a query to get Product list (id, name, unit price) where current products cost less than $20. -- 

select productid, productname, unitprice
from products
where unitprice < 20

-- Write a query to get Product list (id, name, unit price) where products cost between $15 and $25. -- 

select productid, productname, unitprice
from products
where unitprice between 15 and 25

-- Write a query to get Product list (name, unit price) of above average price. -- 

select productid, productname, unitprice
from products
where unitprice > (select avg(unitprice) from products)

-- Write a query to get Product list (name, unit price) of ten most expensive products. -- 

select productid, productname, unitprice
from products
order by unitprice
limit 10 desc

-- Write a query to count current and discontinued products. -- 

select count(productname)
from products
group by discontinued

-- Write a query to get Product list (name, units on order , units in stock) --
-- of stock is less than the quantity on order. -- 

select productname, unitsonorder, unitsinstock
from products
where unitsinstock < unitsonorder