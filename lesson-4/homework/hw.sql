1. 
select top(5) * from [dbo].[[dbo].[Employees]]
2.
select distinct Category from [dbo].[[dbo].[Products]]
3.
select * from [dbo].[Products]
where price > 100
4. 
select * from [dbo].[Customers]
where FirstName like 'A%'
5. 
select * from [dbo].[Products]
order by Price
6. 
select * from [dbo].[Employees]
where Salary >= 60000 AND DepartmentName = 'HR'
7. 
select isnull(Email, 'noemail@example.com') from [dbo].[Employees]
8.
select * from [dbo].[Products]
where Price between 50 and 100
9. 
select distinct Category, ProductName from [dbo].[Products]
10.
select distinct Category, ProductName from [dbo].[Products]
order by ProductName DESC
11.
select top(10) * from [dbo].[Products]
order by ProductName DESC
12. 
select coalesce(FirstName, LastName) from [dbo].[Employees]
13.
select distinct Category, Price from [dbo].[Products]
14.

select * from [dbo].[Employees]
where Age between 30 and 40 OR DepartmentName = 'Marketing'

15.

select * from [dbo].[Employees]
order by Salary DESC OFFSET 10 rows FETCH NEXT 10 ROWS ONLY

16.

select * from [dbo].[Products]
where Price <= 1000 and StockQuantity > 50
order by Stock

17. 

select * from [dbo].[Products]
where ProductName like '%e%'

18.

select * from [dbo].[Employees]
where DepartmentName in ('HR', 'IT', 'Finance')

19. 
select * from [dbo].[Customers]
order by City, PostalCode DESC

20.
select top(5) * from [dbo].[Products]
order by SaleAmount DESC
21.

select FirstName + ' ' + LastName as FullName from Employees

22.

select distinct Category, ProductName, Price from Products
where Price > 50

23.

select * from Products
where Price < (select avg(price) from Products) * 0.10

24.

select * from Employees
where Age < 30 and DepartmentName in ('HR', 'IT')

25.

select * from Customers
where Email like '%@gmail.com'

26.

select * from Employees
where Salary > all(select Salary from Employees where DepartmentName = 'Sales')

27.

SELECT * FROM Orders
WHERE OrderDate BETWEEN DATEADD(day, -180, (SELECT MAX(OrderDate) FROM Orders)) AND (SELECT MAX(OrderDate) FROM Orders);


