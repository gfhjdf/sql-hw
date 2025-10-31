1.
;with regions as (
select distinct region from #RegionSales
),
distributors as (
select distinct distributor from #RegionSales
)
select r.Region, d.Distributor, isnull(rs.Sales, 0) sales from regions r cross join distributors d
left join #RegionSales as rs on r.Region = rs.Region and d.Distributor = rs.Distributor

2.

select * from Employee
where id in (select managerid from (select managerid, count(id) emps from Employee where managerid >= 5 group by managerId) checker)

3.

select Product_Name, prod.unit from products
join (select product_id, sum(unit) unit from orders where order_date between '02-01-2020' and '02-29-2020' group by product_id having sum(unit) >= 100) prod on products.product_id = prod.product_id

4.

select o.CustomerID, vendor from orders o
join (select customerid, max(counting) max_val from orders group by customerid) ch on ch.CustomerID = o.CustomerID and ch.max_val = o.Counting
order by o.CustomerID

5.

DECLARE @Check_Prime INT = 91,
		@counter int = 2

declare @flag bit = 1

while @counter <= sqrt(@check_prime)
begin
if @Check_Prime % @counter = 0
	begin
	set @flag = 0
	break;
	end
set @counter += 1
end

if @flag = 1
	select 'This number is prime'
else select 'This number is not prime'

6.

;with cte2 as (
select device_id, count(distinct locations) no_of_location from device group by Device_id),
cte3 as (
select device_id, count(locations) no_of_signals from device group by Device_id),
cte4 as (
select distinct locations max_signal_location, device_id, count(device_id) ct, dense_rank() over (partition by device_id order by count(device_id) desc) dr from device group by locations, Device_id
)
select cte2.Device_id, cte2.no_of_location, cte4.max_signal_location, cte3.no_of_signals from cte2
join cte3 on cte2.Device_id = cte3.Device_id
join cte4 on cte4.Device_id = cte2.Device_id
where dr = 1

7.

select empid, empname, salary from Employee e
join (select deptid, avg(salary) avg_sal from Employee group by deptid) sal on e.deptid = sal.deptid
where e.salary > sal.avg_sal

8.

select TicketID, STRING_AGG(Number, ', ') numbers from Tickets group  by TicketID

9.

;with cte1 as (
select spend_date, platform, sum(amount) mon from spending
group by Spend_date, platform
), cte2 as (
select spend_date, 'Both' platform, sum(amount) total_amount from spending group by Spend_date
), cte3 as (select spend_date, platform, count(distinct user_id) total_users from spending group by rollup (Spend_date, platform)),
cte4 as (
select * from cte2 union all select * from cte1
),
cte5 as (select spend_Date, count(distinct user_id) total from spending group by Spend_date)
select cte4.Spend_date, cte4.platform, cte4.total_amount, isnull(total_users, total) total_users from cte4
left join cte3 on cte4.Spend_date = cte3.Spend_date and cte4.platform = cte3.Platform
left join cte5 on cte5.spend_Date = cte4.spend_date
order by cte4.spend_date, total_amount

10.

DROP TABLE IF EXISTS Grouped;
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);

;with cte as (
select product, 1 quantity, quantity total from grouped 
union all
select product, quantity, total - 1 from cte where total - 1 >= 1
)
select product, quantity from cte
order by product


