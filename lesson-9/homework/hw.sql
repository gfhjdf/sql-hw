1.

select productname, suppliers.suppliername from products
join suppliers on products.supplierid = suppliers.supplierid

2.

select name, departments.departmentname from employees
join departments on employees.departmentid = departments.departmentid

3.

select suppliers.suppliername, productname from products
join suppliers on suppliers.supplierid = products.supplierid
order by suppliers.supplierid

4.

select firstname + ' ' + lastname Name, orders.orderid from customers
join orders on customers.customerid = orders.customerid

5.

select name, courses.coursename from students
join enrollments on students.studentid = enrollments.studentid
join courses on enrollments.courseid = courses.courseid

6.

select productname, orders.orderid from products
join orders on products.productid = orders.productid

7.

select name, departments.departmentname from employees
join departments on employees.departmentid = departments.departmentid

8.

select name, enrollments.courseid from students
join enrollments on students.studentid = enrollments.studentid

9.

select *, orders.* from payments
join orders on payments.orderid = orders.orderid

11.

select name, departments.departmentname from employees
join departments on employees.departmentid != departments.departmentid

12.

select quantity from orders
join products on orders.quantity = products.stockquantity
where orders.quantity > products.stockquantity

13.

select firstname + ' ' + lastname Name, sales.ProductID from customers
join sales on customers.customerid = sales.CustomerID
where saleamount >= 500

14.

select name, courses.coursename from students
join enrollments on students.studentid = enrollments.studentid
join courses on enrollments.courseid = courses.courseid

15.

select productname, suppliers.SupplierName from products
join suppliers on products.SupplierID = suppliers.SupplierID
where suppliername like '%Tech%'

16. 

select * from orders
join payments on orders.OrderID = payments.OrderID
where orders.TotalAmount > payments.amount

17.

select name, departments.DepartmentName from Employees
join departments on Employees.DepartmentID = Departments.DepartmentID

18.

select * from products
join categories on categories.categoryid = products.Category
where categories.CategoryName in ('Electronics', 'Furniture')

19.

select sales.* from sales
join customers on sales.CustomerID = customers.CustomerID
where customers.country = 'USA'

20.

select orders.* from orders
join customers on orders.CustomerID = customers.CustomerID
where customers.country = 'Germany' and orders.TotalAmount > 100

21.

select e1.name as emp1, e2.name as emp2 from employees e1
join employees e2 on e1.DepartmentID != e2.DepartmentID
where e1.EmployeeID < e2.EmployeeID

22.

select payments.* from payments
join orders on payments.OrderID = orders.OrderID
join products on orders.ProductID = products.ProductID
where payments.amount != (orders.Quantity * products.price)

23.

select students.* from students
join enrollments on students.studentid = enrollments.studentid
join courses on enrollments.courseid = courses.courseid
where Enrollments.CourseID != all(select CourseID from courses)

24.

select e1.name from Employees as e1
join employees e2 on e1.employeeid = e2.ManagerID
where e2.Salary <= e1.Salary

25.

select * from Orders
select * from Payments
select * from Customers

select customers.* from customers
join orders on customers.CustomerID = orders.CustomerID
join payments on orders.OrderID = payments.OrderID
where payments.OrderID is null



