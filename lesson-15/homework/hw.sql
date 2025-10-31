1.

select * from employees
where salary = (select min(salary) from employees)

2.

select * from products
where price > (select avg(price) from products)

3.

select * from employees
where department_id = (select id from departments where department_name = 'Sales')

4.

select * from customers
where customer_id not in (select customer_id from orders)

5.

select p.* from products p
join (select category_id, max(price) as price from products group by category_id) p2 on p.category_id = p2.category_id and p.price = p2.price

6.

select emp1.* from employees as emp1
join (select department_id, avg(salary) avG_salary from employees group by department_id) emp2 on emp1.department_id = emp2.department_id 
where emp1.department_id = (select top 1 department_id from (select department_id, avg(salary) avG_salary from employees group by department_id) as emp3 order by avG_salary desc) 

7.

select emp1.* from employees as emp1
join (select department_id, avg(Salary) avg_salary from employees group by department_id) as emp2 on emp1.department_id = emp2.department_id
where emp1.department_id = emp2.department_id and salary > emp2.avg_salary

8.

select s.* from students s join grades g on s.student_id = g.student_id
join (select course_id, max(grade) max_grade from grades group by course_id) r on g.course_id = r.course_id
where g.grade = r.max_grade and g.course_id = r.course_id

9.

drop table products
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);

select * from products

select category_id, price from products
order by price desc offset 2 rows fetch next 1 rows only
---------------------------------------------------------------------------------------------------------------------

10.

select emp.* from employees as emp
join (select department_id, avg(Salary) dep_avg_sal from employees group by department_id) dep_sal on emp.department_id = dep_sal.department_id
cross join (select avg(salary) com_sal from employees) comp 
where salary between dep_avg_sal and com_sal

















