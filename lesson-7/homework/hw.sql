1.

select min(price) from products

2.

select max(salary) from employees

3.

select count(*) from customers

4.

select count(distinct category) from products

5.

select sum(saleamount) from sales
where productid = 7

6.

select avg(age) from employees

7.

select departmentname, count(departmentname) from employees
group by departmentname

8.

select category, min(price) MIN, max(price) MAX from products
group by category

9.

select customerid, sum(saleamount) from sales
group by customerid

10.

select departmentname, count(departmentname) from employees
group by departmentname
having count(departmentname) > 5

11.

select productid, sum(saleamount) TOTAL, avg(saleamount) AVERAGE from sales
group by productid

12.

select departmentname, count(departmentname) from employees
where departmentname = 'HR'
group by departmentname

13.

select departmentname, max(salary), min(salary) from employees
group by departmentname

14.

select departmentname, avg(salary) from employees
group by departmentname

15.

select avg(salary), count(*) from Employees
group by DepartmentName

16.

select * from products

select category, avg(price) from products
group by category
having avg(price) > 400

17.

select year(saledate), sum(saleamount) from sales
group by year(saledate)

18.

select customerid, count(orderid) from orders
group by CustomerID
having count(orderid) > 3

19.

select departmentname, avg(salary) from Employees
group by DepartmentName
having avg(salary) > 60000

20.

select category, avg(price) from Products
group by category
having avg(price) > 150

21.

select customerid, sum(totalamount) from orders
group by CustomerID
having sum(totalamount) > 1500

22.

select departmentname, sum(salary), avg(salary) from Employees
group by DepartmentName
having avg(salary) > 65000

23.

select custid, sum(case when freight > 50 then freight else 0 end) as sum_of_val, min(freight)
from TSQL2012.sales.Orders 
group by custid
order by custid

24.

select month(orderdate), year(orderdate), sum(TotalAmount), count(distinct productid) from orders
group by month(orderdate), year(orderdate)

select month(orderdate), year(orderdate), sum(TotalAmount), count(distinct productid) from orders
group by month(orderdate), year(orderdate)
having count(distinct productid) >= 2

25.

select * from orders

select year(orderdate), min(quantity), max(quantity) from orders
group by year(orderdate)






