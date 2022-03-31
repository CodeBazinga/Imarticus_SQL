-- Correlated Sub Query
-- 1) A sub query that has its reference in its outer query is correlated 
--  sub query
-- 2) Sub query executes for each row of parent query (base query)
-- 3) So they cant be evaluated independently
-- 4) Results of sub query are dependent upon active row being evaluated
use demo2


-- Q10) Find Student in each course who has scored more than avg(score)
-- in that course

select c.CID,avg(s.score)
from stu1 s
join course c
on s.c_id = c.cid
group by c.CID
order by c.CID

-- 215(84), 216(76),217(91),218(62),219(76.5),220(71.5),221(60),222(82)

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

-- stu1 (SID,Name,Email, age,score,C_ID)
-- course(CID,CName,start_date) 
-- stu1_bio(Stu_ID,city,degree,grad_year,cgpa)


-- Q1) Select all the columns from the course table for all the students
-- who are enrolled in the course and where degree is either BCOM or BTECH
select * from course where CID in
(select C_ID from stu1 where SID in
	(select Stu_ID from stu1_bio where degree in ('BCOM','BTECH'))
); 



-- Ex2
-- Unnecessary
select name,score,C_ID from stu1 where SID in
(select SID from stu1 where SID in
	(select Stu_ID from stu1_bio where cgpa>7.8)
); 

select name,score,C_ID from stu1 where SID in
(select Stu_ID from stu1_bio where cgpa>7.8)



-- Q3) Select all the student details for the students whose score is greater than
-- avg score obtained by those students for whom the course start date is less than
-- or equal to 2019-05-01.
select * from stu1 where score >
(select avg(score) from stu1 where C_ID in
(select CID from course where start_date<='2019-05-01'));


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
select SID, name from (select SID,name,score from stu1 where score>80) dt
select SID, name,score from (select * from stu1 where score>80) dt
select * from (select * from stu1 where score>80) dt
select * from (select SID, name from stu1 where score>80) dt
select * from (select name from stu1 where score>80) dt


select SID, name from (select SID,name from stu1 where score>80) dt
order by SID  -- 11,13,16,17,22,25,28,30,31

select SID,name from stu1 where score>80 order by SID


-- Incorrect
select SID, name from (select SID,score from stu1 where score>80) dt

-- Ex2 - Select degree wise avg cgpa where city is either Delhi or Mumbai
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
-- Q1) Find avg score based on C_ID where avg score is greater than
-- avg score obtained by students aged 22
select avg(score), C_ID from stu1
group by C_ID
having avg(score) >
(select avg(score) from stu1 where age=22) -- 79.25

-- Ex2
select avg(cgpa),degree  from stu1_bio
group by degree
having avg(cgpa) >
(select avg(cgpa) from stu1_bio where grad_year='2020')

-- Sub query in join
-- The subquery actually returns a temporary table which is handled by database
-- server in memory. The temporary table from the subquery is given an alias so 
-- that we can refer to it in the outer select statement. 

-- Q) Write a query for extracting the students data for the students who scored 
-- the maximum score. 
select * from stu1 s
join (select max(score) ms from stu1) MaxScore
on s.score = MaxScore.ms

-- Same query executed normally using sub query
select * from stu1 where score in
(select max(score) from stu1)

-- Ex2 -- Select all details from stu1_bio table where students cgpa is minimun
select * from stu1_bio s1
join (select min(cgpa) min_cg from stu1_bio) MinCGPA
on s1.cgpa = MinCGPA.min_cg

select * from stu1_bio s1
join (select min(s2.cgpa) min_cg from stu1_bio s2) MinCGPA
on s1.cgpa = MinCGPA.min_cg

select t1.a,t1.b,t2.c,t2.c
from table1 t1
join table2 t2
on t1.common = t2.common


-- Sub Query in Select 

select * from course

select * from course -- CID,Cname,start_Date
select * from stu1 -- SID,Name,email,age,score,C_ID

-- Ex1
select c.cname,
(select sum(s.score) from stu1 s where s.C_ID = c.CID) as sum_Score
from course c


-- Course name wise sum(score)
select c.cname,sum(s.score) 
from course c
left join stu1 s
on c.cid= s.c_id
group by c.cname


-- Incorrect
select c.cname,
(select sum(s.score) from stu1 s,course c where s.C_ID = c.CID) as sum_Score
from course c

-- Ex2
select s1.degree,
(select avg(score) from stu1 s2 where s2.SID = s1.Stu_ID) as AvgScore 
from stu1_bio s1