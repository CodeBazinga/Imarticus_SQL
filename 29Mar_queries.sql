

use demo2

select * from stu1
-- SID, Name, emial, age, score, C_ID
select * from course
-- CID,Cname, start_date
select * from stu1_bio
-- Sud_ID, city, degree, grad_year, cgpa


-- Limit
select score from stu1 order by score 
select score from stu1 order by score limit 1 -- lowest value
select score from stu1 order by score limit 5 -- lowest 5 values
select score from stu1 order by score desc limit 4 -- top 4 highest score in desc order
select cgpa from stu1_bio order by cgpa desc limit 6 -- top 6 cgpa
select cgpa from stu1_bio limit 3   -- top 3 rows from cgpa without any order

-- Find nth highest value
-- Syntax -
-- select col_name from table_name order by col_name desc/asc limit offset(n-1), no_of_rec

select score from stu1 order by score desc
-- 93,91,90,89,89,87,82,82,82,78

-- descending order

-- Fetch 3rd highest score from stu1
select score from stu1 order by score desc limit 2,1
-- Fetch 4rd highest score from stu1
select score from stu1 order by score desc limit 3,1
-- Fetch 4th and 5th highest scores from stu1
select score from stu1 order by score desc limit 3,2
-- Top 2 highest scores from stu1
select score from stu1 order by score desc limit 2
select score from stu1 order by score desc limit 0,2

select score from stu1 order by score desc limit 3,2 -- 4th and 5th highest

select score from stu1 order by score desc limit 1,1  -- 2nd highest
select score from stu1 order by score desc limit 2,1  -- 3rd highest
select score from stu1 order by score desc limit 3,1  -- 4th highest
select score from stu1 order by score desc limit 4,2  -- 5th and 6th highest

-- ascending order
select score from stu1 order by score
-- 58,62,62,64,64,65,70,73,75,77
select score from stu1 order by score limit 2,1  -- 3rd lowest score
select score from stu1 order by score limit 5,1  -- 6th lowest score
select score from stu1 order by score limit 2,3  -- 3rd, 4th and 5th lowest scores
 


-- rank and dense_rank()
-- 1) dense_rank()
-- a) The DENSE_RANK() is a window function that assigns a rank to each row 
-- within a partition or result set with no gaps in ranking values.
-- b) Basically, the ranks are assigned in a consecutive manner i.e if there is a 
-- tie between values then they will be assigned the same rank, and next rank 
-- value will be one greater then the previous rank assigned.

-- 2) rank()
-- a) This function will assign rank to each row within a partition with gaps. 
-- b) Here, ranks are assigned in a non-consecutive manner i.e if there is a tie 
-- between values then they will be assigned same rank, and next rank value will 
-- be previous rank + no of duplicates.

create table h(
v int)

drop table h

insert into h values (11),(12),(12),(13),(14),(14),(14),(15),(10);
select * from H

-- ascending order
select v,dense_rank() over (order by v) as DRank
from h
select v,dense_rank() over (order by v desc) as DRank
from h


select v, rank() over (ORDER BY v) VRank_asc from h;
select v, rank() over (order by v desc) VRank_desc from h

select * from stu1_bio
-- stu_Id, city,degree,grad_year,cgpa

select degree, avg(cgpa) from stu1_bio
group by degree

select degree, cgpa, dense_rank() 
over (partition by degree order by cgpa) as DRank from stu1_bio

select degree, cgpa, dense_rank() 
over (partition by degree order by cgpa desc) as DRank from stu1_bio


select degree, cgpa, dense_rank() 
over (partition by degree order by cgpa desc) as DRank from stu1_bio
where degree='BA'


select degree, cgpa, rank() 
over (partition by degree order by cgpa) as Rank_CGPA_asc from stu1_bio

select degree, cgpa, dense_rank() 
over (partition by degree order by cgpa desc) as Rank_CGPA_desc from stu1_bio


-- Case statement in Select
-- It is used when there are multiple conditions based on which we have to execute
-- select statement


-- Q1) For the stu1 table, display SID,Name,Age,Score and 
--     a column Remarks as per the following rules:-
-- a) if score is between 0 and 70, then Remarks = 'Practice_Req'
-- b) if score is between 70 and 80, then Remarks = 'Avg'
-- c) if score is between 81 and 90, then Remarks = 'Good'
-- d) Otherwise Remarks = 'Outstanding'

-- Ex1
select s.sid,s.name,s.age,s.score,
case 
when s.score>=0 and s.score<=70 then 'Practice_req'
when s.score>70 and s.score<=80 then 'Avg'
when s.score>80 and s.score<=90 then 'Good'
else 'Outstanding' 
end as Remarks  
from stu1 s

-- Ex2
select cgpa from stu1_bio

