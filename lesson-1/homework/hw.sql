1.	Data – an unorganized collection of different facts/statistics. Database – an organized collection of data. Relational Database – a database which creates a table by organizing data into rows and columns. Table – a collection of related data organized in table format, consisting of rows and columns. 
2.	Data Manipulation, Adaptive query processing, high availability, improved data protection, dynamic.
3.	Windows Authentication, SQL Server Authentication, Microsoft Entra MFA, Microsoft Entra Password, Microsoft Entra Integrated, Microsoft Entra Service Principal, Microsoft Entra Managed Identity, Microsoft Entra Default. 
4.	CREATE DATABASE SchoolDB
5.	

CREATE TABLE Students (
     StudentID INT PRIMARY KEY,
	 Name VARCHAR(50),
	 Age INT
);

6.	SQL – a programming language; SQL Server – the database system that can understand and execute SQL programming language; SSMS – the GUI tool which can manage and interact with SQL Server. 
7.	DQL – Data Query Language, which helps the user display selected data from a table, and has the main and the only command – “SELECT”. For example:
the code SELECT * FROM [dbo].[Students] shows the whole table from dboStudents table in SSMS.


DML – Data Manipulation Language, which helps the user manipulate data stored in database tables. With DML commands, the user can insert a new data into the table(with the command INSERT), update the existing data(with the command UPDATE), and delete chosen value from the table(with the command DELETE). For example:
the code “INSERT INTO [dbo].[Students] (StudentID, Name, Age) VALUES (1, 'Jahongir', 17)” adds a new row to the existing table. 
DDL – Data Definition Language, a category which enables the user to manipulate the structure of tables, schemas and indexes. For example: 
CREATE TABLE Students (
     StudentID INT PRIMARY KEY,
	 Name VARCHAR(50),
	 Age INT
);

the code creates a table named “Students” with three columns: StudentID, Name and Age.

DCL – Data Control Language, a category including commands such as GRANT and REVOKE, which enables the user to control their database system, mainly rights, permissions, and other controls of the database system. 

TCL - Transaction Control Language, a subset of SQL used to manage transactions in database. These commands help the developer to back up different tables and restore them, if unconsciously deleted. 

8.
INSERT INTO [dbo].[Students] (StudentID, Name, Age) VALUES (1, 'Jahongir', 17)

9. First of all, we should download the needed database(in our case it is - AdventureWorksDW2022). Then, in Object Explorer in SSMS, with right-clicking the folder called "Databases", we should choose "Restore Database". After clicking "Restore Database", there will be opened a window with properties of installation: source, destination, backup sets before and etc. Right in front of "Source", there should be choosen the database we would like to restore. Finally, just by clicking the button "OK", there will be started the process of restoring the chosen database.
