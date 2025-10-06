1.

select 
  TRIM(SUBSTRING(Name, 1, CHARINDEX(',', Name) - 1)) as Name,
  TRIM(SUBSTRING(Name, CHARINDEX(',', Name) + 1, LEN(Name))) as Surname from TestMultipleColumns

2.

select * from testpercent
where strs like '%a%%' escape 'a'

3.

select * from splitter cross apply string_split(vals, '.')

4.

select * from testdots
where len(vals) - len(replace(vals, '.', '')) > 2

5.

select len(texts) - len(replace(texts, ' ', '')) from countspaces

6.

select * from employee as emp
join employee as man on emp.id = man.managerid
where emp.salary < man.salary

7.

select employee_id, first_name, last_name, hire_date, datediff(year, hire_date, getdate()) as 'Years of Service' from employees
where datediff(year, hire_date, getdate()) between 10 and 15

8.

select w2.id from weather w1
join weather as w2 on w1.recorddate = dateadd(day, -1, w2.recorddate)
where w1.temperature < w2.temperature

9.

select player_id, min(event_date) as [first login date] from activity
group by player_id

10.

select * from fruits cross apply string_split(fruit_list, ',', 1)
where ordinal = 3

11.

select *, case
when datediff(year, hire_date, getdate()) < 1 then 'New Hire'
when datediff(year, hire_date, getdate()) between 1 and 5 then 'Junior'
when datediff(year, hire_date, getdate()) between 5 and 10 then 'Mid-Level'
when datediff(year, hire_date, getdate()) between 10 and 20 then 'Senior'
when datediff(year, hire_date, getdate()) > 20 then 'Veteran' end
from employees

12.

select substring(vals, PATINDEX('%[0-9]%', vals), 1) from getintegers

13.

-- select id, REPLACE(vals, SUBSTRING(vals, 1, 1), SUBSTRING(vals, 3, 1)) from MultipleVals

select id, substring(vals, 3, 1) + ',' + left(vals, 1) + right(vals, len(vals) - 3) as vals from MultipleVals

14.

create table result (val varchar(1))

declare @input1 varchar(100) = 'sdgfhsdgfhs@121313131'
declare @counter int = 0

while @counter < len(@input1)
begin
	insert into result select SUBSTRING(@input1, @counter + 1, 1)
	set @counter += 1
end

select * from result

15.

select device_id, min(event_Date) as [first logged in] from Activity
group by device_id

16.

DECLARE @INPUT VARCHAR(50) = 'rtcfvty34redt'

DECLARE @char VARCHAR(50) = '',
		@NUMBERS VARCHAR(50) = ''


DECLARE @CHARS_CHEKCED INT = 0

WHILE @CHARS_CHEKCED < LEN(@INPUT) --INFINITE LOOP
BEGIN
	IF ASCII(SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)) BETWEEN  48 AND 57
	BEGIN
		SET @NUMBERS += SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)
	END
	ELSE IF ASCII(SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)) BETWEEN  65 AND 90 or ASCII(SUBSTRING(@INPUT, @CHARS_CHEKCED + 1, 1)) BETWEEN 97 AND 122
	BEGIN
		SET @char += SUBSTRING(@INPUT, @CHARS_CHEKCED+1, 1)
	END

	SET @CHARS_CHEKCED += 1 -- INCREMENT(SHOULD BE ALWAYS THE LAST LINE IN A WHILE LOOP
END

create table output (characters varchar(max), numbers varchar(max))
insert into output values (@char, @NUMBERS)

select * from output



