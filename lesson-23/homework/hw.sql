1.

select dt, case when month(dt) < 10 then concat('0', cast(month(dt) as varchar(3))) else cast(month(dt) as varchar(3)) end MonthPrefixedWithZero from dates

2.

;with cte1 as(
select count(distinct id) Distinct_Ids from MyTabel
), cte2 as (
select id, rid, max(vals) maxs from MyTabel group by id, rid
)
select distinct cte1.*, cte2.rid, sum(maxs) over() TotalOfMaxVals from cte1 cross join cte2

3.

select * from TestFixLengths where len(vals) >= 6 and len(vals) <= 10

4.

;with cte as(
select id, max(vals) max_val from TestMaximum group by id
)
select tm.* from TestMaximum tm join cte on tm.ID = cte.ID and tm.Vals = cte.max_val

5.

;with cte as (
select distinct id, detailednumber, first_value(vals) over(partition by id, detailednumber order by vals desc) ch from SumOfMax
)
select id, sum(ch) SumofMax from cte group by id

6.

  select *, iif(a - b = 0, '', cast(a - b as varchar(max))) output from TheZeroPuzzle

7.

select sum(QuantitySold * UnitPrice)from sales

8.

select avg(UnitPrice) from sales

9.

select count(saleid) from sales

10.

select max(QuantitySold) from sales

11.

select category, sum(QuantitySold) from sales group by Category

12.

select region, sum(UnitPrice * QuantitySold) from sales group by region

13.

select top 1 Product, max(UnitPrice * QuantitySold) from sales group by Product

14.

select sum(UnitPrice * QuantitySold) over(order by saledate rows between unbounded preceding and current row) from sales

15.

select category, sum(UnitPrice * QuantitySold) from sales group by Category

17.

select s.*, c.CustomerName from Customers c 
join sales s on c.CustomerID = s.CustomerID

18.

select CustomerID, CustomerName from customers
where CustomerID not in (select distinct CustomerID from sales)

19.

select CustomerID, sum(QuantitySold * UnitPrice) over(partition by customerid order by saleid) t_amount from sales

20.

;with cte as (select CustomerID, sum(QuantitySold * UnitPrice) over(partition by customerid order by saleid) t_amount from sales)
select top 1 * from cte order by t_amount

21.

select customerid, sum(quantitysold * unitprice) from sales group by CustomerID

22.

select * from Products
where productname in (select product from sales)

23.

select top 1 * from Products where SellingPrice = (select max(sellingprice) from products)

24.

select * from Products p
join (select category, avg(sellingprice) avg_p from products group by Category) ch on p.Category = ch.avg_p 
where p.SellingPrice > ch.avg_p