select s.stu_id,s.degree,s.cgpa,
case 
when s.cgpa>=6.0 and s.cgpa<=7.0 then 'First Division'
when s.cgpa>7.0 and s.cgpa<=8.5 then 'First Division Pro'
else 'Invalid' 
end as Remarks  
from stu1_bio s

select s.stu_id,s.degree,s.cgpa,
case 
when s.cgpa>=6 and s.cgpa<=7.0 then 'First Division'
when s.cgpa>7.0 and s.cgpa<=8.5 then 'First Division Pro'
else 'Invalid' 
end as Remarks  
from stu1_bio s




-- views
-- indexes
-- correlated subquery
-- nested subquery
-- sub query uses in different clauses
-- union and union all



-- Views
-- 1) A view is a stored query. 
-- 2) Views are the database objects that can also be called as virtual tables.
-- 3) Views do not store any data.
-- 4) They are logical representation of actual data
-- 5) It is doable to write a complex query once or twice. However, if we need 
-- to use it many times, a more practical approach is necessary. This is where SQl
-- views come into picture


-- Advantages of Views
-- 1) Views are stored queries that can be reused
-- 2) That are accessible by multiple users  in different sessions
-- 3) They are used to hide confidential informtaion like Contact, Address, Bank details etc
-- 4) Avoids direct access to physical data

-- Disadantages of Views
-- 1) When the base table is dropped, views refers to non-existant table
-- 2) Queries are bit slow in execution compared to direct access from physical tables



select * from Customers
-- ID, FName, LName, Age, City, Salary
select * from Orders
-- Order_ID,C_ID, Order_date, Transcation_Amount 

select c.City,sum(o.transaction_amount) as TotalTranAmt
from customers c
inner join orders o
on c.ID = o.C_ID
group by c.city


-- Ex1 -  Creating a view on above tables using Joins
drop view Total_TransactAmount

create view Total_TransactAmount
as
select c.City,sum(o.transaction_amount) as TotalTranAmt
from customers c
inner join orders o
on c.ID = o.C_ID
group by c.city

-- displaying the result from views
select * from Total_TransactAmount

-- Filter a view
select * from Total_TransactAmount where TotalTranAmt>5000

-- Ex3
drop view Cust_Details1

create view Cust_Details1 as
select FName, LName, Salary from Customers

select * from Cust_Details1

-- Replacing an exitsing view 
create or replace view Cust_Details1 as
select ID, FName, LName, Salary from Customers

select * from Cust_Details1

-- Drop a view
drop view Cust_Details1 

-- 3) Ex3

Create or replace view Cust_Details2 as
Select ID, Fname, age, city from  Customers
where age is not null

select * from Cust_Details2



drop view Cust_Details2
select * from Cust_Details2
select * from customers


-- 4) Ex4 - view created with multiple table
drop view Cust_Details2

create view Cust_Details3 as
select t1.ID,t1.FName,t1.Age,t1.Salary, t2.Order_Id, t2.Transaction_Amount, t2.Order_Date
from Customers as t1
inner join Orders as t2
on t1.ID = t2.C_ID

select * from Cust_Details3



 -- Types of Views
 -- 1) Horizontal View 
 -- a) Source table is sliced horizontally to create the view
 -- b) Used when data relates to different users entities
 -- c) They provide private table for each user, with rows needed by the user.
 -- d) Generally all columns of base tables are used to create this view
 --    but only some if its rows are visible through views
 
 -- 2) Veritcal View
 -- a) Slices the source table vertically
 -- b) Generally used when data stored in table is used by various users.
 -- c) They provide private virtual table for each user, composed of only 
 --    columns needed by that user

drop view HV1
drop view VV1

-- Types of Views
-- Horizontal View
select * from customers

create view HV1 as
select ID,FName, Age, City from Customers where ID=7

select * from HV1

create or replace view HV1 as
select FName, Age, City from Customers where Age>30

-- Vertical View (we can restrict access of Salary)
create view VV1 as
select ID, FName, LName, Age, City from Customers

select * from VV1


-- 3) Row/Column Subset View
-- a) A view created using a subset of records and lesser columns in order
-- to filter the records and hide confidential details
-- b) It slices base table in both horizontal and vertical direction

-- Ex1-  Row/Column Subset View
drop view RCSV1
create or replace view RCSV1 as 
select ID,FName, LName, Age, City from Customers
where Age>24

select * from RCSV1


-- 4) Gropued View
-- a) The query specified within view definition must contain group by clause
-- b) They perform the same function as grouped queries 

-- Ex1) Grouped View
drop view GV1
create or replace view GV1 as 
select City, avg(Age) as Avg_Age from customers
group by City

select * from GV1

-- 5) Joined View
-- a) Joined view is craeted such that is fetches data from 2 or 3 
-- different tables and presents them into a virtual table
-- b)  A single select table can be used against that view for selecting
-- appropriate data
 
