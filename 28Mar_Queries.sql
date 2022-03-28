

-- Joins(2 table and 3 table)
-- Sub Queries
-- case statements
-- limit
-- Union and Union all

use demo2

-- Joins
-- stu1 (SID,Name,Email, age,score,C_ID)
-- course(CID,CName,start_date) 
-- stu1_bio(Stu_ID,city,degree,grad_year,cgpa)


-- Inner Joins
-- Ex1
select s.sid,s.Name, s.email, s.score, c.cname,c.cid
from stu1 as s
inner join course as c
on s.C_ID = c.CID


-- Ex2
select s.sid,s.Name, s.email, s.score, c.cname,c.CID
from stu1 s
inner join course c
on s.C_ID = c.CID

-- Ex3 - Inner Join without inner join keyword 
select s.sid,s.Name, s.email, s.score, c.cname,c.CID
from stu1 s, course c
where s.C_ID = c.CID

-- Ex4
select s.sid,s.Name, s.email, s.score, c.cname,c.CID
from stu1 s
join course c
on s.C_ID = c.CID

-- Ex5 - Inner join with where clause on c.cname
select s.sid,s.Name, s.age, s.score, c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
where c.cname in ('Data Science','ML','SQL')

select s.sid,s.Name, s.age, s.score, c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
where c.cname in ('Excel')


-- Ex6 - Inner join with where clause on age and score
select s.sid,s.Name, s.age, s.score, c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
where s.age >=24 or s.score>60


-- Ex 7 - Inner join with where clause on start date
-- select start_date from course
select s.sid,s.Name, s.score, c.cid, c.cname, c.start_date
from stu1 s
inner join course c
on s.C_ID = c.CID
where c.start_date between '2019-05-01' and '2019-10-30'


-- Ex8 - Inner join on start_date with where clause on start date
-- select start_date from course
select s.sid,s.Name, s.score, c.cid, c.cname, monthname(c.start_date) as StartMonth
from stu1 s
inner join course c
on s.C_ID = c.CID
where monthname(c.start_date) not in ('March','April','July','December') 

-- Ex 9 - Inner Join with group by 
select avg(s.score),min(s.score), c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
group by c.cname

-- Ex 10 - Inner Join with group by and having
select avg(s.score), c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
group by c.cname
having avg(s.score)>70

-- Ex11 - Inner Join with where clause, group by and having
select avg(s.score), c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
where quarter(c.start_date) in (2,4) 
group by c.cname
having avg(s.score)<80

-- Ex12 - Inner Join with where clause, group by, having and order by
select avg(s.score), c.cname
from stu1 s
inner join course c
on s.C_ID = c.CID
where quarter(c.start_date) in (2,4) 
group by c.cname
having avg(s.score)<81
order by c.cname desc

-- Left Join
-- matching records from both table + everything from the left table
select * from stu1 -- SID,Name,email,age,score,C_ID
select * from course -- CID,CNAme,Start_date
select * from stu1_bio -- Stu_ID,city,degree,grad_year,cgpa

select s.SID,s.Name,s.age,s.email,c.CID,c.cname
from stu1 s
left join course c
on s.C_ID = c.CID
order by s.SID

select s.SID,s.Name,s.age,s.email,c.CID,c.cname
from stu1 s
left outer join course c
on s.C_ID = c.CID
order by s.SID


-- Non mathcing rows from left table
select s.SID,s.Name,s.age,s.email,s.C_ID
from stu1 s
left join course c
on s.C_ID= c.CID
where s.C_ID is null


-- Right Join
-- matching records from both the tables + everything from the right table 
select * from stu1 -- SID,Name,email,age,score,C_ID
select * from course -- CID,CNAme,Start_date
select * from stu1_bio -- Stu_ID,city,degree,grad_year,cgpa

-- Right Join
select s.SID,s.Name,s.age,s.email,c.CID,c.cname
from stu1 s
right join course c
on s.C_ID = c.CID
order by c.CID

-- Right Outer Join
select s.SID,s.Name,s.age,s.email,c.CID,c.cname
from stu1 s
right outer join course c
on s.C_ID = c.CID
order by c.CID


