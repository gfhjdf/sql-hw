1.

select concat(employee_id, '-', first_name, ' ', last_name) from Employees

2.

select REPLACE(PHONE_NUMBER, '123', '999') from Employees

3.

select first_name, len(first_name) as length_of_the_name from Employees
where first_name like '[AJM]%'
order by FIRST_NAME

4.

select MANAGER_ID, sum(salary) from Employees
group by MANAGER_ID

5.

select * from TestMax

select year1, case
when max1 > max2 and max1 > max3 then max1
when max2 > max1 and max2 > max3 then max2
else max3 end
from TestMax

6.

select * from cinema
where id % 2 = 0 and description != 'boring'

7.

select * from SingleOrder
order by case when id = 0 then 1 else 0 end, id;

8.

select coalesce(ssn, passportid, itin) from person

9.

select * from students cross apply string_split(fullname, ' ')

10.

select * from orders
where DeliveryState = 'TX' and CustomerID in (select customerid from orders where DeliveryState = 'CA')

11.

select string_agg(string, ' ') from DMLTable

12.

select concat(first_name, ' ', last_name) as fullname from Employees
where concat(first_name, ' ', last_name) like '%a%a%a%'

13.

select department_id, count(employee_id) as number_of_dep_emps, cast(sum(case when DATEDIFF(YEAR, hire_date, GETDATE()) > 3 then 1 else 0 end) * 100.0 / COUNT(employee_id) as int) AS percent_over_3_years from Employees
group by DEPARTMENT_ID

14.

select s1.studentid, s1.fullname, (select sum(grade) from students s2 where s1.studentid >= s2.StudentID) [sum of previous grades] from students s1

15.

select birthday, STRING_AGG(StudentName, ', ') [bd sharers] from student
group by birthday

16.

select (case when playera < playerb then playera else playerb end) as playerA, (case when playera < playerb then playerb else playera end) playerb, sum(score) from PlayerScores
group by (case when playera < playerb then playera else playerb end), (case when playera < playerb then playerb else playera end)

17.

DECLARE @INPUT VARCHAR(50) = 'tf56sd#%OqH'

DECLARE @UPPER_CASES VARCHAR(50) = '', 
		@LOWER_CASES VARCHAR(50) = '',
		@NUMBERS VARCHAR(50) = '',
		@SYMBOLS VARCHAR(50) = ''


DECLARE @CHARS_CHEKCED INT = 0

WHILE @CHARS_CHEKCED < LEN(@INPUT) --INFINITE LOOP
BEGIN
	IF ASCII(SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)) BETWEEN  97 AND 122
	BEGIN
		SET @LOWER_CASES += SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)
	END
	ELSE IF ASCII(SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)) BETWEEN  65 AND 90
	BEGIN
		SET @UPPER_CASES += SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)
	END
	ELSE IF ASCII(SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)) BETWEEN  48 AND 57
	BEGIN
		SET @NUMBERS += SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)
	END
	ELSE
	BEGIN
		SET @SYMBOLS += SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)
	END


	SET @CHARS_CHEKCED += 1 -- INCREMENT(SHOULD BE ALWAYS THE LAST LINE IN A WHILE LOOP
END


SELECT @UPPER_CASES, @LOWER_CASES, @NUMBERS, @SYMBOLS












