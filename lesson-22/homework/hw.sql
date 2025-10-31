CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')






1.

select sum(total_amount) over (order by total_amount rows between unbounded preceding and current row) from sales_data

2.

select distinct product_category, count(sale_id) over (partition by product_Category order by product_category) from sales_data

3.

select distinct product_category, max(total_amount) over (partition by product_Category order by product_category) from sales_data

4.

select distinct product_category, min(total_amount) over (partition by product_Category order by product_category) from sales_data

5.

select avg(total_amount) over(order by order_date rows between 1 preceding and 1 following) from sales_data

6.

select distinct region, sum(total_amount) over(partition by region order by region) from sales_data

7.

;with cte as(
select customer_id, sum(total_amount) total_amount from sales_data group by customer_id
)
select *, rank() over (order by total_amount) rn from cte

8.

select lead(total_amount) over(partition by customer_id order by total_amount) - total_amount from sales_data

9.

;with cte as(
select product_Category, total_amount, row_number() over(partition by product_category order by total_amount desc) rn from sales_data
)
select * from cte where rn <= 3

10.

select region, order_date, sum(total_amount) over (partition by region order by order_date) total_amount from sales_data

11.

select product_category, sum(total_amount) over(partition by product_category order by product_Category rows between unbounded preceding and current row) from sales_data

12.

select id, sum(id) over (order by id rows between unbounded preceding and current row) SumPreValues  from ex_table

13.

select value, sum(value) over(order by value rows between unbounded preceding and current row) from OneColumn

15.

select * from sales_data

;with cte as(
select region, avg(total_amount) avg from sales_Data group by region 
)
select * from sales_data sd join cte on sd.region = cte.region where sd.total_amount > cte.avg

16.

select customer_id, DENSE_RANK() over(partition by region, customer_id order by total_amount) from sales_data

17.

select customer_id, sum(total_amount) over(partition by customer_id order by order_date rows between unbounded preceding and current row) from sales_data

18.

select distinct month(order_date), sum(total_amount) over(partition by month(order_date) order by month(order_date)) [total amount for the month] from sales_data

19.

select distinct product_name from sales_data where unit_price > (select avg(unit_price) from sales_data)

21.

select *, case 
when row_number() over(partition by Grp order by Id) = 1 then sum(Val1 + Val2) over(partition by Grp) else null end total from MyData
order by Grp, Id

22.

;with cte as(
select id, sum(cost) cost, avg(Quantity) avg_quant from TheSumPuzzle group by id
)
select distinct p.id, cte.cost, case
when Quantity = avg_quant then Quantity else sum(quantity) over (partition by p.id) end quantity
from TheSumPuzzle p
join cte on cte.ID = p.ID

23.
CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 
DECLARE @max_seat INT = (SELECT MAX(SEATNUMBER) FROM Seats)

;WITH CTE AS 
(
SELECT 1 AS NUMBER
UNION ALL
SELECT NUMBER + 1 FROM CTE WHERE NUMBER + 1 <= @max_seat
)
,CTE1 AS(
SELECT *, MAX(S.SEATNUMBER) OVER (ORDER BY NUMBER) AS GROUPSS FROM CTE LEFT JOIN Seats AS S ON CTE.NUMBER = S.SeatNumber
)
SELECT MIN(NUMBER) GAP_START, MAX(NUMBER) GAP_END FROM CTE1 
WHERE SeatNumber IS NULL
GROUP BY ISNULL(GROUPSS,0)