-- Non mathcing rows from right table
select c.CID,c.Start_date,s.name
from stu1 s
right join course c
on s.C_ID= c.CID
where s.C_ID is null

-- Full Join / Full Outer Join

select s.Name,s.age,s.email,c.CID,c.cname
from stu1 s
left join course c
on s.C_ID = c.CID
union
select s.Name,s.age,s.email,c.CID,c.cname
from stu1 s
right join course c
on s.C_ID = c.CID


-- cross join
-- Returns cartesian product of two tables
select count(*) from course -- 12
select count(*) from Stu1  -- 22 

-- Ex1
select s.sid,s.name,s.c_id, c.cid,c.cname
from stu1 s
cross join course c


-- Ex2 Cross Join as Inner JOin
select s.sid,s.name, c.cid,c.cname
from stu1 s
cross join course c
where s.C_ID = c.CID
order by s.SID



-- Self Join
-- 1) Joining a table it itself
-- 2) Used specially when foreign key references to its own primary key
-- 3) Self Join can be understtod as join fo two copies of same table
-- 4) Each row of the table is combined with itself and with every other row of the table. 

drop table employee

create table employee(
emp_id varchar(5) not null,
emp_name varchar(20),
dt_of_join date,
emp_supv varchar(5),
primary key(emp_id) ,
foreign key(emp_supv) references employee(emp_id));


insert into employee values
(27863,'Ankit Sinha', '2018-06-13',null),
(27865,'Mridul Paliwal', '2019-08-14',27863),
(27867,'shweta Sharma', '2020-12-25',27865),
(27869,'Vinay Verma', '2019-03-20',27867),
(27871,'Pratyush Singh', '2019-05-20',27865),
(27873,'Ranveer Pratap', '2020-01-22',27863)



-- Ex1 - Find all the employees and their supervisors from employee table
select a.emp_id as Emp_ID,a.emp_name as Emp_Name,
b.emp_id as SupID,b.emp_name as Sup_Name
from employee a, employee b
where a.emp_supv = b.emp_id;


-- 3 Table Joins

-- Q1) Select SID, student name, student city, student degree, course name,
-- course_start_date where course name is 'Data Science'

select s.SID, s.name, b.city,b.degree, c.cname, c.start_date
from stu1 s
inner join stu1_bio b
on s.SID = b.Stu_ID
inner join course c
on s.C_ID = c.CID
where c.cname = 'Data Science'
order by s.SID

-- Ans1) Using where
select s.SID, s.name, b.city,b.degree, c.cname, c.start_date
from stu1 s,stu1_bio b, course c
where s.SID = b.Stu_ID and s.C_ID = c.CID
and c.cname = 'Data Science'
order by s.SID

-- Q2) Select SID, student name, course name, for students who are enrolled 
-- in a course. Every student must have graduated in the year 2019 or afterwards

select s.SID, s.name, b.city,b.grad_year, c.cname, c.start_date
from stu1 s
inner join stu1_bio b
on s.SID = b.Stu_ID
inner join course c
on s.C_ID = c.CID
where b.grad_year >= '2019'

-- Q3) Find the course wise avg score of students who belong to either 
-- Delhi, Mumbai or Bangalore city.

select Stu_ID from stu1_bio
where city in ('Delhi', 'Mumbai','Bangalore') 
-- 11,13,14,16,17,18,20,22,23,25

select c.cname, avg(s.score) as Avg_Score
from course c
inner join stu1 s
on c.cid = s.c_id
inner join stu1_bio b
on s.sid = b.stu_id
where b.city in ('Delhi', 'Mumbai','Bangalore') 
group by c.cname
order by Avg_Score

-- 4) Find CGPA,score, name and course name,grad_year and year_gap of students
-- whose degree is not in ('BA','MA')
-- whose grad year has not more than 3 yrs gap compared to current year

select year('2019')

select b.cgpa,b.degree,s.score,s.name,c.cname,
year(now()) - b.grad_year as gap
from stu1 s
inner join stu1_bio b
on s.SID = b.Stu_ID
inner join course c
on s.C_ID = c.CID
where b.degree not in ('BA','MA')
and year(now()) - b.grad_year <=3

