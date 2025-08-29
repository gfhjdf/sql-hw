1. 

CREATE TABLE Employees (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))

2.

INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'Alex', 50)
INSERT INTO Employees (EmpID, Name, Salary) VALUES (2, 'John', 50), (3, 'Mike', 75)

3.

UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1
SELECT * FROM Employees

4.

DELETE FROM  Employees
WHERE EmpID = 2
SELECT * FROM Employees

5. 
DELETE - is used to delete specific data from a table.
TRUNCATE - removes all data from a table, keeping the structure of the table.
DROP - is often used to delete databases, tables.

6. 
ALTER TABLE EMPLOYEES
ALTER COLUMN Name VARCHAR(100)

7.

ALTER TABLE Employees
ADD Department VARCHAR(50)

8.

ALTER TABLE Employees
ALTER COLUMN Salary FLOAT

9.

CREATE TABLE Departments (DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50))

10.

TRUNCATE TABLE Employees

11.

INSERT INTO Departments
SELECT 1, 'A'
UNION all
SELECT 2, 'A'
UNION all
SELECT 3, 'A'
UNION all
SELECT 4, 'A'
UNION all
SELECT 5, 'A'

12.

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000

13.

TRUNCATE TABLE Employees 

14. 

ALTER TABLE Employees
DROP COLUMN Department

15.

EXEC sp_rename 'Employees', 'StaffMembers'

16. 

DROP TABLE Departments

17.

CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR, Category VARCHAR, Price DECIMAL, Company VARCHAR)

18.

CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(MAX), Category VARCHAR(MAX), Price DECIMAL, Company VARCHAR(MAX))

20.

EXEC sp_rename 'Products.Category', 'ProductCategory'

21. 

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Company) VALUES (1, 'kater', 'idk', 2, 'idk'), (2, 'abc', 'sad', 3, 'asd'), (3, 'abc', 'sad', 3, 'asd'), (4, 'abc', 'sad', 3, 'asd'), (5, 'abc', 'sad', 3, 'asd')

22.

SELECT * INTO Products_Backup FROM Products

23. 

EXEC sp_rename 'Products', 'Inventory'

24. 

ALTER TABLE Inventory
ALTER COLUMN Price FLOAT


