1.
select ProductName Name from Products
2.
select * from Customers Client 
3.
select productname from products 
union
select productname from Products_Discounted
4.
select * from products 
intersect
select * from Products_Discounted
5.
select distinct firstname, lastname, country from Customers
6.
select *, case
when Price > 1000 then 'High'
when Price <= 1000 then 'Low'
end
from Products
7.
SELECT *, IIF(StockQuantity > 100, 'Yes', 'No') FROM Products_Discounted

8.
select productname from products
union
select productname from products_discounted
9.
select * from products
except
select * from products_discounted

10.
select *, 
iif(Price > 1000, 'Expensive', 'Affordable')
from Products
  
11.
select * from employees
where Age < 25 or Salary < 60000

12.

update employees
set Salary = Salary + (Salary * 0.10)
where DepartmentName = 'HR' or EmployeeID = 5

13.

select *, case
when SaleAmount > 500 then 'Top Tier'
when SaleAmount BETWEEN 200 and 500 then 'Mid Tier'
else 'Low Tier'
end
from Sales 
14.

select CustomerID from customers
except
select CustomerID from sales

15.
 select customerid, quantity, case
 when quantity = 1 then '3%'
 when quantity between 1 and 3 then '5%'
 else '7%'
 end
 from orders