-- Q5) Find all students who have enrolled for ML, Data Science or Deep Learning
-- who have completed their graduation but are not post_graduates

select distinct degree from stu1_bio

select s.SID, s.name, b.city,b.degree,b.grad_year, c.cname
from stu1 s
inner join stu1_bio b
on s.SID = b.Stu_ID
inner join course c
on s.C_ID = c.CID
where c.cname in ('Data Science','ML','Deep Leanring')
and b.degree not in ('MA','MCA')



-- Sub Queries
-- 1) A query nested within another sub query is called a sub query
-- 2) They separate complex business logic from main query.
-- 3) Thay can be written in select, from, where and join. 
--    Recommended use - where, from

-- Q6) Write a query for extracting the students data for the students who scored 
-- the maximum marks.

-- method-1
select max(score) from stu1 -- 93
select * from stu1 where score=93

-- Method-2 (Sub Query)
select * from stu1 where score in

-- Method-3 (Using Joins)
select * from stu1 s
join (select max(score) ms from stu1) MaxScore
on s.score = MaxScore.ms

-- Q7) Find the student ID, their degree, their cgpa for the students whose
-- cpga is higher than the avg cgpa obtained by all the students

select avg(cgpa) from stu1_bio -- 7.28125

select Stu_ID,degree,cgpa from stu1_bio where cgpa > 
(select avg(cgpa) from stu1_bio)
 
-- Q8) Find the student ID, their degree, their cgpa for the students whose
-- cpga is higher than the avg cgpa obtained by all the students 
-- and where degree is is BTECH
select Stu_ID,degree,cgpa from stu1_bio where cgpa > 
(select avg(cgpa) from stu1_bio)
and degree='BTECH'


-- Q9) Find the student ID, their degree, their cgpa for the students who has
-- cpga is higher than the avg cgpa obtained by all the students who have BTECH 
-- degree

select Stu_ID,degree,cgpa from stu1_bio where cgpa > 
(select avg(cgpa) from stu1_bio where degree='BTECH')


-- Types of Sub Queries
-- 1) Single row subquery
-- When the inner query(sub query) returns a single row and a single column 
-- as response to the outer query 

-- Ex1
select Stu_ID,degree,cgpa from stu1_bio where cgpa > 
(select avg(cgpa) from stu1_bio)

-- Ex2
select SID,Age,C_ID,score from stu1 where score < 
(select avg(score) from stu1)

-- 2) Multiple Row SubQuery
-- a) Sub Query that returns multiple rows(more than 1 row) to its parent query
-- b) They are mostly used with IN,ANY,ALL,EXISTS clauses

-- Ex1
select * from stu1_bio where cgpa in
(select cgpa from stu1_bio where degree='BCOM')

-- Ex2
select * from stu1 where age in
(select age from stu1 where Name like '%a')

-- Ex3
select * from course where CID in
(select CID from course where start_date>'2019-07-01')



-- Any() 
-- a) Allows to perform comparison between single column valuas and a range of values
-- b) Returns True if any of the subquery value meets the condition

-- All()
-- a) Allows to perform comparison between single column valuas and a range of values
-- b) Returns True if all of the subquery value meets the condition
-- c) "ALL" query will end up comparing one column value with ALL (...) 
--    which will always be false unless "ALL" arguments are identical. 

select SID,Name,Age,Score,C_ID from stu1 where Score = any
(select score from stu1 where age=22) -- 93,70,64,90

select SID,Name,Age,Score,C_ID from stu1 where Score = any
(select score from stu1 where age=23) -- 87

select SID,Name,Age,Score,C_ID from stu1 where Score = all
(select score from stu1 where age=23) -- 87

select SID,Name,Age,Score,C_ID from stu1 where Score = all
(select score from stu1 where age>=22)

-- Correlated Sub Query
-- 1) A sub query that has its reference in its outer query is correlated sub query
-- 2) Sub query executes for each row of parent query
-- 3) So they cant be evaluated independently
-- 4) Results of sub query are dependent upon active row being evaluated


-- Q10) Find Student in each course who has scored more than avg(score)
-- in that course

select * from stu1 s1 where score >
(select avg(score) from stu1 s2 
where s2.C_ID = s1.C_ID 
group by s2.C_ID)
order by s1.C_ID

