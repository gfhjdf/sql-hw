1.

select p.firstName, p.lastName, a.city, a.state from person as p
left join address as a on p.personId = a.personId

2.

select emp.name from employee as man
join employee as emp on emp.managerId = man.id
where emp.salary > man.salary

3.
Create table Person (id int, email varchar(255)) insert into Person (id, email) values ('1', 'a@b.com') insert into Person (id, email) values ('2', 'c@d.com') insert into Person (id, email) values ('3', 'a@b.com')
truncate table person

select email from person
group by email
having count(email) > 1

4.

delete from person
where id in(select t1.id from person as t1 join person as t2 on t1.email = t2.email and t1.id > t2.id)

5.

select parentname from girls
except
select parentname from boys

6.

select custid, sum(case when freight > 50 then freight else 0 end), min(freight)
from TSQL2012.sales.orders
group by custid
order by custid

7.


select * from cart1
select * from cart2

select * from cart1 as c1
full join cart2 as c2 on c1.Item = c2.item


8.

select c.name from customers as c
left join orders as o on c.id = o.customerid
where o.customerid is null

9.

select student_name into new_students from students

select * into all_combinations from new_students, Subjects 
select * from all_combinations

;with cte as (
select st.student_id, st.student_name, su.subject_name, count(su.subject_name) count from students as st
left join Examinations as ex on st.student_id = ex.student_id
full join subjects as su on ex.subject_name = su.subject_name
group by st.student_id, st.student_name, su.subject_name
)
select ac.*, isnull(cte.count, 0) attended_exams from all_combinations as ac
left join cte on ac.subject_name = cte.subject_name and ac.student_name = cte.student_name
order by ac.student_name



