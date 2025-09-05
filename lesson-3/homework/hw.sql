1. bulk insert helps the developer with importing data from different files just with a command on query.
2. .csv, .txt, .xlsx, .xls
3.
create table Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2))
4.
insert into Products values (1, 'a', 3), (2, 'b', 3), (3, 'c', 3)
5. NULL - shows the absence of data type in a row, while NOT NULL is a constraint which does not allow to fill the table with NULL and forces the developer to add data to that column.
6.
alter table Products
add constraint uq_pdname unique (ProductName)
7.
-- comments are left by developers for themselves or others, and comments function as notes for everyone who is reading the code as additional info/note.
8.
alter table Products
add CategoryID int
9.
create table Categories (CategoryID int primary key, CategoryName varchar(50) unique)
10.
identity automatically increases the values of rows based on the given starting value and step by the developer. this somehow keeps values safe, protecting them from users trying to insert any data to the table. generally, a user cannot add data to the column with identity.
11.
bulk insert Products
from 'D:\test.txt'
with (
fieldterminator = ',',
rowterminator = '\n',
firstrow = 2)

12.
create table Products (ProductID INT primary key, ProductName VARCHAR(50), Price DECIMAL(10,2), CategoryID int, foreign key(CategoryID) references Categories(CategoryID))
13. primary key can be used only once in a table, while unique key can be used several times in a table. also, unique key can accept null values, while primary key cannot. 
14. 
alter table Products
add check (Price > 0)
15.
alter table Products
add Stock INT not NULL
16. 
select isnull(Price, 0), * from Products
17. the foreign key is used to refer to primary key in another table and created to prevent actions that could destroy links between parent and child tables.
18.
create table Customers (Age INT, CHECK (Age >= 18))
19.
create table testing (testID int identity(100, 10))
20.
create table OrderDetails (orderid int, name varchar(50), primary key (orderid, name))
21. COALESCE -> shows the first not null value in a chosen column, while isnull checks whether the chosen column contains null value or not and can help change found null values into the another given value.
22.
create table Employees (EmpID int primary key, Email varchar(50) unique)
23.
create table n1 (EmpID int, foreign key(EmpID) references Employees(EmpID) on delete cascade)
create table n2 (EmpID int, foreign key(EmpID) references Employees(EmpID) on update cascade)
