1.

select *, ROW_NUMBER() over(order by saledate) rn from ProductSales

2.

;with cte as (
select productname, sum(quantity) total_quantity from ProductSales group by PRODUCTname
)
select *, DENSE_RANK() over(order by total_quantity desc) rn from cte

3.

;with cte as (
select *, DENSE_RANK() over(partition by customerid order by saleamount desc) dr from ProductSales
)
select * from cte where dr = 1

4.

select SaleAmount, max(SaleAmount) over(order by saledate rows between current row and 1 following) next_row from ProductSales

5.

select SaleAmount, max(SaleAmount) over(order by saledate rows between 1 preceding and current row) next_row from ProductSales

6.

select SaleAmount, max(SaleAmount) over(order by (select 1) rows between current row and 1 following) next_row from ProductSales

7.

;with cte as(
select *, DENSE_RANK() over(partition by productname order by saledate desc) dr from ProductSales
)
select * from cte A full join cte B on A.ProductName = B.ProductName and A.dr = B.dr - 1 and A.dr = 1

--undone.

8.

select *, lag(saleamount) over(order by saleamount) as prev, (saleamount - lag(saleamount) over(order by saleamount)) * 100.0 / lag(saleamount) over(order by saleamount) from ProductSales

9.

select *, lag(saleamount) over(order by productname) as prev, (saleamount / lag(saleamount) over (order by saleamount)) from ProductSales
order by ProductName

10.

select *, saleamount - first_value(saleamount) over(partition by productname order by saledate rows between unbounded preceding and unbounded following) as diff
from ProductSales
order by productname, saledate

11.

;with cte as(
select *, lag(saleamount) over(partition by productname order by saledate) prev from ProductSales
)
select * from cte where SaleAmount > prev

12.

select *, avg(SaleAmount) over (order by saleid rows between 3 preceding and current row) from ProductSales

13.

select *, saleamount - avg(saleamount) over() diff from ProductSales

14.


select *, dense_rank() over(order by salary) from Employees1 order by dense_rank() over(order by salary)

16.

;with cte as (
select *, DENSE_RANK() over(partition by department order by salary desc) dr from Employees1
)
select * from cte where dr in (1, 2)

17.

select *, first_value(salary) over(partition by department order by salary) dr from Employees1

18.

select *, sum(salary) over (partition by department order by salary) r_total_sal from Employees1

19.

select distinct department, sum(Salary) over (partition by department) total_Sal from Employees1

20.

select distinct department, avg(Salary) over (partition by department) avg_Sal from Employees1

21.

select *, salary - avg(Salary) over (partition by department) from Employees1

22.

select *, avg(salary) over(order by employeeid rows between 1 preceding and 1 following) from Employees1

23.

select sum(salary) over(order by hiredate desc rows between current row and 2 following) from Employees1




