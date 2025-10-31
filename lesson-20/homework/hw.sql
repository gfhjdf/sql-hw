1.

select * from #Sales

2. 

select top 1 product, sum(price) total_amount from #sales group by product order by sum(price) desc 

3. 

select product, sum(price) total_amount from #sales group by product order by sum(price) desc offset 1 rows fetch next 1 rows only

4.

select product, month(saledate) month_num, sum(quantity) total_quantity from #sales group by product, month(saledate)

5.

select CustomerName, product from  #Sales
where exists (select product from #sales)
order by product

6.

select Name, [Apple], [Orange], [Banana]
from (select Name, Fruit from Fruits) src
pivot (count(Fruit) for Fruit in ([Apple], [Orange], [Banana])
) p;

7.

select f1.ParentId, f2.ChildID from family f1 cross join family f2
order by f1.ParentId

8.

select * from #Orders
where DeliveryState = 'TX' and CustomerID in (
select distinct CustomerID from #Orders
where DeliveryState = 'CA')

9.

;with cte1 as (
    select fullname, address
    from #residents
    where patindex('%' + fullname + '%', address) = 0
)
update r
set address = 'name=' + c.fullname + ' ' + r.address
from #residents r
join cte1 c on r.fullname = c.fullname

10.

--undone.

select * from #Routes r1
join #Routes r2 on r1.ArrivalCity = r2.DepartureCity
join #Routes r3 on r2.ArrivalCity = r3.DepartureCity
where r1.DepartureCity = 'Tashkent' and r3.ArrivalCity = 'Khorezm'

11.

select *, rank() over (order by id) rn from #RankingPuzzle

12.

select es.* from #EmployeeSales es
join (select department, avg(salesamounT) avg_sal from #EmployeeSales group by Department) sal on es.Department = sal.Department
where es.SalesAmount > sal.avg_sal

14.

select * from #EmployeeSales
where exists (select salesmonth, max(salesamount) salesamount from #EmployeeSales group by SalesMonth)

15.

select name from Products
where price > (select avg(price) from products)


16.

select * from Products
select top 1 productid, count(stock) from products group by productid order by count(stock) desc

17.

select name from products where category = 'Laptop'

18.

select * from products
where price > (select min(price) from products where category = 'Electronics')

19.

select p.* from products p
join (select category, avg(price) price from products group by category) ch on p.Category = ch.Category
where p.Price > ch.price

20.

select * from Products
where productid in (select productid from (select productid, count(orderid) total_orders from orders group by productid having count(orderid) >= 1) ch)

21.

select * from products
where ProductID in (select ProductID from orders where quantity > (select avg(quantity) from orders)) 

22.

select * from products
where ProductID not in (select ProductID from orders)

23.

select * from products where ProductID in (select ProductID from (select top 1 productid, sum(quantity) total_quant from orders group by ProductID order by sum(quantity) desc) ch)



