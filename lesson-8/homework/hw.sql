1. 
select category, sum(stockquantity) from products
group by category
2.
select * from products
select category, avg(price) from products
group by category
having category = 'electronics'
3.
select * from customers
where city like 'L%'
4.
select * from products
where productname like '%er'
5.
select * from customers
where country like '%A'
6.
select max(price) from products
7.
select *, case
when stockquantity < 30 then 'Low Stock'
else 'Sufficient' end
from products
8.
select country, count(customerid) from customers
group by country
9.
select min(totalamount), max(totalamount) from orders
10.
select * from orders 
where orderdate like '2023-01%'

11.
select productname from products
union all
select productname from products_discounted

12.
select productname from products
union 
select productname from products_discounted
13.
select YEAR(orderdate), avg(totalamount) from orders
group by year(orderdate)
14.
select productname, case
when price < 100 then 'low'
when price between 100 and 500 then 'mid'
when price > 500 then 'high' 
end 'productgroup'
from products
15.
SELECT * FROM city_population PIVOT (sum(population) FOR year IN ([2012], [2013])) AS PVT_TABLE
SELECT * INTO Population_Each_Year from (SELECT * FROM city_population PIVOT (sum(population) FOR year IN ([2012], [2013])) AS PVT_TABLE)

select * from Population_Each_Year

16.
select productid, sum(saleamount) from sales
group by productid
17.
select productname from products
where productname like '%oo%'
18.
could you explain me how to solve the tasks which aren't not done here? 
19.
select top(3) customerid, sum(totalamount) totalspent from invoices
group by customerid
order by totalspent desc



