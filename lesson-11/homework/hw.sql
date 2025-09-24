1.

select o.orderid, c.FirstName + ' ' + c.LastName as Customername, o.orderdate from orders as o
join customers as c on c.CustomerID = o.CustomerID
where year(o.OrderDate) > 2022

2.

select e.name, d.departmentname from Employees as e
join Departments as d on d.DepartmentID = e.DepartmentID
where d.DepartmentName in ('Sales', 'Marketing')

3.

select d.DepartmentName, max(e.salary) as MaxSalary from Employees as e
join Departments as d on e.departmentid = d.DepartmentID
group by d.DepartmentName

4.

select c.firstname, c.lastname, o.orderid, o.orderdate from customers as c 
join orders as o on c.CustomerID = o.CustomerID
where c.Country = 'USA' and year(o.OrderDate) = 2023

5.

select c.firstname, c.LastName, count(o.orderid) as TotalOrders from customers as c
join orders as o on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName

6.

select p.productname, s.suppliername from products as p
join suppliers as s on p.supplierid = s.supplierid
where s.suppliername in ('Gadget Supplies', 'Clothing Mart')

7.

select c.FirstName, c.LastName, max(o.orderdate) as MostRecentOrderDate from customers as c
left join orders as o on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName

8.

select c.firstname, c.lastname, o.totalamount from customers as c 
join orders as o on c.CustomerID = o.CustomerID
where o.TotalAmount > 500

9.

select p.productname, s.saledate, s.saleamount from Products as p
join sales as s on p.ProductID = s.ProductID
where year(s.saledate) = 2022 or s.SaleAmount > 400

10.

select p.productname, sum(s.saleamount) as TotalSalesAmount from products as p
join sales as s on p.ProductID = s.ProductID
group by p.ProductName

11.

select e.name, d.departmentname, e.salary from Employees as e
join Departments as d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Human Resources' and e.Salary > 60000

12.

select p.productname, s.saledate, p.stockquantity from products as p
join sales as s on p.ProductID = s.ProductID
where year(s.SaleDate) = 2023 and p.StockQuantity > 100

13.

select e.name, d.departmentname, e.hiredate from Employees as e
join Departments as d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Sales' or year(e.hiredate) > 2020

14.

select c.firstname, c.lastname, o.orderid, c.address, o.orderdate from Customers as c
join orders as o on c.CustomerID = o.CustomerID
where c.Address like '[0123456789][0123456789][0123456789][0123456789]%'

15.

select p.productname, p.category, s.saleamount from products as p
join sales as s on p.ProductID = s.ProductID
where p.Category = 1 or s.SaleAmount > 350

16.

select c.categoryname, sum(p.stockquantity) ProductCount from products as p
join Categories as c on c.CategoryID = p.Category
group by c.CategoryName

17.

select c.firstname, c.lastname, c.city, o.orderid, o.totalamount from Customers as c 
join orders as o on c.CustomerID = o.CustomerID
where c.city = 'Los Angeles' and o.TotalAmount > 300

18.

select e.name, d.departmentname from Employees as e
join Departments as d on e.DepartmentID = d.DepartmentID
where d.DepartmentName not in ('Human Resources', 'Finance') or e.name like '%[AEIOUY]%[AEIOUY]%[AEIOUY]%[AEIOUY]%'

19.

select e.name, d.departmentname, e.salary from Employees as e
join Departments as d on e.DepartmentID = d.DepartmentID
where d.DepartmentName in ('Sales', 'Marketing') and e.Salary > 60000



