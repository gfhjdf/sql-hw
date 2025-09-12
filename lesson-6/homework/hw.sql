1.

select distinct col1 from inputtbl
union
select distinct col2 from inputtbl

2.

select * from testmultiplezero
where not (A = 0 and B = 0 and C = 0 and C = 0)

3.

select * from section1
where id % 2 = 1

4.
select * from section1
where id = (select min(id) from section1)

5.

select * from section1
where id = (select max(id) from section1)
6.

select * from section1
where name like 'B%'

7.

select * from ProductCodes
where code like '%a_%' escape 'a'
