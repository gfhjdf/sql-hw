1.

;with cte1 as (
select month(saledate) month, productid, sum(quantity) totalquantity from sales where month(saledate) = month(getdate()) group by month(saledate), ProductID)
select p.ProductID, totalquantity, price * totalquantity TotalRevenue into #MonthlySales from products p 
join cte1 on cte1.ProductID = p.ProductID 

2.

create view vw_ProductSalesSummary as
select p.*, o.[TotalQuantitySold] from products p
join (select productid, sum(quantity) [TotalQuantitySold] from sales group by productid) o on p.ProductID = o.ProductID

3.

create function fn_GetTotalRevenueForProduct(@ProductID INT)
returns int
as
begin 
	declare @output int = 0

	set @output = (select sum(quantity) from sales where productid = 1 group by productid) 
	return @output;
end;


4.


create function fn_GetSalesByCategory(@Category VARCHAR(50)) 
returns table
as

return(with cte as(
select p.Productname, ch.TotalQuantity, ch.TotalQuantity * p.Price TotalRevenue, Category from products p
join (select productid, sum(quantity) TotalQuantity from sales group by ProductID) ch on p.ProductID = ch.ProductID)
select ProductName, TotalQuantity, TotalRevenue from cte where Category = @Category)

5.

Create function dbo.fn_IsPrime (@Number INT)
returns varchar(5)
as
begin
	declare @result varchar(5) = ''
	declare @counter int = 2
	declare @flag bit = 1

	while @counter <= sqrt(@number)
		begin
			if @Number % @counter = 0
				begin
				set @flag = 0
				break;
				end
			set @counter += 1
		end

	if @flag = 1
		set @result = 'Yes'
	else set @result = 'No'

	return @result
		
end;
		
6.

create function fn_GetNumbersBetween(@Start INT, @End INT)
returns table
return(
with cte as (
select @Start as Number
union all
select Number + 1 from cte where Number + 1 <= @end
)
select * from cte)

7.


create function getNthHighestSalary(@n int)
returns int
as
begin
	if (select count(distinct salary) from employees) < @n
		return null
	else
		declare @result int = (select salary from (select id, salary, rank() over(order by salary desc) rn from employees) h where rn = @n)
		return @result
end

8.

select top 1 person_id, count(*) as total_friends
from (
    select requester_id as person_id, accepter_id as friend_id from friendships
    union all
    select accepter_id as person_id, requester_id as friend_id from friendships
) f
group by person_id
order by total_friends desc

9.

;with cte1 as (
select customer_id, count(order_id) total_orders from orders group by customer_id
), cte2 as(
select cte1.customer_id, cte1.total_orders, t1.total_amount, t2.last_order_date from cte1
join (select customer_id, sum(amount) total_amount from orders group by customer_id) t1 on cte1.customer_id = t1.customer_id
join (select customer_id, max(order_date) last_order_date from orders group by customer_id) t2 on cte1.customer_id = t2.customer_id)
select distinct o.customer_id, c.name, cte2.total_orders, cte2.total_amount, cte2.last_order_date from orders o
join cte2 on o.customer_id = cte2.customer_id
join customers c on o.customer_id = c.customer_id

10.

select RowNumber, first_value(Workflow) over (order by RowNumber rows between unbounded preceding and current row) wf2
from (select RowNumber, nullif(Workflow, '') Workflow from Workflows) t


