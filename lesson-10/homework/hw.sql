1.

select name, salary, Departments.DepartmentName from employees
join departments on employees.DepartmentID = Departments.DepartmentID
where salary > 50000

2.

select firstname, lastname, orders.orderdate from customers
join orders on customers.CustomerID = orders.CustomerID
where year(orders.OrderDate) = 2023

3.

select emp.name, dep.DepartmentName from employees as emp left join Departments as dep on emp.DepartmentID = dep.DepartmentID

4.

select s.suppliername, pr.ProductName from suppliers as s left join products as pr on s.SupplierID = pr.SupplierID

5.

select o.orderid, o.orderdate, p.paymentdate, p.amount from orders as o full join payments as p on o.orderID = p.OrderID

6.

select emp1.name, emp2.name from employees as emp1
join Employees as emp2 on emp1.EmployeeID = emp2.ManagerID

7.

select s.name, c.coursename from students as s
join Enrollments as e on s.StudentID = e.StudentID
join courses as c on e.CourseID = c.CourseID
where c.CourseName = 'Math 101'

8.

select c.firstname, c.lastname, o.quantity from customers as c
join orders as o on c.CustomerID = o.CustomerID
where o.Quantity > 3

9.

select e.name, d.departmentname from Employees as e
join Departments as d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Human Resources'

10.

select d.departmentname, count(DepartmentName) as EmployeeCount from Employees as e
join Departments as d on e.DepartmentID = d.DepartmentID
group by DepartmentName
having count(departmentname) > 5

11.

select p.productid, p.productname from products as p
left join sales as s on p.ProductID = s.ProductID
where s.saleid is null

12.

select c.firstname, c.lastname, count(o.OrderID) as TotalOrders from customers as c
join orders as o on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName
having count(o.orderid) >= 1

13.

select e.name, d.departmentname from employees as e
full join Departments as d on e.DepartmentID = d.DepartmentID
where e.name is not null and d.DepartmentName is not null

14.

select emp1.name as Employee1, emp2.name as Employee2, emp1.ManagerID as ManagerId from Employees as emp1
join Employees as emp2 on emp1.ManagerID = emp2.ManagerID

15.

select o.orderid, o.orderdate, c.firstname, c.lastname from orders as o
join customers as c on o.CustomerID = c.CustomerID and year(o.orderdate) = 2022

16.

select e.name, e.salary, d.departmentname from Employees as e
join Departments as d on e.DepartmentID = d.DepartmentID and d.DepartmentName = 'Sales' and e.Salary > 60000

17.

select o.orderid, o.orderdate, p.paymentdate, p.amount from orders as o
left join Payments as p on o.OrderID = p.OrderID
where p.OrderID is not null

18.

select p.productid, productname from products as p
left join orders as o on p.ProductID = o.ProductID
where o.OrderID is null

19.

select e.name, e.salary from Employees as e
join (select departmentid, avg(salary) as AVG_SALARY from Employees group by DepartmentID) as avg_s on e.DepartmentID = avg_s.DepartmentID  
where e.Salary > AVG_SALARY

20.

select o.orderid, o.orderdate from orders as o
left join Payments as p on o.OrderID = p.OrderID
where p.OrderID is null and year(orderdate) < 2020

21.

select p.productid, p.productname from products as p
left join categories as c on p.Category = c.CategoryID
where c.CategoryID is null

22.

select emp1.name as Employee1, emp2.name as Employee2, emp1.ManagerID as ManagerId, emp1.Salary from Employees as emp1
join Employees as emp2 on emp1.ManagerID = emp2.ManagerID and emp1.salary > 60000 and emp2.Salary > 60000

23.

select e.name, d.departmentname from Employees as e
join Departments as d on e.DepartmentID = d.DepartmentID
where d.DepartmentName like 'M%'

24.

select s.saleid, p.productname, s.saleamount from sales as s
join products as p on p.ProductID = s.ProductID
where s.SaleAmount > 500

25.

select s.StudentID, s.Name from students as s
join Enrollments as e on s.StudentID = e.StudentID
join courses as c on e.CourseID = c.CourseID
where c.CourseName != 'Math 101'

26.

select o.OrderID, o.OrderDate, p.PaymentID from orders as o
left join payments as p on o.OrderID = p.OrderID
where p.OrderID is null

27.

select p.ProductID, p.ProductName, c.CategoryName from products as p
join categories as c on p.Category = c.CategoryID
where c.CategoryName in ('Electronics', 'Furniture')

if you aren't gonna gimme 100 scores, explain the reason, pls.