-- Ex2
select * from stu1_bio s1 where cgpa >
(select avg(cgpa) from stu1_bio s2 
where s2.degree = s1.degree 
group by s2.degree)
order by s1.degree


-- Nested Sub Query
-- A subquery inside a sub query is called nested subquery

-- Ex1
select * from course where CID in
(select C_ID from stu1 where SID in
	(select Stu_ID from stu1_bio where degree in ('BCOM','BTECH'))
); 

-- Ex2
select name,score,C_ID from stu1 where SID in
(select SID from stu1 where SID in
	(select Stu_ID from stu1_bio where cgpa>7.8)
); 


-- Ex3
select * from stu1 where score >
(select avg(score) from stu1 where C_ID in
(select CID from course where start_date<='2019-05-01'))


-- Where can we use sub query
-- 1) where
-- 2) from
-- 3) having
-- 4) join
-- 5) select



-- Sub Queries in where
-- Ex1
select * from course where CID in
(select CID from course where start_date>'2019-07-01')


-- Sub Query in From clause
-- Subqueries in the FROM clause create a derived or intermediate table that 
-- can be used directly to fetch results for the main SELECT query 
-- or joined with other tables and then used subsequently

-- Ex1
select SID, name from (select SID,name from stu1 where score>80) dt

-- Ex2
select degree, avg(cgpa) from 
(select degree, cgpa from stu1_bio where city in ('Delhi','Mumbai')) dt
group by degree

-- Ex2 (Same query executed normally)
select degree, avg(cgpa) from stu1_bio
where city in ('Delhi','Mumbai')
group by degree

-- Ex3
select avg(score),C_ID from 
(select score,C_ID from stu1 s) dt
group by C_ID 



-- Sub query in having
-- Ex1
select avg(score), C_ID from stu1
group by C_ID
having avg(score) >
(select avg(score) from stu1 where age=22)

-- Ex2
select avg(cgpa),degree  from stu1_bio
group by degree
having avg(cgpa) >
(select avg(cgpa) from stu1_bio where grad_year='2020')

-- Sub query in join
-- The subquery actually returns a temporary table which is handled by database
-- server in memory. The temporary table from the subquery is given an alias so 
-- that we can refer to it in the outer select statement. 

-- Ex1
select * from stu1 s
join (select max(score) ms from stu1) MaxScore
on s.score = MaxScore.ms

-- Ex2
select * from stu1_bio s1
join (select min(cgpa) min_cg from stu1_bio) MinCGPA
on s1.cgpa = MinCGPA.min_cg


-- Sub Query in Select 

select * from course

-- Ex1
select c.cname,
(select sum(s.score) from stu1 s where s.C_ID = c.CID) as sum_Score
from course c

-- Ex2
select s1.degree,
(select avg(score) from stu1 s2 where s2.SID = s1.Stu_ID) as AvgScore 
from stu1_bio s1










-- Limit
select score from stu1 order by score 
select score from stu1 order by score limit 1 -- lowest value
select score from stu1 order by score limit 5 -- lowest 5 values
select cgpa from stu1_bio order by cgpa desc limit 5 -- highest 5 cgpa
-- Find 5th highest score
select score from stu1 order by score desc limit 1,1  -- 2nd highest
select score from stu1 order by score desc limit 2,1  -- 3rd highest
select score from stu1 order by score desc limit 3,1  -- 4th highest
select score from stu1 order by score desc limit 4,2  -- 5th and 6th highest
 


-- Case statement in Select)

-- Ex1
select s.sid,s.name,s.age,s.score,
case 
when s.score>=70 and s.score<=80 then 'Avg'
when s.score>80 and s.score<=90 then 'Good'
else 'Outstanding' 
end as Remarks  
from stu1 s

-- Ex2
select cgpa from stu1_bio
select s.stu_id,s.degree,s.cgpa,
case 
when s.cgpa>=6.0 and s.cgpa<=7.0 then 'First Division'
when s.cgpa>=7.0 and s.cgpa<=8.5 then 'First Division Pro'
else 'Invalid' 
end as Remarks  
from stu1_bio s



