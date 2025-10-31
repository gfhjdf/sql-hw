1.

;with cte as (select 1 as num
union all
select num + 1 from cte
where num + 1 <= 1000
)
select * from cte option (maxrecursion 1000)

2.

select emp1.EmployeeID, sum_S.sum_sales from Employees emp1
join (select employeeid, sum(salesamount) sum_sales from sales group by EmployeeID) sum_s on emp1.EmployeeID = sum_s.EmployeeID

3.

;with cte as (
select avg(salary) avg_salary from Employees
)
select * from cte

4.

select p.ProductName, h.max_amount from products p
join (select productid, max(salesamount) max_amount from sales group by ProductID) h on p.ProductID = h.ProductID

5.

;with cte as (
select 1 as num
union all
select num * 2 from cte
where num * 2 < 1000000 
)
select * from cte option (maxrecursion 0)

6.

;with cte1 as (select employeeid, count(salesid) sal from sales group by EmployeeID),
cte2 as (select * from Employees)
select cte2.FirstName, cte2.LastName from cte2
join cte1 on cte2.EmployeeID = cte1.EmployeeID
where cte2.EmployeeID = cte1.EmployeeID 

7.

;with cte1 as (select productid, salesamount from sales where SalesAmount > 500),
cte2 as (select * from products)
select * from cte2
join cte1 on cte1.ProductID = cte2.ProductID

8.

;with cte1 as (select avg(salary) avg_salary from Employees),
cte2 as (select * from Employees)
select cte2.* from cte2
cross join cte1 
where cte2.Salary > cte1.avg_salary

9.

select emp.* from employees as emp
right join (select top 5 employeeid, count(salesid) orders from sales group by EmployeeID) ord on emp.EmployeeID = ord.EmployeeID

10.

select * from sales s
join (select categoryid, productid from products group by CategoryID, ProductID) cats on s.ProductID = cats.ProductID
order by cats.CategoryID

--well, i didn't get the task -_-

11.

;with cte1 as (
select number, 1 as n, 1 as factorial from numbers1
union all
select number, n + 1, factorial * (n + 1) from cte1
where n + 1 <= number
)
select number, factorial from cte1
where number = n
order by number

12.

;with recursion as (
select string, substring(string, 1, 1) as char, 1 as n from example
union all
select string, substring(string, n + 1, 1), n + 1 from recursion
where n + 1 <= len(string)
)
select string, char from recursion
order by string

13.

select month(saledate) month, sum(SalesAmount) [total sale in the month] from sales
group by month(saledate)

-- couldn't get what to do in this task.

14.

select * from sales
select * from employees

select employeeid, sum(salesamount) from sales group by EmployeeID

--can't get what it is meant by "in each quarter". isn't like sum(salesamount) / 4? here sum is grouped by employeeid.

15.

declare @num int = 21
;with fibo as (
select 0 n1, 1 fib
union all
select fib, n1 + fib from fibo
where fib <= @num
)
select n1 from fibo

16.

select * from FindSameCharacters
where len(vals) > 1 and vals = replicate(left(vals, 1), len(vals))

17.

declare @n int = 5

;with cte as (
select cast(1 as varchar(10)) as num, 1 num2
union all
select cast((num + cast(num2 + 1 as varchar(10))) as varchar(10) ), num2 + 1 from cte
where num2 + 1 <= @n
)
select num from cte

18.