select * from customers
-- ID,FName, Lname, Age, City, Salary
select * from orders
-- Order_ID,C_ID,Order_date, Transaction_Amt
 
drop view JV1

create or replace view JV1
(CID, FirstName, Age,Order_ID,OrderDate) as
select c.ID,c.fname, c.age, o.Order_ID,o.order_date
from customers c
inner join orders o
on c.ID = o.C_ID

select * from JV1

-- Updateing a View - Inserting ,deleting and update data
select * from VV1 order by ID
select * from customers

insert into VV1 values(11,'John','Spencer',24,'Delhi')

select * from customers

drop view NewV

create or replace view NewV as
select ID,FName,LName, Age, City from customers 
where city in ('Delhi','Mumbai')

select * from NewV
select * from customers

insert into NewV values(12,'Nikhil','Chauhan',23,'Chennai')
-- added to the base table
-- not addded to the view

select * from customers
select * from NewV


create or replace view Cust_Details1 as
select ID, FName, LName, Salary from Customers

select * from Cust_Details1
select * from Customers
-- insert into View
insert into Cust_Details1 values (13,'Abc','Def',27000)
-- Inserting a new record in view, inserts it in actual table


-- update a view
update Cust_Details1 set Salary=32000 where FName='abc'
-- Updating a record in view, updates it in actual table

-- delete from a view
delete from Cust_Details1 where FName='abc'
-- Deleting a record in view, deletes it in actual table


-- views
-- indexes
-- correlated sub query
-- nested sub query
-- sub query in differnt clauses
-- union and union all



-- Indexes
-- 1) They improve the speed of operations in a table.
-- 2) They are created using one or more columns providing 
--    basis for efficient ordering
-- 3) Indexes are also a type of tables, which keep primary
--    key or index field and a pointer to each record into the actual table.
-- 4) users cannot see the indexes, they are just used to speed up queries and 
--    will be used by the SQL to locate records very fast.
-- 5) Internal structure of Indexes are based on BTree

select * from stu1
show index from stu1

alter table Customers drop index I1

show index from customers

create index I1
on Customers (ID,FName)

create index I4
on customers (FName, Lname ,Age, City)



select count(*) from customers
select * from customers
show index from Customers

create index I2 on Customers (City)

create unique index I3 ON Customers (ID)

show index from Customers
show index from orders
-- drop an index
alter table Customers drop index I2

-- Ex1)
alter table customers
drop index I3 



-- Union, Union all and intersect
use demo2
show tables

drop table w1,w2

create table w1(
PID int not null primary key,
PName varchar(20),
Sales int
)

insert into w1 values
(12,'Cap',800),
(13,'Bottle',700),
(14,'Notebook',650),
(15,'Pen',250)

create table w2(
PID int not null primary key,
PName varchar(20),
Sales int,
Qty int
)

insert into w2 values
(11,'Soap',1100,30),
(13,'Bottle',700,10),
(16,'Mobile Charger',1500,12),
(18,'Bag',1350,4),
(15,'Pen',250,15)



-- Union
-- It combines the result set from multiple similar tables and 
-- returns distinct records into a single result set.

-- Rules
-- 1) The number and order of columns should be same
-- 2) The column name of the first SELECT query will be the 
--    column names of the output.


select * from w1
-- PID(12,13,14,15),PName, Sales
select * from w2
-- PID(11,13,15,16,18),PName, Sales, Qty

 
-- Ex1
select PID,PName, Sales from w1
union
select PID,PName, Sales from w2


-- Ex2
select PID,PName as Product, Sales from w1
union
select PID,PName, Sales from w2

-- Ex3
select PID,PName as P1, Sales from w1
union
select PID,PName as P2, Sales from w2

-- Ex4
select PID,PName, Sales from w1
union
select PID,PName as P2, Sales from w2


-- Ex4 -- Incorrect result
select PID,PName, Sales from w1
union
select PID, Sales,PName from w2

-- Ex5 -- Incorrect result
select PID,PName, Sales from w1
union
select PID,PName, Sales,Qty from w2

-- Union All
-- It combines the result set from multiple similar tables and 
-- returns records(which might include even dupliactes) into a
-- single result set.

select PID,PName, Sales from w1
union all
select PID,PName, Sales from w2

select PID,PName as P1, Sales from w1
union all
select PID,PName as P2, Sales from w2

-- intersect
-- It returns distinct records from both the tables

select PID,PName as P1, Sales from w1
where PID in (select  PID from w2)
 
select PID,PName, Sales from w1
union
select PID,PName, Sales from w2

select PID,PName, Sales from w1 where Sales>1000
union
select PID,PName, Sales from w2 where Sales>1000


select * from (
select PID,PName, Sales from w1
union
select PID,PName, Sales from w2
) as s
where s.Sales>1000
order by PName


